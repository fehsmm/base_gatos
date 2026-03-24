package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue
    private Long id;

    private String username;
    private String password;
    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isAdmin() {
        if(role == "Admin") {
            return true;
        } else {
            return false;
        }
    }

    public boolean isVolunteer() {
        if(role == "Volunteer"){
            return true;
        } else {
            return false;
        }
    }

    public boolean isAdopter() {
        if(role == "Adopter"){
            return true;
        } else {
            return false;
        }
    }

}
