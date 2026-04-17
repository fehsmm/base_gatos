package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

@Entity
public class User {
    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String username;
    private String password;
    private String role;
    private Long telephone;
    private String address;
    private String email;
    private boolean approved;

    private String resetToken;
    private LocalDateTime tokenExpiration;

    //Construtores para DataInitializer
    public User(String name, String username,String password, String role, Long telephone,String address, String email, boolean approved) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.role = role;
        this.telephone = telephone;
        this.address = address;
        this.email = email;
        this.approved = approved;
    }

    public User() {

    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getTelephone() {
        return telephone;
    }

    public void setTelephone(Long telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isAdmin() {
        if(role.equals("admin")) {
            return true;
        } else {
            return false;
        }
    }

    public boolean isVolunteer() {
        if(role.equals("volunteer")){
            return true;
        } else {
            return false;
        }
    }

    public boolean isAdopter() {
        if(role.equals("adopter")){
            return true;
        } else {
            return false;
        }
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResetToken() {
        return resetToken;
    }

    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }

    public LocalDateTime getTokenExpiration() {
        return tokenExpiration;
    }

    public void setTokenExpiration(LocalDateTime tokenExpiration) {
        this.tokenExpiration = tokenExpiration;
    }
}
