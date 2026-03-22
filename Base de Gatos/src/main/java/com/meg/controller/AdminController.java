package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping(value="/admin")
    public String admin(){
        return "admin/admin";
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
}
