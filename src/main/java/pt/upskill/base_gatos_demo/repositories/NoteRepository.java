package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface NoteRepository extends JpaRepository<Note,Long> {

    List<Note> findTop6ByOrderByUpdatedAtDesc();
    List<Note> findByPriority(String priority);
    List<Note> findByUpdatedAtBetween(LocalDateTime dateStartFilter, LocalDateTime dateEndFilter);
    List<Note> findByUpdatedAtAfter(LocalDateTime dateStartFilter);
    List<Note> findByUpdatedAtAfterAndPriority(LocalDateTime dateStartFilter, String priority);
    List<Note> findByUpdatedAtBeforeAndPriority(LocalDateTime dateEndFilter, String priority);
    List<Note> findByUpdatedAtBefore(LocalDateTime dateEndFilter);
    List<Note> findByUpdatedAtBetweenAndPriority(LocalDateTime dateStartFilter, LocalDateTime dateEndFilter, String priority);

    List<Note> findByReadFalse(Boolean unreadFilter);
}

