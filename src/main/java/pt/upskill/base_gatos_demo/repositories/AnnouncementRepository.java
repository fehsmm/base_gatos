package pt.upskill.base_gatos_demo.repositories;

import org.springframework.cglib.core.Local;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Announcement;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AnnouncementRepository extends JpaRepository<Announcement, Long> {

    List<Announcement> findByPriority(String priority);

    List<Announcement> findTop6ByOrderByCreatedAtDesc();

    List<Announcement> findByCreatedAtBetween(LocalDateTime date1, LocalDateTime date2);

    List<Announcement> findByCreatedAtBetweenAndPriority(LocalDateTime date1, LocalDateTime date2, String priority);
}
