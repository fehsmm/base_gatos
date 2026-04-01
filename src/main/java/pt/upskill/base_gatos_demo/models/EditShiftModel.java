package pt.upskill.base_gatos_demo.models;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class EditShiftModel {

    private Long id;

    private LocalDate date;
    private List<Long> volunteerIds;
    private List<AddTaskModel> tasks;
    private LocalTime startTime;
    private LocalTime endTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
