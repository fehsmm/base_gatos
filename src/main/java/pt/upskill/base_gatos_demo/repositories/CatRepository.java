package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Cat;

import java.util.List;

@Repository
public interface CatRepository extends JpaRepository<Cat,Long> {

    List<Cat> findByName(String name);
    List<Cat> findByNameContainingIgnoreCaseOrderByArrivalDateDesc(String name);
    List<Cat> findByStatus(String status);
    List<Cat> findByStatusAndNameContainingIgnoreCaseOrderByArrivalDateDesc(String status, String name);

    List<Cat> findTop8ByOrderByArrivalDateDesc();

    List<Cat> findAllByOrderByArrivalDateDesc();

    List<Cat> findByStatusOrderByArrivalDateDesc(String status);

    Cat findFirstByName(String name);

}
