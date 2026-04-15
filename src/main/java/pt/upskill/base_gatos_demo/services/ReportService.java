package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Report;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.ReportRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.util.List;
@Service
public class ReportService {

    @Autowired
    ReportRepository reportRepository;

    public List<Report> getUser(User user){
        return reportRepository.findByUser(user);

    }
}
