package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;

import java.util.List;

@Repository
public interface CatRepository extends JpaRepository<Cat,Long> {

    List<Cat> findByName(String name);
    List<Cat> findByNameContainingIgnoreCaseOrderByArrivalDateDesc(String name);
    List<Cat> findByStatus(String status);
    List<Cat> findByStatusAndNameContainingIgnoreCaseOrderByArrivalDateDesc(String status, String name);

    List<Cat> findByStatusAndGender(String status, boolean gender);

    List<Cat> findTop8ByOrderByArrivalDateDesc();

    List<Cat> findAllByOrderByArrivalDateDesc();

    List<Cat> findByStatusOrderByArrivalDateDesc(String status);

    List<Cat> findByGender(boolean gender);

    List<Cat> findByHealth(boolean health);

    List<Cat> findByVaccination(boolean vaccination);

    List<Cat> findBySterilization(boolean sterilization);

    List<Cat> findAllByStatusAndGender(String status, boolean gender);

    Cat findFirstByName(String name);

}
