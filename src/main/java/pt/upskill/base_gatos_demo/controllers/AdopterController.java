package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.ReportRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/adopter")
public class AdopterController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AdoptionRepository adoptionRepository;

    @Autowired
    CatRepository catRepository;

    @Autowired
    ReportRepository reportRepository;


    private void addLoggedUserToModel(Authentication authentication, Model model) {
        if (authentication != null) {
            String username = authentication.getName();
            User user = userRepository.getUserByUsername(username);
            model.addAttribute("user", user);
        }
    }
    @GetMapping(value = "/")
    public String adopter(Authentication authentication, Model model){
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);

        if (user == null) {
            return "redirect:/auth/login";
        }
        List<Adoption> adoptions = adoptionRepository.findByUserAndStatus(user, "Aprovada");
        model.addAttribute("adoptions", adoptions);
        return "adopter/adopter";
    }

    @GetMapping(value = "/adopted-cat-list")
    public String adoptedCatList(Authentication authentication, Model model){
        if (authentication == null) {
            return "redirect:/auth/login";
        }

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);
        List<Adoption> adoptions = adoptionRepository.findByUserAndStatus(user, "Aprovada");
        model.addAttribute("adoptions", adoptions);
        model.addAttribute("user", user);

        return "adopter/adopted-cat-list";
    }

    @GetMapping(value = "/post-adoption")
    public String postAdoption(Model model, Principal principal){
            User user = userRepository.getUserByUsername(principal.getName());

            List<Adoption> adoptions =
                    adoptionRepository.findByUserAndStatus(user, "Aprovada");

            List<Cat> cats = new ArrayList<>();

            for (Adoption adoption : adoptions) {
                cats.add(adoption.getCat());
            }

            List<Report> reports = reportRepository.findByUser(user);

            model.addAttribute("cats", cats);
            model.addAttribute("reports", reports);

        return "adopter/post-adoption";
    }


    @PostMapping("/reports")
    public String submitReport(@RequestParam Long catId,
                               @RequestParam String status,
                               @RequestParam String notes,
                               @RequestParam(required = false) String health,
                               Principal principal,
                               RedirectAttributes redirectAttributes) {

        User user = userRepository.getUserByUsername(principal.getName());
        Cat cat = catRepository.findById(catId).orElse(null);

        Report report = new Report();
        report.setUser(user);
        report.setCat(cat);
        report.setStatus(status);
        report.setNotes(notes);
        report.setHealth(health);

        reportRepository.save(report);

        redirectAttributes.addFlashAttribute("success", "Relatório enviado!");

        return "redirect:/adopter/post-adoption";
    }

    //post mapping pos adocao monitoramento
}
