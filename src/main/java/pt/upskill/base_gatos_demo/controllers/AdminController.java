package pt.upskill.base_gatos_demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping(value="/")
    public ModelAndView admin(){
        ModelAndView mav = new ModelAndView("admin/admin");
        return mav;
    }

    @GetMapping(value = "/manage-application")
    public String manageApplication(){ return "admin/manage-application";}

    @GetMapping(value = "/manage-schedule")
    public String manageSchedule(){ return "admin/manage-schedule";}

    @GetMapping(value = "/manage-stock")
    public String manageStock(){ return "admin/manage-stock";}

    @GetMapping(value = "/manage-user")
    public String manageUser(){ return "admin/manage-user";}

    @GetMapping(value = "/post-announcement")
    public String postAnnouncement(){ return "admin/post-announcement";}

    @GetMapping(value = "/vet")
    public String viewClinicalInformation(){ return "admin/vet";}

    //post mapping add cat
    //post mapping edit cat
    //perguntat sobre eliminar gato

    //post mapping criar escala

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
