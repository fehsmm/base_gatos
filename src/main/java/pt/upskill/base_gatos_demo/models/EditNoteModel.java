package pt.upskill.base_gatos_demo.models;

import pt.upskill.base_gatos_demo.entities.Shift;

import java.time.LocalDateTime;

public class EditNoteModel {

    private Long id;
    private Shift shift;
    private String summary;
    private String importantObservations;
    private LocalDateTime updatedAt;
    private String priority;
    private boolean read;

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
