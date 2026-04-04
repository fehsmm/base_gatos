package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Announcement;
import pt.upskill.base_gatos_demo.models.EditAnnouncementModel;
import pt.upskill.base_gatos_demo.models.PostAnnouncementModel;
import pt.upskill.base_gatos_demo.repositories.AnnouncementRepository;

import java.time.LocalDateTime;

@Service
public class AnnouncementService {

    @Autowired
    AnnouncementRepository announcementRepository;

    private Announcement getById(Long id) {
        return announcementRepository.findById(id).orElse(null);
    }

    public void createAnnouncement(PostAnnouncementModel model) {
        Announcement announcement = new Announcement();
        announcement.setTitle(model.getTitle());
        announcement.setDescription(model.getDescription());
        announcement.setPriority(model.getPriority());
        announcement.setCreatedAt(LocalDateTime.now());
        announcementRepository.save(announcement);
    }

    public void editAnnouncement(EditAnnouncementModel model) {
        Announcement announcement = getById(model.getId());
        announcement.setTitle(model.getTitle());
        announcement.setDescription(model.getDescription());
        announcement.setPriority(model.getPriority());
        announcementRepository.save(announcement);
    }

    public void deleteAnnouncement(Long id) {
        announcementRepository.deleteById(id);
    }
}
