package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class Note {
    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    @JoinColumn(name = "shift_id")
    private Shift shift;

    private LocalDateTime updatedAt;
    private String priority;
    private List<Task> tasks;
    private String summary;
    private String importantObservations;

    @Column(name = "is_read")
    private boolean read = false;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Shift getShift() { return shift; }
    public void setShift(Shift shift) { this.shift = shift; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public boolean isRead() { return read; }
    public void setRead(boolean read) { this.read = read; }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getImportantObservations() {
        return importantObservations;
    }

    public void setImportantObservations(String importantObservations) {
        this.importantObservations = importantObservations;
    }
}