package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByUsername(String username);

    List<User> findByRole(String role);

    List<User> findByApprovedFalse();

    User getUserById(Long id);
}
