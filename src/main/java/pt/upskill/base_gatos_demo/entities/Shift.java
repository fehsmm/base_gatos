package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Shift {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToMany
    @JoinTable(
            name = "shift_volunteers",
            joinColumns = @JoinColumn(name = "shift_id"), //coluna deste lado
            inverseJoinColumns = @JoinColumn(name = "user_id") //inverso - coluna do outro lado
    )
    private List<User> volunteers = new ArrayList<>();
    @OneToMany (mappedBy = "shift", cascade = CascadeType.ALL) //relação gerida pelo shift na classe task
    private List<Task> tasks = new ArrayList<>();

    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
    private LocalDateTime startedAt;
    private LocalDateTime endedAt;

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

    public LocalDateTime getEndedAt() {
        return endedAt;
    }

    public void setEndedAt(LocalDateTime endedAt) {
        this.endedAt = endedAt;
    }

    public LocalDateTime getStartedAt() {
        return startedAt;
    }

    public void setStartedAt(LocalDateTime startedAt) {
        this.startedAt = startedAt;
    }
}
