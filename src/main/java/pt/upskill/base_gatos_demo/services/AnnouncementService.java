package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Announcement;
import pt.upskill.base_gatos_demo.models.CreateAnnouncementModel;
import pt.upskill.base_gatos_demo.models.EditAnnouncementModel;
import pt.upskill.base_gatos_demo.repositories.AnnouncementRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class AnnouncementService {

    @Autowired
    AnnouncementRepository announcementRepository;
    @Autowired
    private AuthService authService;

    private Announcement getById(Long id) {
        return announcementRepository.findById(id).orElse(null);
    }

    public void createAnnouncement(CreateAnnouncementModel model) {
        Announcement announcement = new Announcement();
        String user = authService.getAuthenticatedUser().getName();
        announcement.setTitle(model.getTitle());
        announcement.setDescription(model.getDescription());
        announcement.setPriority(model.getPriority());
        announcement.setCreatedAt(LocalDateTime.now());
        announcement.setCreatedBy(user);
        announcementRepository.save(announcement);
    }

    public void updateAnnouncement(EditAnnouncementModel model) {
        Announcement announcement = getById(model.getId());
        String user = authService.getAuthenticatedUser().getName();
        announcement.setTitle(model.getTitle());
        announcement.setDescription(model.getDescription());
        announcement.setPriority(model.getPriority());
        announcement.setUpdatedAt(LocalDateTime.now());
        announcement.setLastUpdatedBy(user);
        announcementRepository.save(announcement);
    }

    public void deleteAnnouncement(Long id) {
        announcementRepository.deleteById(id);
    }

    public List<Announcement> getAnnouncements (LocalDate dateStartFilter, LocalDate dateEndFilter, String priorityFilter) {
        List<Announcement> announcements = new ArrayList<>();
        if(dateStartFilter == null && dateEndFilter == null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //não tem datas nem prioridade
            announcements = announcementRepository.findTop6ByOrderByCreatedAtDesc();
        } else if(dateStartFilter == null && dateEndFilter == null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem só prioridade
            announcements = announcementRepository.findByPriority(priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter == null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem só data de inicio
            announcements = announcementRepository.findByCreatedAtAfter(dateStartFilter.atStartOfDay());
        } else if(dateStartFilter != null && dateEndFilter == null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem data de início e prioridade
            announcements = announcementRepository.findByCreatedAtAfterAndPriority(dateStartFilter.atStartOfDay(), priorityFilter);
        } else if(dateStartFilter == null && dateEndFilter != null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem só data de fim
            announcements = announcementRepository.findByCreatedAtBefore(dateEndFilter.atTime(23,59,59));
        } else if(dateStartFilter == null && dateEndFilter != null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem só data de fim e prioridade
            announcements = announcementRepository.findByCreatedAtBeforeAndPriority(dateEndFilter.atTime(23,59,59), priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter != null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem ambas as datas sem prioridade
            announcements = announcementRepository.findByCreatedAtBetween(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59));
        } else if (dateStartFilter != null && dateEndFilter != null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem ambas as datas com prioridade
            announcements = announcementRepository.findByCreatedAtBetweenAndPriority(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), priorityFilter);
        }
        announcements.sort((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()));
        return announcements;
    }

    public List<Announcement> getRecentAnnouncements () {
        return announcementRepository.findTop6ByOrderByCreatedAtDesc();
    }
}
