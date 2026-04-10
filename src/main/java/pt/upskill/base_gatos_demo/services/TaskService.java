package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.AddTaskModel;
import pt.upskill.base_gatos_demo.models.SignUpModel;
import pt.upskill.base_gatos_demo.repositories.TaskRepository;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    TaskRepository taskRepository;

    public List<Task> getTasksByShiftId(Long shiftId) {
        return taskRepository.findAllByShiftId(shiftId);
    }

    public Task createTask (AddTaskModel model) {
        Task task = new Task();
        task.setTitle(model.getTitle());
        task.setDescription(model.getDescription());
        task.setCompleted(false);
        return taskRepository.save(task);
    }

    public void markCompelted(Task task) {
        task.setCompleted(true);
        taskRepository.save(task);
    }

}
