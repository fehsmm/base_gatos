package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ShiftRepository extends JpaRepository<Shift, Long> {

    List<Shift> findByVolunteersContains(User volunteer);
    List<Shift> findByDate(LocalDate date);
    List<Shift> findByVolunteersContainsAndDate(User volunteer, LocalDate date);

    boolean existsByVolunteersContains(User user);

}