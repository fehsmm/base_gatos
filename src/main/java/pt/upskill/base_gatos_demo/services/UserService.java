package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public int countPendingApproval() {
        int pendingApproval = 0;
        for(User user : userRepository.findAll()) {
            if(!user.isApproved()) {
                pendingApproval++;
            }
        }
        return pendingApproval;
    }

    public void approveUser(Long id) {
        User user = userRepository.getUserById(id);
        user.setApproved(true);
        userRepository.save(user);
    }

    public void rejectUser(Long id) {
        User user = userRepository.getUserById(id);
        user.setRole("adopter");
        user.setApproved(true);
        userRepository.save(user);
        //ao rejeitar uma conta de voluntário, não apaga a conta, fica com uma conta de adotante
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<User> getVolunteers() {
        return userRepository.findByRole("volunteer");
    }

    public User getUsername(String username) {
        return userRepository.getUserByUsername(username);
    }

    public User getUserByEmail (String email) {
        return userRepository.findByEmail(email);
    }

    public List<User> getUsers(String nameFilter, String roleFilter, Boolean pendingFilter) {
        List<User> users = new ArrayList<>();
        if((nameFilter == null || nameFilter.isEmpty()) && (roleFilter == null || roleFilter.isEmpty()) &&
                (pendingFilter == null || !pendingFilter)) {
            //todos vazios
            users = userRepository.findTop8ByOrderByAccountCreationDesc();
        } else if ((nameFilter != null && !nameFilter.isEmpty()) && (roleFilter == null || roleFilter.isEmpty()) &&
                (pendingFilter == null || !pendingFilter)) {
            //só nome
            users = userRepository.findByNameContainingIgnoreCase(nameFilter);
        } else if ((nameFilter == null || nameFilter.isEmpty()) && (roleFilter != null && !roleFilter.isEmpty()) &&
                (pendingFilter == null || !pendingFilter)) {
            //só role
            users = userRepository.findByRole(roleFilter);
        } else if ((nameFilter == null || nameFilter.isEmpty()) && (roleFilter == null || roleFilter.isEmpty()) &&
                (pendingFilter != null && pendingFilter)) {
            //só pending
            users = userRepository.findByApprovedFalse();
        } else if((nameFilter != null && !nameFilter.isEmpty()) && (roleFilter != null && !roleFilter.isEmpty()) &&
                (pendingFilter == null || !pendingFilter)) {
            //só nome e role
            users = userRepository.findByNameContainingIgnoreCaseAndRole(nameFilter, roleFilter);
        } else if((nameFilter != null && !nameFilter.isEmpty()) && (roleFilter == null || roleFilter.isEmpty()) &&
                (pendingFilter != null && pendingFilter)) {
            //só nome e pending
            users = userRepository.findByNameContainingIgnoreCaseAndApprovedFalse(nameFilter);
        } else if((nameFilter == null || nameFilter.isEmpty()) && (roleFilter != null && !roleFilter.isEmpty()) &&
                (pendingFilter != null && pendingFilter)) {
            //só pending e role
            users = userRepository.findByRoleAndApprovedFalse(roleFilter);
        } else if((nameFilter != null && !nameFilter.isEmpty()) && (roleFilter != null && !roleFilter.isEmpty()) &&
                (pendingFilter != null && pendingFilter)) {
            //todos
            users = userRepository.findByNameContainingIgnoreCaseAndRoleAndApprovedFalse(nameFilter, roleFilter);
        }
        users.sort((a, b) -> b.getAccountCreation().compareTo(a.getAccountCreation()));
        return users;
    }
}
