package pt.upskill.base_gatos_demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrivateController {

    @GetMapping(value = "/full-cat-list")
    public String viewFullCatList(){return "private/full-cat-list";}

    @GetMapping(value = "/full-cat-profile")
    public String viewFullCatProfile(){return "private/full-cat-profile";}

    @GetMapping(value = "/manage-cat")
    public String manageCat(){return "private/manage-cat";}

    @GetMapping(value = "/view-shift-note")
    public String viewShiftNote(){return "private/view-shift-note";}
}
