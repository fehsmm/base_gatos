package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ShiftRepository shiftRepository;

    private void addLoggedUserToModel(Authentication authentication, Model model) {
        if (authentication != null) {
            String username = authentication.getName();
            User user = userRepository.getUserByUsername(username);
            model.addAttribute("user", user);
        }
    }

    @GetMapping("/")
    public String volunteer(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);
        return "volunteer/volunteer";
    }

    @GetMapping("/view-schedule")
    public String viewSchedule(Authentication authentication, Model model) {
        addLoggedUserToModel(authentication, model);

        String username = authentication.getName();
        User user = userRepository.getUserByUsername(username);

        // Buscar todos os turnos do voluntário
        List<Shift> allShifts = shiftRepository.findByVolunteers_Id(user.getId());

        LocalDate today = LocalDate.now();

        // Separar em próximos e anteriores
        List<Shift> upcomingShifts = allShifts.stream()
                .filter(s -> !s.getDate().isBefore(today))
                .sorted((a, b) -> a.getDate().compareTo(b.getDate()))
                .collect(Collectors.toList());

        List<Shift> pastShifts = allShifts.stream()
                .filter(s -> s.getDate().isBefore(today))
                .sorted((a, b) -> b.getDate().compareTo(a.getDate()))
                .collect(Collectors.toList());

        model.addAttribute("upcomingShifts", upcomingShifts);
        model.addAttribute("pastShifts", pastShifts);
        model.addAttribute("upcomingCount", upcomingShifts.size());

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

    @GetMapping(value = "/manage-cat")
    public String manageCat(){return "volunteer/manage-cat";}
}

    //marcar tarefas como concluidas
    //nota de horario / comentario

    //post mapping pedido de stock

    //post mapping deixar notas de turno

