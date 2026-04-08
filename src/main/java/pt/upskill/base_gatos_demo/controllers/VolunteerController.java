package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.AnnouncementRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.AuthService;
import pt.upskill.base_gatos_demo.services.NoteService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    ShiftRepository shiftRepository;
    @Autowired
    CatRepository catRepository;
    @Autowired
    AnnouncementRepository announcementRepository;
    @Autowired
    NoteService noteService;
    @Autowired
    private AuthService authService;


    private void addLoggedUserToModel(Authentication authentication, Model model) {
        if (authentication != null) {
            String username = authentication.getName();
            User user = userRepository.getUserByUsername(username);
            model.addAttribute("user", user);
        }
    }

    @GetMapping("/")
    public String volunteer(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);

        if (user == null) {
            return "redirect:/auth/login";
        }

        LocalDate today = LocalDate.now();
        List<Shift> allShifts = shiftRepository.findByVolunteersContains(user);

        long upcomingCount = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .count();

        Optional<Shift> previousShift = allShifts.stream()
                .filter(s -> s.getDate().isBefore(today))
                .max((a, b) -> a.getDate().compareTo(b.getDate()));

        if (previousShift.isPresent()) {
            model.addAttribute("previousNotes", previousShift.get().getNotes());
        }

        model.addAttribute("upcomingCount", upcomingCount);
        return "volunteer/volunteer";
    }

    @GetMapping("/view-schedule")
    public String viewSchedule(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        List<Shift> allShifts = shiftRepository.findByVolunteersContains(user);
        LocalDate today = LocalDate.now();

        List<Shift> upcomingShifts = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .sorted((a, b) -> a.getDate().compareTo(b.getDate()))
                .collect(Collectors.toList());

        List<Shift> pastShifts = allShifts.stream()
                .filter(s -> s.getDate().isBefore(today))
                .sorted((a, b) -> b.getDate().compareTo(a.getDate()))
                .collect(Collectors.toList());

        model.addAttribute("upcomingShifts", upcomingShifts);
        model.addAttribute("pastShifts", pastShifts);
        model.addAttribute("upcomingCount", upcomingShifts.size());
        return "volunteer/view-schedule";
    }

    @GetMapping("/view-shift")
    public String viewShift(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        LocalDateTime now = LocalDateTime.now();

        List<Shift> allShifts = shiftRepository.findByVolunteersContains(user);

        List<Shift> todayShifts = allShifts.stream()
                .filter(s -> s.getDate().equals(now.toLocalDate()) &&
                        s.getStartTime().isBefore(now.toLocalTime()) &&
                        s.getEndTime().isAfter(now.toLocalTime()))
                .collect(Collectors.toList());

        Optional<Shift> previousShift = allShifts.stream()
                .filter(s -> s.getEndedAt() != null && s.getEndedAt().isBefore(now))
                .max(Comparator.comparing(Shift::getEndedAt));

        if (previousShift.isPresent()) {
            model.addAttribute("previousShift", previousShift.get());
        }

        if (!todayShifts.isEmpty()) {
            Shift todayShift = todayShifts.get(0);
            model.addAttribute("todayShift", todayShift);
        }

        return "volunteer/view-shift";
    }

    @GetMapping("/manage-cat")
    public String manageCat(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        List<Cat> cats = catRepository.findAll();
        model.addAttribute("cats", cats);
        return "volunteer/manage-cat";
    }

    @GetMapping("/cat-profile/{name}")
    public String catProfile(@PathVariable("name") String name) {
        List<Cat> cats = catRepository.findByName(name);
        if (cats.isEmpty()) {
            return "redirect:/volunteer/manage-cat";
        }
        return "redirect:/public/cat-profile/" + cats.get(0).getId();
    }

    @GetMapping("/view-announcement")
    public String viewAnnouncement(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        model.addAttribute("announcements", announcementRepository.findAll());
        return "volunteer/view-announcement";
    }

    @GetMapping("/request-stock")
    public String requestStock(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/request-stock";
    }

    @GetMapping("/leave-shift-note")
    public String leaveShiftNote(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        LocalDate today = LocalDate.now();

        List<Shift> todayShifts = shiftRepository.findByVolunteersContains(user)
                .stream()
                .filter(s -> s.getDate().equals(today))
                .collect(Collectors.toList());

        if (!todayShifts.isEmpty()) {
            model.addAttribute("shift", todayShifts.get(0));
        }

        return "volunteer/leave-shift-note";
    }

    @GetMapping("/shift-report")
    public String shiftReport(Authentication authentication, Model model,
                              @RequestParam(required = false) String search) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        LocalDate today = LocalDate.now();

        List<Shift> allPastShifts = shiftRepository.findByVolunteersContains(user)
                .stream()
                .filter(s -> s.getDate().isBefore(today))
                .filter(s -> s.getEndedAt() != null)
                .sorted((a, b) -> b.getDate().compareTo(a.getDate()))
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
    public String readNote(@PathVariable Long id) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null) {
            for(Note note : shift.getNotes()) {
                note.setRead(true);
                noteService.saveExistingNote(note);
            }
        }
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/start-shift/{id}")
    public String startShift(@PathVariable Long id) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null && shift.getStartedAt() == null) {
            shift.setStartedAt(LocalDateTime.now());
            shift.setCurrentVolunteer(authService.getAuthenticatedUser());
            shiftRepository.save(shift);
        }
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/save-note/{id}")
    public String saveNote(@PathVariable Long id,
                           @RequestParam String resumo,
                           @RequestParam String ocorrencias) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null) {
            shift.setEndedAt(LocalDateTime.now());
            shift.setCurrentVolunteer(null);
            shiftRepository.save(shift);
            noteService.saveNote(shift, resumo, ocorrencias);
        }
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/update-note/{id}")
    public String updateNote(@PathVariable Long id,
                             @RequestParam String resumo,
                             @RequestParam String ocorrencias) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null) {
            noteService.saveNote(shift, resumo, ocorrencias);
        }
        return "redirect:/volunteer/leave-shift-note";
    }
}
//marcar tarefas como concluidas
//nota de horario / comentario

//post mapping pedido de stock

//post mapping deixar notas de turno

