package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.User;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByUsername(String username);

    List<User> findByRole(String role);

    List<User> findByApprovedFalse();

    User getUserById(Long id);

    Optional<User> findByEmail(String email);

    Optional<User> findByResetToken(String token);

    List<User> findTop8ByOrderByAccountCreationDesc();

    List<User> role(String role);

    List<User> findByNameContainingIgnoreCase(String nameFilter);

    List<User> findByNameContainingIgnoreCaseAndRole(String nameFilter, String roleFilter);

    List<User> findByNameContainingIgnoreCaseAndApprovedFalse(String nameFilter);

    List<User> findByRoleAndApprovedFalse(String roleFilter);

    List<User> findByNameContainingIgnoreCaseAndRoleAndApprovedFalse(String nameFilter, String roleFilter);
}
