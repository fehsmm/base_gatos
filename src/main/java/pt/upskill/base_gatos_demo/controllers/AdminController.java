package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.models.CreateShiftModel;
import pt.upskill.base_gatos_demo.repositories.*;
import pt.upskill.base_gatos_demo.services.ShiftService;
import pt.upskill.base_gatos_demo.services.StockService;
import pt.upskill.base_gatos_demo.services.UserService;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Autowired
    CatRepository catRepository;

    @Autowired
    StockService stockService;

    @Autowired
    StockRepository stockRepository;

    @Autowired
    AnnouncementRepository announcementRepository;

    @Autowired
    private ShiftService shiftService;

    @GetMapping(value="/")
    public String admin(Model model){
        List<Cat> cats = catRepository.findAll();
        int pendingApproval = userService.countPendingApproval();
        int lowStock = stockService.countLowStockItems();
        List<Announcement> announcements = announcementRepository.findAll();
        model.addAttribute("cats", cats);
        model.addAttribute("pendingUsersCount", pendingApproval);
        model.addAttribute("lowStockCount", lowStock);
        model.addAttribute("announcements", announcements);
        return "admin/admin";
    }

    @GetMapping(value = "/manage-application")
    public String manageApplication(){ return "admin/manage-application";}

    @GetMapping(value = "/manage-schedule")
    public String manageSchedule(Model model){
        List<Shift> shifts = shiftService.getShifts(LocalDate.now());
        Map<LocalDate, List<Shift>> groupedShifts = shiftService.getShiftsGroupedByDate();
        List<User> volunteers = userRepository.findByRole("Volunteer");
        model.addAttribute("shifts", shifts);
        model.addAttribute("groupedShifts", groupedShifts);
        model.addAttribute("volunteers", volunteers);
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
        model.addAttribute("cats", cats);
        return "admin/manage-cat";
    }

    @GetMapping(value = "/view-shift-note")
    public String viewShiftNote(){return "admin/view-shift-note";}

    @PostMapping(value = "/create-shift")
    public String createShift(CreateShiftModel model){
        shiftService.createShift(model);
        return "redirect:/admin/manage-schedule";
    }

    //post mapping add cat
    //post mapping edit cat
    //perguntat sobre eliminar gato

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
