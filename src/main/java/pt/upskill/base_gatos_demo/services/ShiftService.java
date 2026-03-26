package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;

import java.util.Date;
import java.util.List;

@Service
public class ShiftService {

    @Autowired
    ShiftRepository shiftRepository;

    /*public List<Shift> listAllShiftsByVolunteer(Long id){}

    public List<Shift> listAllShifts() {}

    public Shift findShiftByDate(Date date){}

    public Shift createShift() {}

    public Shift editShift(Long id) {}

    public void deleteShift(Long id){}*/
}