package pt.upskill.base_gatos_demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    @GetMapping(value="/admin")
    public String admin(){
        return "admin";
    }
}
