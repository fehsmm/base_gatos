package com.meg.controller;

import com.meg.entity.User;
import com.meg.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @Autowired
    UserRepository userRepository;

    private void addLoggedUserToModel(Authentication authentication, Model model) {
        if (authentication != null) {
            String username = authentication.getName();
            User user = userRepository.getUserByUsername(username);
            model.addAttribute("user", user);
        }
    }

    @GetMapping("")
    public String volunteer(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/volunteer";
    }

    @GetMapping("/view-schedule")
    public String viewSchedule(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/view-schedule";
    }

    @GetMapping("/view-shift")
    public String viewShift(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/view-shift";
    }

    @GetMapping("/view-announcement")
    public String viewAnnouncement(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/view-announcement";
    }

    @GetMapping("/request-stock")
    public String requestStock(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/request-stock";
    }

    @GetMapping("/leave-shift-note")
    public String leaveShiftNote(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/leave-shift-note";
    }
}