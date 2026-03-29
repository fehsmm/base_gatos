package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
public class Shift {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;
    @ManyToMany
    @JoinTable(
            name = "shift_volunteers",
            joinColumns = @JoinColumn(name = "shift_id"), //coluna deste lado
            inverseJoinColumns = @JoinColumn(name = "user_id") //inverso - coluna do outro lado
    )
    private List<User> volunteers;
    @OneToMany (mappedBy = "shift") //relação gerida pelo shift na classe task
    private List<Task> tasks;

    private LocalDate date;
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

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
