package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.services.AuthService;
import pt.upskill.base_gatos_demo.services.CatService;
import pt.upskill.base_gatos_demo.services.MedicationRecordService;

import java.time.LocalDate;

@Controller
@RequestMapping("/admin/medication")
public class MedicationController {

    @Autowired
    private MedicationRecordService medService;

    @Autowired
    private CatService catService;

    @Autowired
    private AuthService authService;

    @GetMapping("/{catId}")
    public String viewMedications(@PathVariable Long catId, Model model) {
        model.addAttribute("cat", catService.getById(catId));
        model.addAttribute("medications", medService.getBycat(catId));
        return "admin/cat-medications";
    }

    @PostMapping("/create")
    public String create(@RequestParam Long catId,
                         @RequestParam String medicationName,
                         @RequestParam String dose,
                         @RequestParam(required = false) String storageLocation,
                         @RequestParam LocalDate startDate,
                         @RequestParam(required = false) LocalDate endDate,
                         @RequestParam(required = false) String notes,
                         RedirectAttributes redirectAttributes) {
        User user = authService.getAuthenticatedUser();
        String createdBy = user != null ? user.getName() : "Admin";
        medService.create(catId, medicationName, dose, storageLocation,
                startDate, endDate, notes, createdBy);
        redirectAttributes.addFlashAttribute("success", "Medicação adicionada com sucesso.");
        return "redirect:/admin/medication/" + catId;
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {
        Long catId = medService.getById(id).getCat().getId();
        medService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Medicação removida com sucesso.");
        return "redirect:/admin/medication/" + catId;
    }
}
