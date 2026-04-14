package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateAnnouncementModel;
import pt.upskill.base_gatos_demo.models.CreateMedicationRecordModel;
import pt.upskill.base_gatos_demo.models.EditAnnouncementModel;
import pt.upskill.base_gatos_demo.models.EditMedicationRecordModel;
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

    @PostMapping(value = "/create-medication")
    public String createMedication(@ModelAttribute CreateMedicationRecordModel model,
                                     @RequestParam Long catId,
                                     RedirectAttributes redirectAttributes) {
        medService.createMedication(catId, model);
        redirectAttributes.addFlashAttribute("success", "Medicação adicionada com sucesso!");
        return "redirect:/admin/medication/" + catId;
    }

    @PostMapping(value = "/delete-medication")
    public String deleteAnnouncement(@RequestParam("medicationId") Long medicationId,
                                     RedirectAttributes redirectAttributes) {
        Long catId = medService.getById(medicationId).getCat().getId();
        medService.deleteMedication(medicationId);
        redirectAttributes.addFlashAttribute("success", "Medicação eliminada com sucesso!");
        return "redirect:/admin/medication/" + catId;
    }

    @PostMapping("/update-medication")
    public String updateAnnouncement(@ModelAttribute EditMedicationRecordModel model,
                                     RedirectAttributes redirectAttributes) {
        medService.updateMedication(model);
        redirectAttributes.addFlashAttribute("success", "Medicação atualizada com sucesso!");
        return "redirect:/admin/medication/" + model.getCatId();
    }
}
