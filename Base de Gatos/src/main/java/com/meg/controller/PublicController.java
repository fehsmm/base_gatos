package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicController {

    @GetMapping(value = "/home")
    public String homePage(){
        return "home";
    }

    @GetMapping(value = "/cat-list")
    public String catList(){
        return "cat-list";
    }

    @GetMapping(value = "/adoption")
    public String adoption(){
        return "adoption";
    }

    @GetMapping(value = "/cat-profile")
    public String catProfile(){
        return "cat-profile";
    }

    @GetMapping(value = "/contact")
    public String contact(){ return "contact";}

    @GetMapping(value = "/donate")
    public String donate(){ return "donate";}
}

