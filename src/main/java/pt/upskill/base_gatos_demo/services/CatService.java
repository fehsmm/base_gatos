package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.models.CatModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;

import java.util.List;

@Service
public class CatService {

    @Autowired
    CatRepository catRepository;

    public List<Cat> listAvailableCats(){
        return catRepository.findByStatus("Disponível");
    }

    public List<Cat> listAllCats(){
        Cat filter = new Cat();
        if (!isAdmin && status == null) {
            filter.setStatus("Disponível");
        } else if (status != null) {
            filter.setStatus(status);
        }
        if (genero != null) {
            filter.setGender(genero);
        }
        return catRepository.findAll(Example.of(filter));
        //return catRepository.findAll();
    }

    public List<Cat> listMaleCats(){ return catRepository.findByGender("Macho"); }
    public List<Cat> listFemaleCats(){ return catRepository.findByGender("Fêmea"); }

    public List<Cat> listHealthyCats(){ return catRepository.findByHealth(false, false); }
    public List<Cat> listVaccinatedCats(){ return catRepository.findByVaccine(true); }
    public List<Cat> listSterilizedCats(){ return catRepository.findBySterilized(true); }

    public Cat getById(Long id) {
        return catRepository.getReferenceById(id);
    }

    public Cat updateCat(CatModel model) {
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
        return cat;
    }

    //lista de gatos disponiveis

}
