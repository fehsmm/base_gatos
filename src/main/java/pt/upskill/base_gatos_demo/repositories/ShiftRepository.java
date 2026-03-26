package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Shift;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Repository
public interface ShiftRepository extends JpaRepository<Shift, Long> {

    // Buscar todos os turnos de um voluntário pelo seu ID
    List<Shift> findAllByVolunteersId(Long userId);

    // Encontrar turno por data
    Shift findByDate(LocalDate date);

    // Turnos futuros de um voluntário
    List<Shift> findAllByVolunteersIdAndDateAfter(Long userId, LocalDate date);

    // Turnos passados de um voluntário
    List<Shift> findAllByVolunteersIdAndDateBefore(Long userId, LocalDate date);
}