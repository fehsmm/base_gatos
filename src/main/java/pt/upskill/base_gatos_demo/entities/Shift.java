package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.Date;
import java.util.List;

@Entity
public class Shift {
    @Id
    @GeneratedValue
    private Long id;

    private Date date;
    private List<User> volunteers;
    private List<Task> tasks;
    /*para dar aos voluntários horários específicos teriamos que queriar uma entidade ShiftAssignment
    que guarda um voluntario um tempo de inicio e um tempo de fim*/

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<User> getVolunteers() {
        return volunteers;
    }

    public void setVolunteers(List<User> volunteers) {
        this.volunteers = volunteers;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

}
