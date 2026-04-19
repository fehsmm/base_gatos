package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.MedicationRecord;
import java.util.List;

@Repository
public interface MedicationRecordRepository extends JpaRepository<MedicationRecord, Long> {
    List<MedicationRecord> findByCatId(Long catId);

    boolean existsByCat (Cat cat);
}