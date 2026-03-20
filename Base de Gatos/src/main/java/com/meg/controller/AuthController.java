package com.meg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.SignUpModel;
import pt.upskill.base_gatos_demo.services.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    AuthService authService;

    @GetMapping(value = "/login")
    public String loginPage() {
        return "auth/login";
    }


    @GetMapping(value = "/signup")
    public String signUpPage() {
        return "auth/signup";
    }

    @PostMapping(value = "/signUpAction")
    public String signUpAction(SignUpModel signUp) {
        User user = authService.register(signUp);
        return "auth/login";
    }

}
