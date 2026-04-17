package pt.upskill.base_gatos_demo.models;

import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class CreateCatModel {

    private MultipartFile photo;
    private String name;
    private String estimatedAge;
    private boolean gender;
    private String breed; //pelagem
    private String status;
    private LocalDate arrivalDate;
    private String description;
    private List<String> tags;

    private boolean fiv;
    private boolean felv;
    private boolean vaccination;
    private boolean parasiteControl;
    private boolean sterilization;

    public MultipartFile getPhoto() { return photo; }

    public void setPhoto(MultipartFile photo) { this.photo = photo; }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEstimatedAge() {
        return estimatedAge;
    }

    public void setEstimatedAge(String estimatedAge) {
        this.estimatedAge = estimatedAge;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public boolean isFiv() {
        return fiv;
    }

    public void setFiv(boolean fiv) {
        this.fiv = fiv;
    }

    public boolean isFelv() {
        return felv;
    }

    public void setFelv(boolean felv) {
        this.felv = felv;
    }

    public boolean isVaccination() {
        return vaccination;
    }

    public void setVaccination(boolean vaccination) {
        this.vaccination = vaccination;
    }

    public boolean isParasiteControl() {
        return parasiteControl;
    }

    public void setParasiteControl(boolean parasiteControl) {
        this.parasiteControl = parasiteControl;
    }

    public boolean isSterilization() {
        return sterilization;
    }

    public void setSterilization(boolean sterilization) {
        this.sterilization = sterilization;
    }
}
