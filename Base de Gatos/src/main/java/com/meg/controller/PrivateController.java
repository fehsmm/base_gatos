package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/private")
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
