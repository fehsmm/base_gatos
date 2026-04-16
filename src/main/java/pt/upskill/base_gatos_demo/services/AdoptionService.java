package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Announcement;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.AdoptionForm;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class AdoptionService {

    @Autowired
    AdoptionRepository adoptionRepository;
    @Autowired
    UserRepository userRepository;

    @Autowired
    CatRepository catRepository;


    public void approveAdoption(Long adoptionId) {
        Adoption adoption = adoptionRepository.findById(adoptionId).orElseThrow();
        Cat cat = adoption.getCat();

        adoption.setStatus("Aprovada");
        adoption.setReviewDate(LocalDateTime.now());
        adoption.setAdoptionDate(LocalDate.now());
        adoptionRepository.save(adoption);

        cat.setStatus("Adotado");
        catRepository.save(cat);

    }

    public void rejectAdoption(Long adoptionId, String reason) {
        Adoption adoption = adoptionRepository.findById(adoptionId).orElseThrow();

        adoption.setStatus("Rejeitada");
        adoption.setReviewDate(LocalDateTime.now());
        adoption.setReason(reason);

        adoptionRepository.save(adoption);
    }

    public List<Cat> getAdoptedCatsByUser(User user) {
        List<Adoption> adoptions = adoptionRepository.findByUserAndStatus(user, "Adotado");
        return adoptions.stream()
                .map(Adoption::getCat)
                .toList();
    }

    public List<Adoption> getPendingAdoptions() {
        return  adoptionRepository.findByStatus("Pendente");
    }

    public int countPendingAdoptions() {
        int pendingAdoptions = 0;
        for (Adoption adoption : adoptionRepository.findAll()) {
            if (adoption.getStatus().equals("Pendente")) {
                pendingAdoptions++;
            }
        }
        return pendingAdoptions;
    }

    public List<Adoption> getAdoptions(LocalDate dateStartFilter, LocalDate dateEndFilter, String statusFilter, Boolean unreadFilter) {
        List<Adoption> adoptions = new ArrayList<>();
        if(dateStartFilter == null && dateEndFilter == null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //todos vazios
            adoptions = adoptionRepository.findAll();
        } else if(dateStartFilter != null && dateEndFilter == null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //so data inicio preenchida
            adoptions = adoptionRepository.findByRequestDateAfter(dateStartFilter.atStartOfDay());
        } else if(dateStartFilter == null && dateEndFilter != null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //so data fim preenchida
            adoptions = adoptionRepository.findByRequestDateBefore(dateEndFilter.atTime(23, 59, 59));
        } else if(dateStartFilter == null && dateEndFilter == null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //so status preenchido
            adoptions = adoptionRepository.findByStatus(statusFilter);
        } else if(dateStartFilter == null && dateEndFilter == null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //so unread preenchido
            adoptions = adoptionRepository.findByReadFalse();
        } else if (dateStartFilter != null && dateEndFilter != null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //data inicio +  data fim
            adoptions = adoptionRepository.findByRequestDateBetween(dateStartFilter.atStartOfDay(),
                    dateEndFilter.atTime(23, 59, 59));
        } else if(dateStartFilter != null && dateEndFilter == null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //data inicio + status
            adoptions = adoptionRepository.findByRequestDateAfterAndStatus(dateStartFilter.atStartOfDay(), statusFilter);
        } else if(dateStartFilter != null && dateEndFilter == null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //data inicio + unread
            adoptions = adoptionRepository.findByRequestDateAfterAndReadFalse(dateStartFilter.atStartOfDay());
        } else if(dateStartFilter != null && dateEndFilter != null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //data inicio + data fim + status
            adoptions = adoptionRepository.findByRequestDateBetweenAndStatus(dateStartFilter.atStartOfDay(),
                    dateEndFilter.atTime(23, 59, 59), statusFilter);
        } else if(dateStartFilter != null && dateEndFilter != null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //data inicio + data fim + unread
            adoptions = adoptionRepository.findByRequestDateBetweenAndReadFalse(dateStartFilter.atStartOfDay(),
                    dateEndFilter.atTime(23, 59, 59));
        } else if(dateStartFilter != null && dateEndFilter == null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //data inicio + status + unread
            adoptions = adoptionRepository.findByRequestDateAfterAndStatusAndReadFalse(dateStartFilter.atStartOfDay(), statusFilter);
        } else if(dateStartFilter == null && dateEndFilter != null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //data fim + status
            adoptions = adoptionRepository.findByRequestDateBeforeAndStatus(dateEndFilter.atTime(23, 59, 59),
                    statusFilter);
        } else if (dateStartFilter == null && dateEndFilter != null
                && (statusFilter == null || statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //data fim + unread
            adoptions = adoptionRepository.findByRequestDateBeforeAndReadFalse(dateEndFilter.atTime(23, 59, 59));
        } else if(dateStartFilter == null && dateEndFilter != null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //data fim + status + unread
            adoptions = adoptionRepository.findByRequestDateBeforeAndStatusAndReadFalse(dateEndFilter.atTime(23, 59, 59),
                    statusFilter);
        } else if(dateStartFilter == null && dateEndFilter == null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //status + unread
            adoptions = adoptionRepository.findByStatusAndReadFalse(statusFilter);
        } else if(dateStartFilter != null && dateEndFilter != null
                && (statusFilter != null && !statusFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //todos
            adoptions = adoptionRepository.findByRequestDateBetweenAndStatusAndReadFalse(dateStartFilter.atStartOfDay(),
                    dateEndFilter.atTime(23,59,59),  statusFilter);
        }
        adoptions.sort(Comparator.comparing(Adoption::isRead) // as unread vêm primeiro
                        .thenComparing(Adoption::getRequestDate, Comparator.reverseOrder()) //e por ordem das mais recentes
        );
        return adoptions;
    }

    public Boolean getProcessAdoption(String username, AdoptionForm adoptionForm){
        User user = userRepository.getUserByUsername(username);
        Cat cat = catRepository.findById(adoptionForm.getCatId()).orElse(null);

        List<Adoption> findUser = adoptionRepository.findByUserAndCat(user, cat);

        for(Adoption adoption : findUser) {
            if ("Pendente".equals(adoption.getStatus()) || "Aprovada".equals(adoption.getStatus())) {
                return false;
            }
        }
        Adoption adoption = new Adoption();
            adoption.setUser(user);
            adoption.setCat(cat);
            adoption.setApplicantName(adoptionForm.getApplicantName());
            adoption.setReason(adoptionForm.getReason());
            adoption.setExperience(adoptionForm.getExperience());
            adoption.setStatus("Pendente");
            adoptionRepository.save(adoption);
            return true;
    }

    public List<Adoption> getUserAndStatus(User user, String status){
        return adoptionRepository.findByUserAndStatus(user, status);
    }

    @Transactional
    public void markAsRead(Long id){
        Adoption adoption = adoptionRepository.findById(id).orElse(null);
       if(adoption != null){
           adoption.setRead(true);
           adoptionRepository.save(adoption);
       }
    }

}
