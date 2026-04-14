package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.MedicationRecord;
import pt.upskill.base_gatos_demo.models.CreateMedicationRecordModel;
import pt.upskill.base_gatos_demo.models.EditMedicationRecordModel;
import pt.upskill.base_gatos_demo.repositories.CatRepository;
import pt.upskill.base_gatos_demo.repositories.MedicationRecordRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicationRecordService {

    @Autowired
    private MedicationRecordRepository medRepo;

    @Autowired
    private CatRepository catRepo;

    @Autowired
    private AuthService authService;

    public List<MedicationRecord> getBycat(Long catId) {
        return medRepo.findByCatId(catId);
    }

    public List<MedicationRecord> getActiveTodayByCat(Long catId) {
        return medRepo.findByCatId(catId).stream()
                .filter(MedicationRecord::isActiveToday)
                .collect(Collectors.toList());
    }

    public List<MedicationRecord> getAllActiveToday() {
        return medRepo.findAll().stream()
                .filter(MedicationRecord::isActiveToday)
                .collect(Collectors.toList());
    }

    public void createMedication(Long catId, CreateMedicationRecordModel model) {
        Cat cat = catRepo.findById(catId).orElseThrow();
        MedicationRecord med = new MedicationRecord();
        String user = authService.getAuthenticatedUser().getName();
        med.setCat(cat);
        med.setMedicationName(model.getMedicationName());
        med.setDose(model.getDose());
        med.setStorageLocation(model.getStorageLocation());
        med.setStartDate(model.getStartDate());
        med.setEndDate(model.getEndDate());
        med.setNotes(model.getNotes());
        med.setCreatedBy(user);
        medRepo.save(med);
    }

    public void updateMedication(EditMedicationRecordModel model) {
        MedicationRecord med = getById(model.getId());
        String user = authService.getAuthenticatedUser().getName();
        med.setMedicationName(model.getMedicationName());
        med.setDose(model.getDose());
        med.setStorageLocation(model.getStorageLocation());
        med.setStartDate(model.getStartDate());
        med.setEndDate(model.getEndDate());
        med.setNotes(model.getNotes());
        med.setUpdatedBy(user);
        medRepo.save(med);
    }

    public void deleteMedication(Long id) {
        medRepo.deleteById(id);
    }

    public MedicationRecord getById(Long id) {
        return medRepo.findById(id).orElse(null);
    }
}