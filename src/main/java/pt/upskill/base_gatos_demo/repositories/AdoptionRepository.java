package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AdoptionRepository extends JpaRepository<Adoption,Long> {

        List<Adoption> findByUserAndStatus(User user,String status);
        List<Adoption> findByStatus(String status);
        List<Adoption> findByUserAndCat(User user, Cat cat);

        List<Adoption> findByRequestDateAfter(LocalDateTime startDate);
        List<Adoption> findByRequestDateBefore(LocalDateTime endDate);
        List<Adoption> findByRequestDateBetween(LocalDateTime startDate, LocalDateTime endDate);
        List<Adoption> findByRequestDateBetweenAndStatus(LocalDateTime startDate, LocalDateTime endDate, String status);
        List<Adoption> findByReadFalse();
        List<Adoption> findByRequestDateAfterAndStatus(LocalDateTime startDate, String status);
        List<Adoption> findByRequestDateBeforeAndStatus(LocalDateTime startDate, String status);
        List<Adoption> findByStatusAndReadFalse(String status);
        List<Adoption> findByRequestDateAfterAndStatusAndReadFalse(LocalDateTime startDate, String status);
        List<Adoption> findByRequestDateBeforeAndStatusAndReadFalse(LocalDateTime endDate, String status);
        List<Adoption> findByRequestDateAfterAndReadFalse(LocalDateTime startDate);
        List<Adoption> findByRequestDateBeforeAndReadFalse(LocalDateTime endDate);
        List<Adoption> findByRequestDateBetweenAndStatusAndReadFalse(LocalDateTime startDate, LocalDateTime endDate, String status);
        List<Adoption> findByRequestDateBetweenAndReadFalse(LocalDateTime startDate, LocalDateTime endDate);



}
