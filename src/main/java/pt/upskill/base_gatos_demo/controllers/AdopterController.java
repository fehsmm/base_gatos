package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.util.List;


@Controller
@RequestMapping("/adopter")
public class AdopterController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AdoptionRepository adoptionRepository;


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
    public String postAdoption(){return "adopter/post-adoption";}

    //post mapping pos adocao monitoramento
}
