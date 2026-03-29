package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Schedule;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.repositories.ScheduleRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
public class ScheduleService {

    @Autowired
    ScheduleRepository scheduleRepository;

    public Schedule getSchedule(LocalDate date) {
        return scheduleRepository.findByDate(date);
    }

    /*public Map<String, List<Shift>> groupShifts(Schedule schedule) {
    }*/
}
