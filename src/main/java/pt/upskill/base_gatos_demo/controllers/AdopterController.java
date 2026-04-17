package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.models.ReportModel;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.ReportRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.AdoptionService;
import pt.upskill.base_gatos_demo.services.ReportService;
import pt.upskill.base_gatos_demo.services.UserService;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/adopter")
public class AdopterController {

    @Autowired
    UserService userService;

    @Autowired
    AdoptionService adoptionService;

    @Autowired
    ReportService reportService;


    private void addLoggedUserToModel(Authentication authentication, Model model) {
        if (authentication != null) {
            String username = authentication.getName();
            User user = userService.getUsername(username);
            model.addAttribute("user", user);
        }
    }
    @GetMapping(value = "/")
    public String adopter(Authentication authentication, Model model){
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userService.getUsername(username);

        if (user == null) {
            return "redirect:/auth/login";
        }
        List<Adoption> adoptions = adoptionService.getUserAndStatus(user, "Aprovada");
        int reportCountByUser = reportService.getReportCount(username);
        model.addAttribute("adoptions", adoptions);
        model.addAttribute("reportCountByUser", reportCountByUser);
        return "adopter/adopter";
    }

    @GetMapping(value = "/adopted-cat-list")
    public String adoptedCatList(Authentication authentication, Model model){
        if (authentication == null) {
            return "redirect:/auth/login";
        }

        String username = authentication.getName();
        User user = userService.getUsername(username);
        List<Adoption> adoptions = adoptionService.getUserAndStatus(user, "Aprovada");
        model.addAttribute("adoptions", adoptions);
        model.addAttribute("user", user);

        return "adopter/adopted-cat-list";
    }

    @GetMapping(value = "/post-adoption")
    public String postAdoption(Model model, Principal principal){
            User user = userService.getUsername(principal.getName());

            List<Adoption> adoptions = adoptionService.getUserAndStatus(user, "Aprovada");

            List<Cat> cats = new ArrayList<>();

            for (Adoption adoption : adoptions) {
                cats.add(adoption.getCat());
            }

            List<Report> reports = reportService.getUser(user);

            model.addAttribute("cats", cats);
            model.addAttribute("reports", reports);

        return "adopter/post-adoption";
    }


    @PostMapping("/reports")
    public String submitReport(@ModelAttribute ReportModel reportModel,
                               Principal principal,
                               RedirectAttributes redirectAttributes) {

        reportService.processOfReport(reportModel, principal.getName());
        redirectAttributes.addFlashAttribute("success", "Relatório enviado!");
        return "redirect:/adopter/post-adoption";
    }

    //post mapping pos adocao monitoramento
}
