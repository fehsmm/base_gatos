package pt.upskill.base_gatos_demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;
import pt.upskill.base_gatos_demo.repositories.TaskRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ShiftRepository shiftRepository;

    @Autowired
    TaskRepository taskRepository;

    @GetMapping(value="/")
    public ModelAndView admin(){
        ModelAndView mav = new ModelAndView("admin/admin");
        return mav;
    }

    @GetMapping(value = "/manage-application")
    public String manageApplication(){ return "admin/manage-application";}

    @GetMapping(value = "/manage-schedule")
    public String manageSchedule(Model model){
        List<User> volunteers = userRepository.findByRole("volunteer");
        model.addAttribute("volunteers", volunteers);

        List<Shift> shifts = shiftRepository.findAll();
        model.addAttribute("shifts", shifts);
        return "admin/manage-schedule";
    }

    @PostMapping(value = "/manage-schedule")
    public String createShift(
            @RequestParam("date") String date,
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime,
            @RequestParam("volunteerIds") List<Long> volunteerIds,
            @RequestParam(value = "taskDescriptions", required = false) List<String> taskDescriptions
    ){
        Shift shift = new Shift();
        shift.setDate(LocalDate.parse(date));
        shift.setStartTime(LocalTime.parse(startTime));
        shift.setEndTime(LocalTime.parse(endTime));

        // Associar voluntários
        List<User> volunteers = userRepository.findAllById(volunteerIds);
        shift.setVolunteers(volunteers);

        shiftRepository.save(shift);

        // Criar tarefas
        if (taskDescriptions != null) {
            for (String desc : taskDescriptions) {
                if (desc != null && !desc.trim().isEmpty()) {
                    Task task = new Task();
                    task.setDescription(desc.trim());
                    task.setShift(shift);
                    taskRepository.save(task);
                }
            }
        }

        return "redirect:/admin/manage-schedule";
    }

    @GetMapping(value = "/manage-stock")
    public String manageStock(){ return "admin/manage-stock";}

    @GetMapping(value = "/manage-user")
    public String manageUser(){ return "admin/manage-user";}

    @GetMapping(value = "/post-announcement")
    public String postAnnouncement(){ return "admin/post-announcement";}

    @GetMapping(value = "/vet")
    public String viewClinicalInformation(){ return "admin/vet";}

    //post mapping add cat
    //post mapping edit cat
    //perguntat sobre eliminar gato

    //post mapping criar escala

    //post mapping aceitar/rejeitar voluntarios
    //eliminar user
    //filtros na pagina de manage users

    //post mapping add stock
    //post mapping registar uso
    //post mapping atualizar?

    //put para atualizar
    //delete para excluir
    //calcular baixo stock

    //post mapping postar comunicado
    //delete comunicado
}
