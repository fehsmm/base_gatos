package pt.upskill.base_gatos_demo.services;

import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.AddTaskModel;
import pt.upskill.base_gatos_demo.models.CreateShiftModel;
import pt.upskill.base_gatos_demo.models.EditShiftModel;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;
import pt.upskill.base_gatos_demo.repositories.TaskRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class ShiftService {

    @Autowired
    ShiftRepository shiftRepository;

    @Autowired
    AuthService authService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    TaskRepository taskRepository;

    public List<Shift> getShifts (@Nullable LocalDate date) {
        User user = authService.getAuthenticatedUser();
        if (user.isVolunteer()) {
            if(date == null) {
                return shiftRepository.findByVolunteers_Id(user.getId());
            } else {
                return shiftRepository.findByVolunteers_IdAndDate(user.getId(), date);
            }
        }
        if (user.isAdmin()) {
            if(date == null) {
                return shiftRepository.findAll();
            } else {
                return shiftRepository.findByDate(date);
            }
        }
        return new ArrayList<>();
    }

    public int getTotalShiftsForWeek (LocalDate date) {
        int shiftCount = 0;
        for (int i = 0; i < 7; i++) {
            date = date.plusDays(i);
            List<Shift> shifts = shiftRepository.findByDate(date);
            shiftCount = shiftCount + shifts.size();
        }
        return shiftCount;
    }

    public int getCompletedTasksCount(Shift shift) {
        int completedTasks = 0;
        for (Task task : shift.getTasks()) {
            if (task.isCompleted()) {
                completedTasks++;
            }
        }
        return completedTasks;
    }

    public int getTotalTasksCount(Shift shift) {
        if (shift.getTasks() == null) {
            return 0;
        } else {
            return shift.getTasks().size();
        }
    }

    public Shift getById(Long id) {
        return  shiftRepository.getReferenceById(id);
    }

    public void createShift(CreateShiftModel shiftModel) {
        Shift  shift = new Shift();
        shift.setDate(shiftModel.getDate());
        shift.setStartTime(shiftModel.getStartTime());
        shift.setEndTime(shiftModel.getEndTime());

        List<User> volunteers = userRepository.findAllById(shiftModel.getVolunteerIds());
        shift.setVolunteers(volunteers);
        shiftRepository.save(shift);

        List<Task> tasks = new ArrayList<>();
        if (shiftModel.getTasks() != null) {
            for (AddTaskModel t : shiftModel.getTasks()) {
                Task task = new Task();
                task.setTitle(t.getTitle());
                task.setDescription(t.getDescription());
                task.setCompleted(false);
                task.setShift(shift);
                tasks.add(task);
                taskRepository.save(task);
            }
        }
        shift.setTasks(tasks);
        shiftRepository.save(shift);
    }

    public void updateShift(EditShiftModel model) {
        Shift shift = getById(model.getId());
        shift.setDate(model.getDate());
        shift.setStartTime(model.getStartTime());
        shift.setEndTime(model.getEndTime());

        List<User> volunteers = userRepository.findAllById(model.getVolunteerIds());
        shift.setVolunteers(volunteers);

        List<Task> tasks = new ArrayList<>();
        if (model.getTasks() != null) {
            for (AddTaskModel t : model.getTasks()) {
                Task task = new Task();
                task.setTitle(t.getTitle());
                task.setDescription(t.getDescription());
                task.setShift(shift);
                tasks.add(task);
                taskRepository.save(task);
            }
        }
        shift.setTasks(tasks);
        shiftRepository.save(shift);
    }

    public void deleteShift(Long id){
        shiftRepository.deleteById(id);
    }

}