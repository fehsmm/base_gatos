package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Cat;
import pt.upskill.base_gatos_demo.entities.MedicationRecord;
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

    public void create(Long catId, String medicationName, String dose,
                       String storageLocation, LocalDate startDate,
                       LocalDate endDate, String notes, String createdBy) {
        Cat cat = catRepo.findById(catId).orElseThrow();
        MedicationRecord med = new MedicationRecord();
        med.setCat(cat);
        med.setMedicationName(medicationName);
        med.setDose(dose);
        med.setStorageLocation(storageLocation);
        med.setStartDate(startDate);
        med.setEndDate(endDate);
        med.setNotes(notes);
        med.setCreatedBy(createdBy);
        medRepo.save(med);
    }

    public void delete(Long id) {
        medRepo.deleteById(id);
    }

    public MedicationRecord getById(Long id) {
        return medRepo.findById(id).orElse(null);
    }
}