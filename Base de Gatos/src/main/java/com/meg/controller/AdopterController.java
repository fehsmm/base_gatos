package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adopter")
public class AdopterController {

    @GetMapping(value = "/adopter")
    public String adopter(){return "adopter/adopter";}

    @GetMapping(value = "/adopted-cat-list")
    public String adoptedCatList(){return "adopter/adopted-cat-list";}

    @GetMapping(value = "/post-adoption")
    public String postAdoption(){return "adopter/post-adoption";}
}
