package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

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

    public List<User> findPendingApproval() {
        return userRepository.findByApprovedFalse();
    }

    public void approveUser(Long id) {
        User user = userRepository.getUserById(id);
        user.setApproved(true);
        userRepository.save(user);
    }

    public void rejectUser(Long id) {
        userRepository.deleteById(id);
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
}
