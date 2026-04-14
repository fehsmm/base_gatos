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
import pt.upskill.base_gatos_demo.models.AdoptionForm;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.AdoptionService;
import pt.upskill.base_gatos_demo.services.AuthService;
import pt.upskill.base_gatos_demo.services.CatService;
import pt.upskill.base_gatos_demo.services.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/public")
public class PublicController {

    @Autowired
    private CatService catService;

    @Autowired
    private AdoptionService adoptionService;

    @Autowired
    private AuthService authService;

    @GetMapping(value = "/home")
    public String homePage(Model model){
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
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
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
        return "public/cat-list";
    }

    @GetMapping(value = "/adoption")
    public String adoption(Model model, Authentication authentication){
        List<Cat> availableCats = catService.getByStatus("Disponível");
        model.addAttribute("availableCats", availableCats);
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
        return "public/adoption";
    }

    @GetMapping(value="/cat-profile/{id}")
    public String catProfile(@PathVariable("id") Long id, Model model) {
        Cat cat = catService.getById(id);

        if (cat == null) {
            return "redirect:/public/cat-list";
        }
        List<Cat> cats = catService.listAllCats("all", "all");


        model.addAttribute("cat", cat);
        model.addAttribute("currentUser", authService.getAuthenticatedUser());



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
    public String contact(Model model){
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
        return "public/contact";}

    @GetMapping(value = "/donate")
    public String donate(Model model){
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
        return "public/donate";}

    //post mapping para o formulario de adocao
    @PostMapping("/adoptions")
    public String processAdoption(@ModelAttribute AdoptionForm adoptionForm,
                                  Principal principal,
                                  RedirectAttributes redirectAttributes) {


        if (principal == null) {
            redirectAttributes.addFlashAttribute("error",
                    "⚠️ Tem de iniciar sessão antes de submeter.");
            return "redirect:/public/adoption";
        }

           boolean successGetProcessAdoption = adoptionService.getProcessAdoption(principal.getName(),adoptionForm);

        if(!successGetProcessAdoption){
                redirectAttributes.addFlashAttribute("error", "Já submeteu candidatura para este gato!");
            }else{
                redirectAttributes.addFlashAttribute("success","Candidatura enviada com sucesso para o gato!");
            }

        return "redirect:/public/adoption";
    }

    @PostMapping("/contact")
    public String processContact(@RequestParam String name,
                                 @RequestParam String email,
                                 @RequestParam String subject,
                                 @RequestParam String message,
                                 Model model) {

        model.addAttribute("success", "Mensagem enviada com sucesso! Entraremos em contacto em breve.");
        model.addAttribute("currentUser", authService.getAuthenticatedUser());
        return "public/contact";
    }



}

