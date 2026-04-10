package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @Autowired
    AuthService authService;
    @Autowired
    ShiftService shiftService;
    @Autowired
    CatService catService;
    @Autowired
    AnnouncementService announcementService;
    @Autowired
    NoteService noteService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CatRepository catRepository;
    @Autowired
    TaskService taskService;

    @GetMapping("/")
    public String volunteer(Model model) {
        User user = authService.getAuthenticatedUser();
        if (user == null) return "redirect:/auth/login";
        model.addAttribute("user", user);
        LocalDate today = LocalDate.now();

        List<Shift> allShifts = shiftService.getShifts(null);

        long upcomingCount = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .count();

        allShifts.stream()
                .filter(s -> s.getDate().isBefore(today))
                .max(Comparator.comparing(Shift::getDate))
                .ifPresent(s -> model.addAttribute("previousNotes", s.getNotes()));

        model.addAttribute("upcomingCount", upcomingCount);
        return "volunteer/volunteer";
    }

    @GetMapping("/view-schedule")
    public String viewSchedule(Model model) {
        User user = authService.getAuthenticatedUser();
        model.addAttribute("user", user);
        LocalDate today = LocalDate.now();
        List<Shift> allShifts = shiftService.getShifts(null);

        List<Shift> upcomingShifts = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .sorted(Comparator.comparing(Shift::getDate))
                .collect(Collectors.toList());

        List<Shift> pastShifts = allShifts.stream()
                .filter(s -> s.getDate().isBefore(today))
                .sorted(Comparator.comparing(Shift::getDate).reversed())
                .collect(Collectors.toList());

        model.addAttribute("upcomingShifts", upcomingShifts);
        model.addAttribute("pastShifts", pastShifts);
        model.addAttribute("upcomingCount", upcomingShifts.size());
        return "volunteer/view-schedule";
    }

    @GetMapping("/view-shift")
    public String viewShift(Model model) {
        User user = authService.getAuthenticatedUser();
        model.addAttribute("user", user);
        LocalDateTime now = LocalDateTime.now();
        List<Shift> allShifts = shiftService.getShifts(null);

        List<Shift> todayShifts = allShifts.stream()
                .filter(s -> s.getDate().equals(now.toLocalDate()) &&
                        s.getStartTime().isBefore(now.toLocalTime()) &&
                        s.getEndTime().isAfter(now.toLocalTime()))
                .collect(Collectors.toList());

        allShifts.stream()
                .filter(s -> s.getEndedAt() != null && s.getEndedAt().isBefore(now))
                .max(Comparator.comparing(Shift::getEndedAt))
                .ifPresent(s -> model.addAttribute("previousShift", s));

        if (!todayShifts.isEmpty()) {
            model.addAttribute("todayShift", todayShifts.get(0));
        }
        return "volunteer/view-shift";
    }

    @GetMapping("/manage-cat")
    public String manageCat(Model model) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        model.addAttribute("cats", catService.listAllCats("all", "all"));
        return "volunteer/manage-cat";
    }

    @GetMapping("/cat-profile/{name}")
    public String catProfile(@PathVariable String name) {
        List<Cat> cats = catRepository.findByName(name);
        if (cats.isEmpty()) return "redirect:/volunteer/manage-cat";
        return "redirect:/public/cat-profile/" + cats.get(0).getId();
    }

    @GetMapping("/view-announcement")
    public String viewAnnouncement(Model model) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        model.addAttribute("announcements", announcementService.findAll());
        return "volunteer/view-announcement";
    }

    @GetMapping("/request-stock")
    public String requestStock(Model model) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        return "volunteer/request-stock";
    }

    @GetMapping("/leave-shift-note")
    public String leaveShiftNote(Model model) {
        User user = authService.getAuthenticatedUser();
        model.addAttribute("user", user);
        LocalDate today = LocalDate.now();
        shiftService.getShifts(null).stream()
                .filter(s -> s.getDate().equals(today))
                .findFirst()
                .ifPresent(s -> model.addAttribute("shift", s));
        return "volunteer/leave-shift-note";
    }

    @GetMapping("/shift-report")
    public String shiftReport(Model model,
                              @RequestParam(required = false) String search) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        LocalDate today = LocalDate.now();

        List<Shift> allPastShifts = shiftService.getShifts(null).stream()
                .filter(s -> !s.getDate().isAfter(today))
                .filter(s -> s.getEndedAt() != null)
                .sorted(Comparator.comparing(Shift::getDate).reversed())
                .collect(Collectors.toList());

        List<Shift> displayShifts;
        if (search != null && !search.isEmpty()) {
            displayShifts = allPastShifts.stream()
                    .filter(s -> s.getDate().toString().contains(search))
                    .collect(Collectors.toList());
        } else {
            displayShifts = allPastShifts.stream()
                    .filter(s -> s.getDate().getMonth() == today.getMonth()
                            && s.getDate().getYear() == today.getYear())
                    .collect(Collectors.toList());
        }

        model.addAttribute("shifts", displayShifts);
        model.addAttribute("search", search);
        return "volunteer/shift-report";
    }

    @PostMapping("/read-notes/{id}")
    public String readNotes(@PathVariable Long id) {
        noteService.readNote(id);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/start-shift/{id}")
    public String startShift(@PathVariable Long id) {
        noteService.startShift(id, authService.getAuthenticatedUser());
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/save-note/{id}")
    public String saveNote(@PathVariable Long id,
                           @RequestParam String summary,
                           @RequestParam String importantObservations) {
        noteService.saveNote(id, summary, importantObservations);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/update-note/{id}")
    public String updateNote(@PathVariable Long id,
                             @RequestParam String summary,
                             @RequestParam String importantObservations) {
        Shift shift = shiftService.getById(id);
        if (shift != null) {
            noteService.saveNote(shift, summary, importantObservations);
        }
        return "redirect:/volunteer/leave-shift-note";
    }

    @PostMapping("/complete-task/{id}")
    public String completeTask(@PathVariable Long id) {
        taskService.markCompleted(id);
        return "redirect:/volunteer/view-shift";
    }
}


//marcar tarefas como concluidas
//nota de horario / comentario

//post mapping pedido de stock

//post mapping deixar notas de turno

