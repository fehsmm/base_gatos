package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.repositories.TaskRepository;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    TaskRepository taskRepository;

    public void markCompleted(Long id) { // tarefas do Voluntário
        Task task = taskRepository.findById(id).orElse(null);
        if (task != null) {
            task.setCompleted(true);
            taskRepository.save(task);
        }
    }

}
