package pt.upskill.base_gatos_demo.services;

import jakarta.annotation.Nullable;
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

    public List<Announcement> findAll() {
        return announcementRepository.findAll();
    }

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
        if(dateStartFilter == null && priorityFilter == null) {
            announcements = announcementRepository.findTop6ByOrderByCreatedAtDesc();
        } else if(dateStartFilter == null && priorityFilter != null) {
            announcements = announcementRepository.findByPriority(priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter == null && priorityFilter == null) {
            announcements = announcementRepository.findByCreatedAtBetween(dateStartFilter.atStartOfDay(), dateStartFilter.atTime(23,59,59));
        } else if (dateStartFilter != null && dateEndFilter != null && priorityFilter != null) {
            announcements = announcementRepository.findByCreatedAtBetweenAndPriority(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), priorityFilter);
        }
        return announcements;
    }

    public List<Announcement> getRecentAnnouncements () {
        return announcementRepository.findTop6ByOrderByCreatedAtDesc();
    }
}
