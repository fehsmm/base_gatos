package pt.upskill.base_gatos_demo.services;

import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateShiftModel;
import pt.upskill.base_gatos_demo.models.EditShiftModel;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ShiftService {

    @Autowired
    ShiftRepository shiftRepository;

    @Autowired
    AuthService authService;

    public List<Shift> getShifts(@Nullable LocalDate date) {
        User user = authService.getAuthenticatedUser();
        if (user.isVolunteer()) {
            if(date == null) {
                return shiftRepository.findByVolunteers_Id(user.getId());
            } else {
                return shiftRepository.findByVolunteers_IdAndDate(user.getId(), date);
            }
        }
        if (user.isAdmin()) {
            if(date == null) {
                return shiftRepository.findAll();
            } else {
                return shiftRepository.findByDate(date);
            }
        }
        return new ArrayList<>();
    }

    private Shift getById(Long id) {
        return  shiftRepository.getReferenceById(id);
    }

    public void createShift(CreateShiftModel shiftModel) {
        Shift  shift = new Shift();
        //falta a lista de voluntários
        //falta a lista de tarefas
        shift.setDate(shiftModel.getDate());
        shift.setStartTime(shiftModel.getStartTime());
        shift.setEndTime(shiftModel.getEndTime());
        shiftRepository.save(shift);
    }

    public void updateShift(EditShiftModel model) {
        Shift shift = getById(model.getId());
        //falta a lista de voluntários
        //falta a lista de tarefas
        shift.setDate(model.getDate());
        shift.setStartTime(model.getStartTime());
        shift.setEndTime(model.getEndTime());
        shiftRepository.save(shift);
    }

    public void deleteShift(Long id){
        shiftRepository.deleteById(id);
    }

}