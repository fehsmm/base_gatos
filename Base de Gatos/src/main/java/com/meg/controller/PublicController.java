package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/public")
public class PublicController {

    @GetMapping(value = "/home")
    public String homePage(){
        return "public/home";
    }

    @GetMapping(value = "/cat-list")
    public String catList(){
        return "public/cat-list";
    }

    @GetMapping(value = "/adoption")
    public String adoption(){
        return "public/adoption";
    }

    @GetMapping(value = "/cat-profile")
    public String catProfile(){
        return "public/cat-profile";
    }

    @GetMapping(value = "/contact")
    public String contact(){ return "public/contact";}

    @GetMapping(value = "/donate")
    public String donate(){ return "public/donate";}
}


