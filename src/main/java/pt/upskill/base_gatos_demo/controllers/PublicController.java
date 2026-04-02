package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.CatService;
import pt.upskill.base_gatos_demo.services.UserService;

import java.util.List;

@Controller
@RequestMapping("/public")
public class PublicController {

    @Autowired
    private CatService catService;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CatRepository catRepository;
    @Autowired
    private AdoptionRepository adoptionRepository;

    @GetMapping(value = "/home")
    public String homePage(){
        return "public/home";
    }

    @GetMapping(value = "/cat-list")
    public String catList(Model model,
                          @RequestParam(required = false, defaultValue = "all") String status,
                          @RequestParam(required = false, defaultValue = "all") String gender,
                          //@RequestParam(required = false) String status,
                          //@RequestParam(required = false) String gender,
                          @RequestParam(required = false) boolean vaccination,
                          @RequestParam(required = false) boolean sterilization,
                          @RequestParam(required = false) boolean health) {
        List<Cat> cats = catService.listAllCats(status, gender);
        //List<Cat> cats = catService.listCats(status, gender, vaccination, sterilization, health);
        model.addAttribute("cats", cats);
        model.addAttribute("totalResults", cats.size());
        model.addAttribute("selectedStatus", status);
        model.addAttribute("selectedGender", gender);
        model.addAttribute("selectedVaccination", vaccination);
        model.addAttribute("selectedSterilization", sterilization);
        model.addAttribute("selectedHealth", health);
        return "public/cat-list";
    }

    @GetMapping(value = "/adoption")
    public String adoption(){
        return "public/adoption";
    }

    @GetMapping(value="/cat-profile/{id}")
    public String catProfile(@PathVariable("id") Long id, Model model) {
        Cat cat = catService.getById(id);

        if (cat == null) {
            return "redirect:/public/cat-list";
        }
        model.addAttribute("cat", cat);

        List<Cat> cats = catService.listAllCats("all", "all");

        int index = -1;
        for (int i = 0; i < cats.size(); i++) {
            if (cats.get(i).getId().equals(id)) {
                index = i;
                break;
            }
        }
        model.addAttribute("prevId", index > 0 ? cats.get(index - 1).getId() : null);
        model.addAttribute("nextId", index < cats.size() - 1 ? cats.get(index + 1).getId() : null);

        return "public/cat-profile";
    }

    @GetMapping(value = "/contact")
    public String contact(){ return "public/contact";}

    @GetMapping(value = "/donate")
    public String donate(){ return "public/donate";}

    //post mapping para o formulario de adocao
    @PostMapping("/adocao")
    public String processAdoption(@RequestParam Long catId,
                                  @RequestParam String applicantName,
                                  @RequestParam String email,
                                  @RequestParam String phone,
                                  @RequestParam String address,
                                  @RequestParam String reason,
                                  @RequestParam String experience,
                                  Authentication authentication,
                                  RedirectAttributes redirectAttributes) {

        Adoption adoption = new Adoption();

        Cat cat = catRepository.findById(catId).orElse(null);
        adoption.setCat(cat);

        User user = userRepository.getUserByUsername(authentication.getName());
        adoption.setUser(user);

        adoption.setApplicantName(applicantName);
        adoption.setEmail(email);
        adoption.setPhone(phone);
        adoption.setAddress(address);
        adoption.setReason(reason);
        adoption.setExperience(experience);

        adoptionRepository.save(adoption);

        redirectAttributes.addFlashAttribute("success", "Candidatura enviada com sucesso! Aguarde o nosso contacto.");
        return "redirect:/adocao";
    }

    //post mapping para formulario de doacao

    //post mapping para formulario de contacto
}

