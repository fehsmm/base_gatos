package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;

@Repository
public interface NoteRepository extends JpaRepository<Note,Long> {
    Note findByShift(Shift shift);

}

