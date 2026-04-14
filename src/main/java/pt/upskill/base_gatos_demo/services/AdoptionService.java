package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.AdoptionForm;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

}
