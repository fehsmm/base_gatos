package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateCatModel;
import pt.upskill.base_gatos_demo.models.EditCatModel;
import pt.upskill.base_gatos_demo.repositories.*;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import java.util.ArrayList;
import java.util.List;

@Service
public class CatService {

    @Autowired
    CatRepository catRepository;

    @Autowired
    AuthService authService;

    @Autowired
    AdoptionRepository adoptionRepository;

    @Autowired
    ShiftRepository shiftRepository;

    @Autowired
    MedicationRecordRepository medicationRecordRepository;

    @Autowired
    ReportRepository reportRepository;


    public List<Cat> listCats(String nameFilter, String statusFilter){
        List<Cat> cats = new ArrayList<>();
        if ((nameFilter == null || nameFilter.isEmpty()) && (statusFilter == null || statusFilter.isEmpty())) {
            //nenhum selecionado
            cats = catRepository.findTop8ByOrderByArrivalDateDesc();
        } else if ((statusFilter != null && !statusFilter.isEmpty()) && (nameFilter == null ||  nameFilter.isEmpty())) {
            //só status selecionado
            cats = catRepository.findByStatusOrderByArrivalDateDesc(statusFilter);
        } else if ((nameFilter != null && !nameFilter.isEmpty()) && (statusFilter == null || statusFilter.isEmpty())) {
            //só nome selecionado
            cats = catRepository.findByNameContainingIgnoreCaseOrderByArrivalDateDesc(nameFilter);
        } else if((nameFilter != null && !nameFilter.isEmpty()) && (statusFilter != null && !statusFilter.isEmpty())) {
            //ambos selecionados
            cats = catRepository.findByStatusAndNameContainingIgnoreCaseOrderByArrivalDateDesc(statusFilter, nameFilter);
        }
        return cats;
    }

    public Cat getById(Long id) {
        return catRepository.findById(id).orElse(null);
    }

    private String savePhoto(MultipartFile photo) throws IOException {
        File dir = new File("uploads");
        if (!dir.exists()) dir.mkdirs();
        String original = photo.getOriginalFilename();
        String ext = original.substring(original.lastIndexOf("."));
        String filename = UUID.randomUUID().toString() + ext;
        File dest = new File(dir, filename);
        java.nio.file.Files.write(dest.toPath(), photo.getBytes());
        return filename;
    }

    public void createCat(CreateCatModel model) {
        Cat cat = new Cat();
        if (model.getPhoto() != null && !model.getPhoto().isEmpty()) {
            try {
                cat.setImage(savePhoto(model.getPhoto()));
            } catch (Exception e) {
                e.printStackTrace();
            }
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

    public void updateCat(EditCatModel model) {
        Cat cat = getById(model.getId());
        if (model.getPhoto() != null && !model.getPhoto().isEmpty()) {
            try {
                cat.setImage(savePhoto(model.getPhoto()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            cat.setImage(model.getExistingImage());
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

    public boolean deleteCat(Long id) {
        Cat cat = getById(id);
        if(!canDeleteCat(cat)) {
            return false;
        }
        catRepository.deleteById(id);
        return true;
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
            cats = catRepository.findAllByOrderByArrivalDateDesc();
        } else {
            cats = catRepository.findByStatusOrderByArrivalDateDesc("Disponível");
        }

        if (gender != null && !gender.equals("all")) {
            boolean isMale = gender.equals("Macho");
            cats = cats.stream()
                    .filter(c -> c.isGender() == isMale)
                    .toList();
        }
        if (status != null && !status.equals("all")) {
            cats = cats.stream()
                    .filter(c -> c.getStatus().equals(status))
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

    public int countCatsInAdoptionProcess() {
        int catCount = 0;
        for (Cat cat : catRepository.findAll()) {
            if(cat.getStatus().equals("Em Processo")) {
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

    public List<Cat> getByStatus(String status) {
        return catRepository.findByStatus(status);
    }

    public boolean canDeleteCat(Cat cat) {
        if(!adoptionRepository.existsByCat(cat) && !medicationRecordRepository.existsByCat(cat)
                && !reportRepository.existsByCat(cat)) {
            return true;
        }
        return false;
    }
}
