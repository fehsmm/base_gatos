package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.SignUpModel;
import pt.upskill.base_gatos_demo.repositories.UserRepository;
import pt.upskill.base_gatos_demo.services.AuthService;
import pt.upskill.base_gatos_demo.services.EmailService;
import pt.upskill.base_gatos_demo.services.UserService;

import java.time.LocalDateTime;
import java.util.UUID;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    AuthService authService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    EmailService emailService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private UserService userService;

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

    @GetMapping("/reset-password")
    public String showResetPassword(@RequestParam String token, Model model) {
        model.addAttribute("token", token);
        return "auth/reset-password";
    }

    @PostMapping(value = "/signUpAction")
    public String signUpAction(SignUpModel signUp) {
        User user = authService.register(signUp);
        return "redirect:/auth/login";
    }

    @GetMapping(value = "/dashboard")
    public String dashboardPage() {
        User user = authService.getAuthenticatedUser();

        if (user.getRole().equals("volunteer")) {
            return "redirect:/volunteer/";
        } else if (user.getRole().equals("admin")) {
            return "redirect:/admin/";
        } else {
            return "redirect:/adopter/";
        }
    }

    @PostMapping("/forgot-password")
    public String forgotPassword(@RequestParam String email, RedirectAttributes redirectAttributes) {
        User user = userService.getUserByEmail(email);
        String token = UUID.randomUUID().toString();

        user.setResetToken(token);
        user.setTokenExpiration(LocalDateTime.now().plusMinutes(30));

        userRepository.save(user);

        String link = "http://localhost:8080/auth/reset-password?token=" + token;

        emailService.sendEmail(
                user.getEmail(),
                "Recuperação de password",
                "Clique no link: " + link
        );

        redirectAttributes.addFlashAttribute("success", "Email enviado com sucesso!");

        return "redirect:/auth/login";
    }

    @PostMapping("/reset-password")
    public String resetPassword(
            @RequestParam String token,
            @RequestParam String newPassword) {

        User user = userRepository.findByResetToken(token)
                .orElseThrow(() -> new RuntimeException("Token inválido"));

        if (user.getTokenExpiration().isBefore(LocalDateTime.now())) {
            throw new RuntimeException("Token expirado");
        }

        user.setPassword(passwordEncoder.encode(newPassword));

        user.setResetToken(null);
        user.setTokenExpiration(null);

        userRepository.save(user);

        return "redirect:/auth/login";
    }

}
