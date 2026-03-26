package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Shift;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ShiftRepository extends JpaRepository<Shift, Long> {

    List<Shift> findByVolunteers_Id(Long userId);
    List<Shift> findByDate(LocalDate date);
    List<Shift> findByVolunteers_IdAndDate(Long id, LocalDate date); //ERRADO

}