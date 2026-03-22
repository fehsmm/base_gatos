package com.meg.controller;

import com.meg.entity.User;
import com.meg.models.SignUpModel;
import com.meg.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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

    @GetMapping(value = "/forgotPassword")
    public String forgotPasswordPage(){
        return "auth/forgot-password";
    }
    @PostMapping(value = "/signUpAction")
    public String signUpAction(SignUpModel signUp) {
        User user = authService.register(signUp);
        return "auth/login";
    }

}
