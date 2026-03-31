package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.AnnouncementRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.NoteService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @Autowired UserRepository userRepository;
    @Autowired ShiftRepository shiftRepository;
    @Autowired CatRepository catRepository;
    @Autowired AnnouncementRepository announcementRepository;
    @Autowired NoteService noteService;


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

        List<Shift> allShifts = shiftRepository.findByVolunteers_Id(user.getId());
        LocalDate today = LocalDate.now();

        long upcomingCount = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .count();

        model.addAttribute("upcomingCount", upcomingCount);
        return "volunteer/volunteer";
    }

    @GetMapping("/view-schedule")
    public String viewSchedule(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        List<Shift> allShifts = shiftRepository.findByVolunteers_Id(user.getId());
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

        LocalDate today = LocalDate.now();
        List<Shift> todayShifts = shiftRepository.findByVolunteers_Id(user.getId())
                .stream()
                .filter(s -> s.getDate().equals(today))
                .collect(Collectors.toList());

        model.addAttribute("todayShift", todayShifts.isEmpty() ? null : todayShifts.get(0));
        return "volunteer/view-shift";
    }

    @GetMapping("/manage-cat")
    public String manageCat(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        List<Cat> cats = catRepository.findAll();
        model.addAttribute("cats", cats);
        return "volunteer/manage-cat";
    }

    @GetMapping("/cat-profile/{id}")
    public String catProfile(@PathVariable("id") Long id) {
        return "redirect:/public/cat-profile/" + id;
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
        return "volunteer/leave-shift-note";
    }

    @PostMapping("/start-shift/{id}")
    public String startShift(@PathVariable Long id) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null && shift.getStartedAt() == null) {
            shift.setStartedAt(LocalDateTime.now());
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
            shiftRepository.save(shift);
            noteService.saveNote(shift, resumo, ocorrencias);
        }
        return "redirect:/volunteer/view-shift";
    }
}
    //marcar tarefas como concluidas
    //nota de horario / comentario

    //post mapping pedido de stock

    //post mapping deixar notas de turno

