package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Announcement;
import pt.upskill.base_gatos_demo.models.CreateAnnouncementModel;
import pt.upskill.base_gatos_demo.models.EditAnnouncementModel;
import pt.upskill.base_gatos_demo.repositories.AnnouncementRepository;

import java.time.LocalDateTime;

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
}
