package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.services.CatService;

import java.util.List;

@Controller
@RequestMapping("/public")
public class PublicController {

    @Autowired
    private CatService catService;

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
        return "public/cat-profile";
    }

    @GetMapping(value = "/contact")
    public String contact(){ return "public/contact";}

    @GetMapping(value = "/donate")
    public String donate(){ return "public/donate";}

    //post mapping para o formulario de adocao

    //post mapping para formulario de doacao

    //post mapping para formulario de contacto
}

