package pt.upskill.base_gatos_demo.models;

import pt.upskill.base_gatos_demo.entities.Schedule;
import pt.upskill.base_gatos_demo.entities.Task;
import pt.upskill.base_gatos_demo.entities.User;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class CreateShiftModel {

    private LocalDate date;
    private List<Long> volunteerIds;
    private List<AddTaskModel> tasks;
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

    public List<Long> getVolunteerIds() {
        return volunteerIds;
    }

    public void setVolunteerIds(List<Long> volunteerIds) {
        this.volunteerIds = volunteerIds;
    }

    public List<AddTaskModel> getTasks() {
        return tasks;
    }

    public void setTasks(List<AddTaskModel> tasks) {
        this.tasks = tasks;
    }
}
