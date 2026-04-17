package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.Report;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.ReportModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.ReportRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDateTime;
import java.util.List;
@Service
public class ReportService {

    @Autowired
    ReportRepository reportRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CatRepository catRepository;

    public List<Report> getUser(User user){
        return reportRepository.findByUser(user);

    }

    public void processOfReport(ReportModel reportModel, String username ){
        User user = userRepository.getUserByUsername(username);
        Cat cat = catRepository.findById(reportModel.getCatId()).orElse(null);

        Report report = new Report();
        report.setUser(user);
        report.setCat(cat);
        report.setStatus(reportModel.getStatus());
        report.setNotes(reportModel.getNotes());
        report.setHealth(reportModel.getHealth());
        report.setReportDate(LocalDateTime.now());
        reportRepository.save(report);

    }

    public List<Report> getReportsByUserAndCat(User user, Cat cat){
        List<Report> reports = reportRepository.findTop5ByUserAndCatOrderByReportDateDesc(user, cat);
        return  reports;
    }

    public int getReportCount(String username){
    User user = userRepository.getUserByUsername(username);
    return reportRepository.countReportByUser(user);
    }
}
