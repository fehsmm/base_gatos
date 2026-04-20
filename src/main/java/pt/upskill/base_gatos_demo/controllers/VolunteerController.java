package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

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
    @Autowired
    MedicationRecordService medicationRecordService;
    @Autowired
    StockService stockService;

    @GetMapping("/")
    public String volunteer(Model model) {
        User user = authService.getAuthenticatedUser();
        if (user == null) return "redirect:/auth/login";
        model.addAttribute("user", user);
        LocalDate today = LocalDate.now();
        List<Shift> allShifts = shiftService.getShifts(null);

        Long upcomingCount = allShifts.stream()
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
        List<Shift> allShifts = shiftService.getAllShifts();

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
        List<Shift> allShifts = shiftService.getAllShifts();

        Shift todayShift = allShifts.stream()
                .filter(s -> s.getDate().equals(now.toLocalDate()) &&
                        !now.toLocalTime().isBefore(s.getStartTime()) &&
                        !now.toLocalTime().isAfter(s.getEndTime()))
                .findFirst()
                .orElse(null);
        if (todayShift != null) {
            model.addAttribute("todayShift", todayShift);

            boolean currentUserSubmittedNote = todayShift.getNotes().stream()
                    .anyMatch(n -> n.getAuthor() != null && n.getAuthor().getId().equals(user.getId()));
            model.addAttribute("currentUserSubmittedNote", currentUserSubmittedNote);

            boolean userIsActive = todayShift.getCurrentVolunteer() != null &&
                    todayShift.getCurrentVolunteer().getId().equals(user.getId());
            model.addAttribute("userIsActive", userIsActive);
            model.addAttribute("currentUserSubmittedNote", currentUserSubmittedNote);

            todayShift.getNotes().stream()
                    .filter(n -> n.getAuthor() != null && !n.getAuthor().getId().equals(user.getId()))
                    .findFirst()
                    .ifPresent(n -> model.addAttribute("sameShiftNote", n));
        }

        allShifts.stream()
                .filter(s -> s.getDate().isBefore(LocalDate.now()))
                .sorted(Comparator.comparing(Shift::getDate).reversed())
                .findFirst()
                .ifPresent(lastShift -> {
                    lastShift.getNotes().stream()
                            .filter(n -> !n.isRead())
                            .findFirst()
                            .ifPresent(n -> model.addAttribute("previousNote", n));
                });

        List<MedicationRecord> meds = medicationRecordService.getAllActiveToday();
        Map<String, List<MedicationRecord>> medsByCat = new LinkedHashMap<>();
        for (MedicationRecord med : meds) {
            medsByCat.computeIfAbsent(med.getCat().getName(), k -> new ArrayList<>()).add(med);
        }
        model.addAttribute("medsByCat", medsByCat);

        return "volunteer/view-shift";
    }

    @GetMapping("/manage-cat")
    public String manageCat(Model model,
                            @RequestParam(required = false) String nameFilter,
                            @RequestParam(required = false) String statusFilter) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        model.addAttribute("cats", catService.listAllCats(statusFilter, "all"));
        return "volunteer/manage-cat";
    }

    @GetMapping("/cat-profile/{name}")
    public String catProfile(@PathVariable String name) {
        List<Cat> cats = catRepository.findByName(name);
        if (cats.isEmpty()) return "redirect:/volunteer/manage-cat";
        return "redirect:/public/cat-profile/" + cats.get(0).getId();
    }

    @GetMapping("/view-announcement")
    public String viewAnnouncement(Model model,
                                   @RequestParam(required = false) String priorityFilter,
                                   @RequestParam(required = false) String dateStartFilter,
                                   @RequestParam(required = false) String dateEndFilter) {

        model.addAttribute("user", authService.getAuthenticatedUser());

        LocalDate startDate = (dateStartFilter != null && !dateStartFilter.isEmpty())
                ? LocalDate.parse(dateStartFilter) : null;
        LocalDate endDate = (dateEndFilter != null && !dateEndFilter.isEmpty())
                ? LocalDate.parse(dateEndFilter) : null;

        model.addAttribute("announcements",
                announcementService.getAnnouncements(startDate, endDate, priorityFilter));

        return "volunteer/view-announcement";
    }

    @GetMapping("/request-stock")
    public String requestStock(Model model) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        return "volunteer/request-stock";
    }

    @GetMapping("/shift-report")
    public String shiftReport(Model model,
                              @RequestParam(required = false) String search) {
        model.addAttribute("user", authService.getAuthenticatedUser());
        LocalDate today = LocalDate.now();
        List<Shift> allPastShifts = shiftService.getAllShifts().stream()
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

    @PostMapping("/start-shift/{id}")
    public String startShift(@PathVariable Long id) {
        User user = authService.getAuthenticatedUser();
        noteService.startShift(id, user);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/read-note/{id}")
    public String readNotes(@PathVariable Long id) {
        noteService.readNote(id);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/save-note/{id}")
    public String saveNote(@PathVariable Long id,
                           @RequestParam String summary,
                           @RequestParam String importantObservations,
                           @RequestParam(required = false, defaultValue = "normal") String priority) {
        User user = authService.getAuthenticatedUser();
        noteService.saveNote(id, summary, importantObservations, priority, user);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/complete-task/{id}")
    public String completeTask(@PathVariable Long id) {
        taskService.markCompleted(id);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/administer-medication/{id}")
    public String administerMedication(@PathVariable Long id) {
        medicationRecordService.markAdministered(id);
        return "redirect:/volunteer/view-shift";
    }

    @PostMapping("/request-stock")
    public String handleStockRequest(
            @RequestParam String item,
            @RequestParam int quantity,
            @RequestParam String observations) {

        stockService.requestStock(item, quantity, observations);

        return "redirect:/volunteer/request-stock?success=true";
    }
}


