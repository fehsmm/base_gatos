package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Report;
import pt.upskill.base_gatos_demo.entities.User;

import java.util.List;

public interface ReportRepository extends JpaRepository<Report, Long> {

    List<Report> findByUser(User user);

    List<Report> findTop5ByUserAndCatOrderByReportDateDesc(User user, Cat cat);

    int countReportByUser(User user);

    boolean existsByUser(User user);
    boolean existsByCat(Cat cat);

}
