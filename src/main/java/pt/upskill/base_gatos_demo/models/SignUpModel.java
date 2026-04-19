package pt.upskill.base_gatos_demo.models;

public class SignUpModel {

    private String name;
    private String username;
    private String password;
    private String role;
    private Long telephone;
    private String address;
    private boolean approved;
    private String email;

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
        if(role.equals("adopter")) {
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
}
