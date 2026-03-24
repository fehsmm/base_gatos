package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CatModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;

import java.util.List;

@Service
public class CatService {

    @Autowired
    CatRepository catRepository;

    public List<Cat> listCats(User user){
        Cat filter = new Cat();
        if ((!user.isAdmin() && !user.isVolunteer()) || status == "Disponível") {
            filter.setStatus("Disponível");
        } else if (status != null) {
            filter.setStatus(status);
        }
        if (gender != null) {
            filter.setGender(gender);
        }
        if(vaccine) {
            filter.setVaccination(true);
        }
        if(sterelized) {
            filter.setVaccination(false);
        }
        if(healthy) {
            filter.setFiv(false);
            filter.setFelv(false);
        }
        return catRepository.findAll(Example.of(filter));
    }

    public Cat getById(Long id) {
        return catRepository.getReferenceById(id);
    }

    public void updateCat(CatModel model) {
        Cat cat = getById(model.getId());
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

    public void deleteCat(CatModel model) {
        Cat cat = getById(model.getId());
        catRepository.delete(cat);
    }

    public void createCat(CatModel model) {
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

}
