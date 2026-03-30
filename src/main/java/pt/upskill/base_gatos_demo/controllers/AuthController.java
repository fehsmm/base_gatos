package pt.upskill.base_gatos_demo.controllers;

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

    @GetMapping(value = "/forgotPassword")
    public String forgotPasswordPage(){
        return "auth/forgot-password";
    }
    @PostMapping(value = "/signUpAction")
    public String signUpAction(SignUpModel signUp) {
        User user = authService.register(signUp);
        return "redirect:/auth/login";
    }

    @GetMapping(value = "/dashboard")
    public String dashboardPage() {
        User user = authService.getAuthenticatedUser();

        if (user.getRole().equals("VOLUNTEER")) {
            return "redirect:/volunteer/";
        } else if (user.getRole().equals("ADMIN")) {
            return "redirect:/admin/";
        } else {
            return "redirect:/adopter/";
        }
    }

    //post mapping login
    //post mapping signup
    //post mapping forgot password

    //perguntar sobre o excluir conta

}
