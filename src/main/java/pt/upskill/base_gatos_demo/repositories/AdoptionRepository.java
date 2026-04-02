package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.User;

import java.util.List;

@Repository
public interface AdoptionRepository extends JpaRepository<Adoption,Long> {

        List<Adoption> findByUserAndStatus(User user,String status);
        List<Adoption> findByStatus(String status);

}
