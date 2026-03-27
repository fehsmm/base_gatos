package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "cat_list")
public class Cat {
    @Id
    @GeneratedValue
    private Long id;

    private String image;
    private String name;
    private String estimatedAge;
    private boolean gender;
    private String breed; //pelagem
    private String status;
    private Date arrivalDate;
    private String description;
    private String tags;

    private boolean fiv;
    private boolean felv;
    private boolean vaccination;
    private boolean parasiteControl;
    private boolean sterilization;
    private boolean health = isHealthy();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

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

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
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

    public boolean isHealthy() {
        if(fiv && felv) {
            return true;
        } else {
            return false;
        }
    }
}
