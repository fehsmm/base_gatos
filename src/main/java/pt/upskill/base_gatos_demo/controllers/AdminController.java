package pt.upskill.base_gatos_demo.controllers;

import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.models.*;
import pt.upskill.base_gatos_demo.repositories.*;
import pt.upskill.base_gatos_demo.services.AdoptionService;
import pt.upskill.base_gatos_demo.services.ShiftService;
import pt.upskill.base_gatos_demo.services.StockService;
import pt.upskill.base_gatos_demo.services.UserService;
import pt.upskill.base_gatos_demo.services.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    AdoptionService adoptionService;

    @Autowired
    StockService stockService;

    @Autowired
    ShiftService shiftService;

    @Autowired
    CatService catService;

    @Autowired
    NoteService noteService;

    @Autowired
    AnnouncementService announcementService;

    @Autowired
    AuthService authService;
    @Autowired
    private ReportService reportService;
    @Autowired
    MedicationRecordService medicationRecordService; //Fernanda adicionou

    @GetMapping(value = "/")
    public String admin(Model model) {
        List<Cat> cats = catService.getRecentCats();
        int pendingApproval = userService.countPendingApproval();
        int lowStock = stockService.countLowStockItems();
        List<Announcement> announcements = announcementService.getRecentAnnouncements();
        model.addAttribute("cats", cats);
        model.addAttribute("pendingUsersCount", pendingApproval);
        model.addAttribute("lowStockCount", lowStock);
        model.addAttribute("announcements", announcements);
        return "admin/admin";
    }

    @GetMapping(value = "/manage-application")
    public String manageApplication(Model model,
                                    @RequestParam(required = false) LocalDate dateStartFilter,
                                    @RequestParam(required = false) LocalDate dateEndFilter,
                                    @RequestParam(required = false) String statusFilter,
                                    @RequestParam(required = false) Boolean unreadFilter) {
        List<Adoption> adoptionApps = adoptionService.getAdoptions(dateStartFilter, dateEndFilter, statusFilter, unreadFilter);
        int pendingAdoptions = adoptionService.countPendingAdoptions();
        model.addAttribute("adoptionApps", adoptionApps);
        model.addAttribute("pendingAdoptions", pendingAdoptions);
        return "admin/manage-application";
    }

    @GetMapping(value = "/manage-schedule")
    public String manageSchedule(Model model) {
        LocalDate today = LocalDate.now();
        List<User> volunteers = userService.getVolunteers();
        int shiftCount = shiftService.getTotalShiftsForWeek(today);
        Map<String, List<Shift>> shiftsByDay = new LinkedHashMap<>();
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("EEE, dd MMM", new Locale("pt", "PT"));
        for (int i = 0; i < 7; i++) {
            LocalDate date = today.plusDays(i);
            List<Shift> shifts = shiftService.getShiftsByDate(date);
            shifts.sort(Comparator.comparing(Shift::getStartTime)); //usa o getStartTime de cada Shift para comparar
            String formattedDate = date.format(formatter);
            formattedDate = formattedDate.substring(0, 1).toUpperCase() + formattedDate.substring(1);
            shiftsByDay.put(formattedDate, shifts);
        }
        Map<Long, Integer> completedTasks = new HashMap<>();
        Map<Long, Integer> totalTasks = new HashMap<>();
        for (List<Shift> shiftList : shiftsByDay.values()) {
            for (Shift shift : shiftList) {
                completedTasks.put(shift.getId(), shiftService.getCompletedTasksCount(shift));
                totalTasks.put(shift.getId(), shiftService.getTotalTasksCount(shift));
            }
        }
        model.addAttribute("today", LocalDate.now());
        model.addAttribute("shiftsByDay", shiftsByDay);
        model.addAttribute("volunteers", volunteers);
        model.addAttribute("shiftCount", shiftCount);
        model.addAttribute("completedTasks", completedTasks);
        model.addAttribute("totalTasks", totalTasks);
        String todayFormatted = LocalDate.now().format(formatter);
        todayFormatted = todayFormatted.substring(0, 1).toUpperCase() + todayFormatted.substring(1);
        String tomorrowFormatted = LocalDate.now().plusDays(1).format(formatter);
        tomorrowFormatted = tomorrowFormatted.substring(0, 1).toUpperCase() + tomorrowFormatted.substring(1);
        model.addAttribute("todayFormatted", todayFormatted);
        model.addAttribute("tomorrowFormatted", tomorrowFormatted);
        model.addAttribute("activeMedications", medicationRecordService.getAllActiveToday()); //Fernanda add para ver as medicações realizadas
        List<MedicationRecord> meds = medicationRecordService.getAllActiveToday();
        Map<String, List<MedicationRecord>> medsByCat = new LinkedHashMap<>();
        for (MedicationRecord med : meds) {
            String catName = med.getCat().getName();
            medsByCat.computeIfAbsent(catName, k -> new ArrayList<>()).add(med);
        }
        model.addAttribute("medsByCat", medsByCat);
        return "admin/manage-schedule";
    }

    @GetMapping(value = "/manage-stock")
    public String manageStock(Model model,
                              @RequestParam(required = false) String productTypeFilter,
                              @RequestParam(required = false) String tagFilter) {
        List<Stock> stockList = stockService.getAllProducts(productTypeFilter, tagFilter);
        int lowStock = stockService.countLowStockItems();
        List<Stock> lowStockItems = stockService.getLowStockItems();
        List<String> tags = stockService.getTags();
        model.addAttribute("stockList", stockList);
        model.addAttribute("lowStockCount", lowStock);
        model.addAttribute("lowStockItems", lowStockItems);
        model.addAttribute("tags", tags);
        return "admin/manage-stock";
    }

    @GetMapping(value = "/manage-user")
    public String manageUser(Model model) {
        List<User> pendingUsers = userService.findPendingApproval();
        int pendingApproval = userService.countPendingApproval();
        model.addAttribute("pendingUsers", pendingUsers);
        model.addAttribute("pendingUsersCount", pendingApproval);
        return "admin/manage-user";
    }

    @GetMapping(value = "/post-announcement")
    public String postAnnouncement(Model model,
                                   @RequestParam(required = false) LocalDate dateStartFilter,
                                   @RequestParam(required = false) LocalDate dateEndFilter,
                                   @RequestParam(required = false) @Nullable String priorityFilter) {
        User user = authService.getAuthenticatedUser();
        List<Announcement> announcements = announcementService.getAnnouncements(dateStartFilter, dateEndFilter, priorityFilter);
        model.addAttribute("announcements", announcements);
        model.addAttribute("user", user);
        return "admin/post-announcement";
    }

    @GetMapping(value = "/vet")
    public String viewClinicalInformation() {
        return "admin/vet";
    }

    @GetMapping(value = "/manage-cat")
    public String manageCat(Model model,
                            @RequestParam(required = false) String nameFilter,
                            @RequestParam(required = false) String statusFilter) {
        List<Cat> cats = catService.listCats(nameFilter, statusFilter);
        int availableCats = catService.countAvailableCats();
        int adoptedCats = catService.countAdoptedCats();
        int allCats = catService.countAllCats();
        int inProcessCats = catService.countCatsInAdoptionProcess();
        model.addAttribute("cats", cats);
        model.addAttribute("availableCats", availableCats);
        model.addAttribute("adoptedCats", adoptedCats);
        model.addAttribute("allCats", allCats);
        model.addAttribute("inProcessCats", inProcessCats);
        return "admin/manage-cat";
    }

    @GetMapping(value = "/view-shift-note")
    public String viewShiftNote(Model model,
                                @RequestParam(required = false) LocalDate dateStartFilter,
                                @RequestParam(required = false) LocalDate dateEndFilter,
                                @RequestParam(required = false) @Nullable String priorityFilter) {
        List<Note> shiftNotes = noteService.getNotes();
        int unreadNotes = noteService.countUnreadNotes();
        model.addAttribute("shiftNotes", shiftNotes);
        model.addAttribute("unreadNotesCount", unreadNotes);
        return "admin/view-shift-note";
    }

    @GetMapping(value = "/view-adoption/{id}")
    public String viewAdoption(@PathVariable Long id, Model model) {
        Adoption adoption = adoptionService.getById(id);
        List<Report> reports = reportService.getReportsByUserAndCat(adoption.getUser(), adoption.getCat());
        model.addAttribute("adoption", adoption);
        model.addAttribute("reports", reports);
        return "admin/view-adoption";
    }

    @PostMapping(value = "/create-shift")
    public String createShift(@ModelAttribute CreateShiftModel model,
                              RedirectAttributes redirectAttributes) {
        shiftService.createShift(model);
        redirectAttributes.addFlashAttribute("success", "Turno criado com sucesso!");
        return "redirect:/admin/manage-schedule";
    }

    @PostMapping(value = "/delete-shift")
    public String deleteShift(@RequestParam("shiftId") Long shiftId,
                              RedirectAttributes redirectAttributes) {
        shiftService.deleteShift(shiftId);
        redirectAttributes.addFlashAttribute("success", "Turno eliminado com sucesso!");
        return "redirect:/admin/manage-schedule";
    }

    @PostMapping("/update-shift")
    public String updateShift(@ModelAttribute EditShiftModel model,
                              RedirectAttributes redirectAttributes) {
        shiftService.updateShift(model);
        redirectAttributes.addFlashAttribute("success", "Turno atualizado com sucesso!");
        return "redirect:/admin/manage-schedule";
    }

    @PostMapping(value = "/create-cat")
    public String createCat(@ModelAttribute CreateCatModel model, RedirectAttributes redirectAttributes) {
        catService.createCat(model);
        redirectAttributes.addFlashAttribute("success", "Gato registado com sucesso!");
        return "redirect:/admin/manage-cat";
    }

    @PostMapping(value = "/delete-cat")
    public String deleteCat(@RequestParam("catId") Long catId,
                            RedirectAttributes redirectAttributes) {
        catService.deleteCat(catId);
        redirectAttributes.addFlashAttribute("success", "Gato eliminado com sucesso!");
        return "redirect:/admin/manage-cat";
    }

    @PostMapping("/update-cat")
    public String updateCat(@ModelAttribute EditCatModel model,
                            RedirectAttributes redirectAttributes) {
        catService.updateCat(model);
        redirectAttributes.addFlashAttribute("success", "Gato atualizado com sucesso!");
        return "redirect:/admin/manage-cat";
    }

    @PostMapping(value = "/create-announcement")
    public String createAnnouncement(@ModelAttribute CreateAnnouncementModel model, RedirectAttributes redirectAttributes) {
        announcementService.createAnnouncement(model);
        redirectAttributes.addFlashAttribute("success", "Comunicado partilhado com sucesso!");
        return "redirect:/admin/post-announcement";
    }

    @PostMapping(value = "/delete-announcement")
    public String deleteAnnouncement(@RequestParam("announcementId") Long announcementId,
                                     RedirectAttributes redirectAttributes) {
        announcementService.deleteAnnouncement(announcementId);
        redirectAttributes.addFlashAttribute("success", "Comunicado eliminado com sucesso!");
        return "redirect:/admin/post-announcement";
    }

    @PostMapping("/update-announcement")
    public String updateAnnouncement(@ModelAttribute EditAnnouncementModel model,
                                     RedirectAttributes redirectAttributes) {
        announcementService.updateAnnouncement(model);
        redirectAttributes.addFlashAttribute("success", "Comunicado atualizado com sucesso!");
        return "redirect:/admin/post-announcement";
    }

    @PostMapping(value = "/create-stock")
    public String createStock(@ModelAttribute CreateStockModel model, RedirectAttributes redirectAttributes) {
        stockService.createStock(model);
        redirectAttributes.addFlashAttribute("success", "Produto criado com sucesso!");
        return "redirect:/admin/manage-stock";
    }

    @PostMapping(value = "/delete-stock")
    public String deleteStock(@RequestParam("stockId") Long stockId,
                              RedirectAttributes redirectAttributes) {
        stockService.deleteStock(stockId);
        redirectAttributes.addFlashAttribute("success", "Produto eliminado com sucesso!");
        return "redirect:/admin/manage-stock";
    }

    @PostMapping("/update-stock")
    public String updateStock(@ModelAttribute EditStockModel model,
                              RedirectAttributes redirectAttributes) {
        stockService.updateStock(model);
        redirectAttributes.addFlashAttribute("success", "Produto atualizado com sucesso!");
        return "redirect:/admin/manage-stock";
    }

    @PostMapping("/use-stock")
    public String useStock(@RequestParam("id") Long stockId,
                           @RequestParam("value") int value,
                           RedirectAttributes redirectAttributes) {
        stockService.useStock(stockId, value);
        redirectAttributes.addFlashAttribute("success", "Uso registado com sucesso!");
        return "redirect:/admin/manage-stock";
    }

    @PostMapping("/adoptions/{id}/approve")
    public String approve(@PathVariable Long id) {
        adoptionService.approveAdoption(id);
        return "redirect:/admin/manage-application";
    }

    @PostMapping("/adoptions/{id}/reject")
    public String reject(@PathVariable Long id,
                         @RequestParam("rejectionMotive") String rejectionMotive) {
        adoptionService.rejectAdoption(id, rejectionMotive);
        return "redirect:/admin/manage-application";
    }

    @PostMapping("/adoptions/mark-as-read/{id}")
    @ResponseBody
    public void markAsRead(@PathVariable Long id) {
        adoptionService.markAsRead(id);
    }

}

    //post mapping aceitar/rejeitar voluntarios
    //eliminar user
    //filtros na pagina de manage users

