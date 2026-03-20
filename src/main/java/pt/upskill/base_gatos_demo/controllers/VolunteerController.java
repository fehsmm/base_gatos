package pt.upskill.base_gatos_demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VolunteerController {

    @GetMapping(value = "/volunteer")
    public String volunteer(){ return "volunteer/volunteer";}

    @GetMapping(value = "/leave-shift-note")
    public String leaveShiftNote(){return "volunteer/leave-shift-note";}

    @GetMapping(value = "/request-stock")
    public String requestStock(){return "volunteer/request-stock";}

    @GetMapping(value = "/view-announcement")
    public String viewAnnouncement(){return "volunteer/view-announcement";}

    @GetMapping(value = "/view-schedule")
    public String viewSchedule(){return "volunteer/view-schedule";}

    @GetMapping(value = "/leave-shift-note")
    public String viewShift(){return "volunteer/leave-shift-note";}
}
