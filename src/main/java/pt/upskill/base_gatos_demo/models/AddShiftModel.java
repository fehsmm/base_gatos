package pt.upskill.base_gatos_demo.models;

import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.entities.User;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class AddShiftModel {

    private LocalDate date;
    private List<User> volunteers;
    private List<Task> tasks;
    private LocalTime startTime;
    private LocalTime endTime;

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
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
