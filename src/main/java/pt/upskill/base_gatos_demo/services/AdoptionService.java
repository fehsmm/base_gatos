package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Adoption;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.AdoptionRepository;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Service
public class AdoptionService {

    @Autowired
    AdoptionRepository adoptionRepository;
    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    CatRepository catRepository;


    public void approveAdoption(Long adoptionId) {
        Adoption adoption = adoptionRepository.findById(adoptionId).orElse(null);
        User user = userRepository.getUserByUsername(adoption.getEmail());


        if(user == null){
            user = new User();
            user.setName(adoption.getApplicantName());
            user.setUsername(adoption.getApplicantName()); //Temporário pode ser o email?!
            user.setPassword(passwordEncoder.encode("123")); //Password Temporária
            user.setRole("adopter");
            user.setTelephone(Long.parseLong(adoption.getPhone()));
            user.setAddress(adoption.getAddress());
            user.setApproved(true);

            userRepository.save(user);
        }

        adoption.setUser(user);
        adoption.setStatus("Aprovada");
        adoption.setReviewDate(LocalDateTime.now());
        adoption.setAdoptionDate(LocalDate.now());
        adoptionRepository.save(adoption);

        Cat cat = adoption.getCat();
        cat.setStatus("Adotado");
        catRepository.save(cat);
        adoptionRepository.save(adoption);


    }

    public void rejectAdoption(Long adoptionId, String reason) {
        Adoption adoption = adoptionRepository.findById(adoptionId).orElse(null);

        adoption.setStatus("Rejeitada");
        adoption.setReviewDate(LocalDateTime.now());
        adoption.setAdoptionDate(LocalDate.now());
        adoption.setReason(reason);

        adoptionRepository.save(adoption);
    }
}
