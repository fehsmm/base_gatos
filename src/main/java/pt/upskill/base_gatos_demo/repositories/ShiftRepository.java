package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Shift;

import java.util.Date;
import java.util.List;

@Repository
public interface ShiftRepository extends JpaRepository<Shift, Long> {

    List<Shift> findAllByVolunteerId(Long id);
    Shift findByDate(Date date);

    //lista de turnos por voluntario
    //encontrar um turno por dia
    //lista de turnos por semana/mes ??
}
