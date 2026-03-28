package pt.upskill.base_gatos_demo.services;

import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateCatModel;
import pt.upskill.base_gatos_demo.models.EditCatModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;

import java.util.List;

@Service
public class CatService {

    @Autowired
    CatRepository catRepository;

    @Autowired
    AuthService authService;

    public List<Cat> listCats(@Nullable String status, @Nullable boolean gender, @Nullable boolean vaccination,
                              @Nullable boolean sterilization, @Nullable boolean health){
        User user = authService.getAuthenticatedUser();
        Cat filter = new Cat();
        if ((!user.isAdmin() && !user.isVolunteer()) || status == "Disponível") {
            filter.setStatus("Disponível");
        } else if (status != null) {
            filter.setStatus(status);
        }
        if (gender) {
            filter.setGender(gender);
        }
        if(vaccination) {
            filter.setVaccination(true);
        }
        if(sterilization) {
            filter.setSterilization(true);
        }
        if(health) {
            filter.setFiv(false);
            filter.setFelv(false);
        }
        return catRepository.findAll(Example.of(filter));
    }

    public Cat getById(Long id) {
        return catRepository.getReferenceById(id);
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
        cat.setTags(model.getTags() != null ? String.join(",", model.getTags()) : null);
        cat.setFiv(model.isFiv());
        cat.setFelv(model.isFelv());
        cat.setParasiteControl(model.isParasiteControl());
        cat.setVaccination(model.isVaccination());
        cat.setSterilization(model.isSterilization());
        catRepository.save(cat);
    }

    public void updateCat(EditCatModel model) {
        Cat cat = getById(model.getId());
        cat.setImage(model.getImage());
        cat.setName(model.getName());
        cat.setEstimatedAge(model.getEstimatedAge());
        cat.setGender(model.isGender());
        cat.setBreed(model.getBreed());
        cat.setStatus(model.getStatus());
        cat.setArrivalDate(model.getArrivalDate());
        cat.setDescription(model.getDescription());
        cat.setTags(model.getTags() != null ? String.join(",", model.getTags()) : null);
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
        if (gender != null && !gender.equals("all")) {
            return catRepository.findByStatusAndGender("Disponível", gender.equals("Macho"));
        }
        return catRepository.findByStatus("Disponível");

    }

}
