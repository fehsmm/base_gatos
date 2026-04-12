package pt.upskill.base_gatos_demo.services;

import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateCatModel;
import pt.upskill.base_gatos_demo.models.EditCatModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class CatService {

    @Autowired
    CatRepository catRepository;

    @Autowired
    AuthService authService;

    @Autowired
    AdoptionService adoptionService;

    public List<Cat> listCats(String nameFilter, String statusFilter){
        List<Cat> cats = new ArrayList<>();
        if ((nameFilter == null || nameFilter.isEmpty()) && (statusFilter == null || statusFilter.isEmpty())) {
            //nenhum selecionado
            cats = catRepository.findTop8ByOrderByArrivalDateDesc();
        } else if ((statusFilter != null && !statusFilter.isEmpty()) && (nameFilter == null ||  nameFilter.isEmpty())) {
            //só status selecionado
            cats = catRepository.findByStatus(statusFilter);
        } else if ((nameFilter != null && !nameFilter.isEmpty()) && (statusFilter == null || statusFilter.isEmpty())) {
            //só nome selecionado
            cats = catRepository.findByNameContainingIgnoreCase(nameFilter);
        } else if((nameFilter != null && !nameFilter.isEmpty()) && (statusFilter != null && !statusFilter.isEmpty())) {
            //ambos selecionados
            cats = catRepository.findByStatusAndNameContainingIgnoreCase(statusFilter, nameFilter);
        }
        return cats;
    }

    public Cat getById(Long id) {
        return catRepository.findById(id).orElse(null);
    }

    public void createCat(CreateCatModel model) {
        Cat cat = new Cat();
        cat.setImage(model.getImage());
        cat.setName(model.getName());
        cat.setEstimatedAge(model.getEstimatedAge());
        cat.setGender(model.isGender());
        cat.setBreed(model.getBreed());
        cat.setStatus(model.getStatus());
        cat.setArrivalDate(model.getArrivalDate());
        cat.setDescription(model.getDescription());
        cat.setTags(model.getTags());
        cat.setFiv(model.isFiv());
        cat.setFelv(model.isFelv());
        cat.setParasiteControl(model.isParasiteControl());
        cat.setVaccination(model.isVaccination());
        cat.setSterilization(model.isSterilization());
        catRepository.save(cat);
    }

    public void updateCat(EditCatModel model) {
        Cat cat = getById(model.getId());
        if (model.getImage() == null || model.getImage().isEmpty()) {
            cat.setImage(cat.getImage());
        } else {
            cat.setImage(model.getImage());
        }
        cat.setName(model.getName());
        cat.setEstimatedAge(model.getEstimatedAge());
        cat.setGender(model.isGender());
        cat.setBreed(model.getBreed());
        cat.setStatus(model.getStatus());
        cat.setArrivalDate(model.getArrivalDate());
        cat.setDescription(model.getDescription());
        cat.setTags(model.getTags());
        cat.setFiv(model.isFiv());
        cat.setFelv(model.isFelv());
        cat.setParasiteControl(model.isParasiteControl());
        cat.setVaccination(model.isVaccination());
        cat.setSterilization(model.isSterilization());
        catRepository.save(cat);
    }

    public void deleteCat(Long id) {
        catRepository.deleteById(id);
    }

    public List<Cat> listAllCats(String status, String gender) {
        User user = null;
        try {
            User tempUser = authService.getAuthenticatedUser();
            if (tempUser != null) {
                user = tempUser;
            }
        } catch (Exception e) {
        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getPrincipal().equals("anonymousUser")) {
            user = null;
        }

        List<Cat> cats;

        if (user != null && (user.isAdmin() || user.isVolunteer())) {
            cats = catRepository.findAll();
        }
        else if (user != null && user.isAdopter()) {
            List<Cat> available = catRepository.findByStatus("Disponível");
            List<Cat> adopted = adoptionService.getAdoptedCatsByUser(user);
            cats = new ArrayList<>(available);
            cats.addAll(adopted);
        } else {
            cats = catRepository.findByStatus("Disponível");
        }

        if (gender != null && !gender.equals("all")) {
            boolean isMale = gender.equals("Macho");
            cats = cats.stream()
                    .filter(c -> c.isGender() == isMale)
                    .toList();
        }
        return cats;
        }

    public int countAvailableCats() {
        int catCount = 0;
        for (Cat cat : catRepository.findAll()) {
            if(cat.getStatus().equals("Disponível")) {
                catCount++;
            }
        }
        return catCount;
    }

    public int countAdoptedCats() {
        int catCount = 0;
        for (Cat cat : catRepository.findAll()) {
            if(cat.getStatus().equals("Adotado")) {
                catCount++;
            }
        }
        return catCount;
    }

    public int countAllCats() {
        int catCount = 0;
        for (Cat cat : catRepository.findAll()) {
            catCount++;
        }
        return catCount;
    }

    public List<Cat> getRecentCats() {
        return catRepository.findTop8ByOrderByArrivalDateDesc();
    }

}
