package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import jakarta.persistence.Column;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
public class Note {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "shift_id")
    private Shift shift;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;

    @Column(columnDefinition = "LONGTEXT")
    private String summary;

    @Column(columnDefinition = "LONGTEXT")
    private String importantObservations;

    private LocalDateTime updatedAt;
    private String priority;

    @Column(name = "is_read")
    private boolean read = false;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Shift getShift() { return shift; }
    public void setShift(Shift shift) { this.shift = shift; }

    public User getAuthor() { return author; }
    public void setAuthor(User author) { this.author = author; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public String getFormattedUpdatedAt() {
        if(updatedAt == null) {
            return "Sem data.";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm");
            return updatedAt.format(formatter);
        }
    }

    public boolean isRead() { return read; }
    public void setRead(boolean read) { this.read = read; }

    public String getPriority() { return priority; }
    public void setPriority(String priority) { this.priority = priority; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getImportantObservations() { return importantObservations; }
    public void setImportantObservations(String importantObservations) { this.importantObservations = importantObservations; }
}