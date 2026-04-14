package pt.upskill.base_gatos_demo.models;

import jakarta.persistence.Column;
import pt.upskill.base_gatos_demo.entities.Cat;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class EditMedicationRecordModel {

    private long id;
    private Cat cat;
    private String medicationName;
    private String dose;
    private String storageLocation;
    private LocalDate startDate;
    private LocalDate endDate;

    @Column(columnDefinition = "LONGTEXT")
    private String notes;

    private String updatedBy;

    public boolean isActiveToday() {
        LocalDate today = LocalDate.now();
        boolean started = startDate == null || !today.isBefore(startDate);
        boolean notEnded = endDate == null || !today.isAfter(endDate);
        return started && notEnded;
    }

    public String getFormattedEndDate() {
        if (endDate == null) return "Sem data de fim";
        return endDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getFormattedStartDate() {
        if (startDate == null) return "Sem data de início";
        return startDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public String getMedicationName() {
        return medicationName;
    }
    public void setMedicationName(String medicationName) {
        this.medicationName = medicationName;
    }
    public String getDose() {
        return dose;
    }
    public void setDose(String dose) {
        this.dose = dose;
    }
    public String getStorageLocation() {
        return storageLocation;
    }
    public void setStorageLocation(String storageLocation) {
        this.storageLocation = storageLocation;
    }
    public LocalDate getStartDate() {
        return startDate;
    }
    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }
    public LocalDate getEndDate() {
        return endDate;
    }
    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Cat getCat() {
        return cat;
    }

    public void setCat(Cat cat) {
        this.cat = cat;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
