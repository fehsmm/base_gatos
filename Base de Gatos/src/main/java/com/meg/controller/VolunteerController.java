package com.meg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard_volunteer";
    }

    @GetMapping("/tasks")
    public String tasks() {
        return "tasks_volunteer";
    }

    @GetMapping("/task-details")
    public String taskDetails() {
        return "task_details";
    }

    @GetMapping("/notes")
    public String notes() {
        return "notes_previous";
    }
}