package pt.upskill.base_gatos_demo.controllers;

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
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Autowired
    AdoptionService adoptionService;

    @Autowired
    CatRepository catRepository;

    @Autowired
    StockService stockService;

    @Autowired
    StockRepository stockRepository;

    @Autowired
    AnnouncementRepository announcementRepository;

    @Autowired
    ShiftService shiftService;

    @Autowired
    ShiftRepository shiftRepository;

    @Autowired
    AdoptionRepository adoptionRepository;

    @Autowired
    TaskService taskService;

    @Autowired
    CatService catService;

    @Autowired
    NoteRepository noteRepository;

    @Autowired
    NoteService noteService;

    @GetMapping(value="/")
    public String admin(Model model){
        List<Cat> cats = catRepository.findTop8ByOrderByArrivalDateDesc();
        int pendingApproval = userService.countPendingApproval();
        int lowStock = stockService.countLowStockItems();
        List<Announcement> announcements = announcementRepository.findTop6ByOrderByCreatedAtDesc();
        model.addAttribute("cats", cats);
        model.addAttribute("pendingUsersCount", pendingApproval);
        model.addAttribute("lowStockCount", lowStock);
        model.addAttribute("announcements", announcements);
        return "admin/admin";
    }

    @GetMapping(value = "/manage-application")
    public String manageApplication(Model model){

            List<Adoption> adoptions = adoptionRepository.findByStatus("Pendente");

            model.addAttribute("adoptions", adoptions);

            return "admin/manage-application";
    }

    @GetMapping(value = "/manage-schedule")
    public String manageSchedule(Model model){
        LocalDate today = LocalDate.now();
        Map<String, List<Shift>> shiftsByDay = new LinkedHashMap<>();
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("EEE, dd MMM", new Locale("pt", "PT"));
        for (int i = 0; i < 7; i++) {
            LocalDate date = today.plusDays(i);
            List<Shift> shifts = shiftRepository.findByDate(date);
            shifts.sort(Comparator.comparing(Shift::getStartTime)); //usa o getStartTime de cada Shift para comparar
            String formattedDate = date.format(formatter);
            formattedDate = formattedDate.substring(0,1).toUpperCase() + formattedDate.substring(1);
            shiftsByDay.put(formattedDate, shifts);
        }
        int shiftCount = shiftService.getTotalShiftsForWeek(today);
        List<User> volunteers = userRepository.findByRole("VOLUNTEER");
        List<AddTaskModel> tasks = new ArrayList<>();
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
        todayFormatted = todayFormatted.substring(0,1).toUpperCase() + todayFormatted.substring(1);
        String tomorrowFormatted = LocalDate.now().plusDays(1).format(formatter);
        tomorrowFormatted =  tomorrowFormatted.substring(0,1).toUpperCase() + tomorrowFormatted.substring(1);
        model.addAttribute("todayFormatted", todayFormatted);
        model.addAttribute("tomorrowFormatted", tomorrowFormatted);
        model.addAttribute("tasks", tasks);
        return "admin/manage-schedule";
    }

    @GetMapping(value = "/manage-stock")
    public String manageStock(Model model){
        List<Stock> stockList = stockRepository.findAll();
        model.addAttribute("stockList", stockList);
        return "admin/manage-stock";
    }

    @GetMapping(value = "/manage-user")
    public String manageUser(Model model){
        List<User> pendingUsers = userService.findPendingApproval();
        model.addAttribute("pendingUsers", pendingUsers);
        return "admin/manage-user";
    }

    @GetMapping(value = "/post-announcement")
    public String postAnnouncement(Model model){
        List<Announcement> announcements = announcementRepository.findAll();
        model.addAttribute("announcements", announcements);
        return "admin/post-announcement";
    }

    @GetMapping(value = "/vet")
    public String viewClinicalInformation(){ return "admin/vet";}

    @GetMapping(value = "/manage-cat")
    public String manageCat(Model model){
        List<Cat> cats = catRepository.findAll();
        int availableCats = catService.countAvailableCats();
        int adoptedCats = catService.countAdoptedCats();
        int allCats = catService.countAllCats();
        model.addAttribute("cats", cats);
        model.addAttribute("availableCats", availableCats);
        model.addAttribute("adoptedCats", adoptedCats);
        model.addAttribute("allCats", allCats);
        return "admin/manage-cat";
    }

    @GetMapping(value = "/view-shift-note")
    public String viewShiftNote(Model model){
        List<Note> shiftNotes = noteRepository.findAll();
        int unreadNotes = noteService.countUnreadNotes();
        model.addAttribute("shiftNotes", shiftNotes);
        model.addAttribute("unreadNotesCount", unreadNotes);
        return "admin/view-shift-note";
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

    @PostMapping("/adoptions/{id}/approve")
    public String approve(@PathVariable Long id) {
        adoptionService.approveAdoption(id);
        return "redirect:/admin/manage-application";
    }

    @PostMapping("/adoptions/{id}/reject")
    public String reject(@PathVariable Long id) {
        adoptionService.rejectAdoption(id, "Rejeitado");
        return "redirect:/admin/manage-application";
    }

    //ADICIONAR GATO - LISTA DE TAGS (ver como a das tarefas)

    //post mapping aceitar/rejeitar voluntarios
    //eliminar user
    //filtros na pagina de manage users

    //post mapping add stock
    //post mapping registar uso
    //post mapping atualizar?

    //put para atualizar
    //delete para excluir
    //calcular baixo stock

    //post mapping postar comunicado
    //delete comunicado
}
