package pt.upskill.base_gatos_demo.configuration;

import jakarta.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.repositories.*;

import java.time.LocalDate;   // NOVO
import java.time.LocalDateTime;
import java.time.LocalTime;   // NOVO
import java.util.ArrayList;   // NOVO
import java.util.List;

@Component
public class DataInitializer {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AnnouncementRepository annRepo;
    @Autowired
    private StockRepository stockRepo;

    @Autowired                          // NOVO
    private ShiftRepository shiftRepo;  // NOVO


    @PostConstruct
    public void init() {

        if(userRepository.count() == 0) {
            // lista de dados
            List<User> users = List.of(
                    new User("AdminSistema", "admin", "123", "ADMIN", 910000001L, "Rua Central, 1", true),
                    new User("JoãoV", "joao.vol", "123", "VOLUNTEER", 910000002L, "Avenida da Liberdade, 10", true),
                    new User("MariaA", "maria.adop", "123", "ADOPTER", 910000003L, "Rua das Flores, 5", true),
                    new User("PedroV", "pedro.vol", "123", "VOLUNTEER", 910000004L, "Travessa do Ouro, 12", false),
                    new User("AnaA", "ana.adop", "123", "ADOPTER", 910000005L, "Praceta do Sol, 3", true)
            );

            for (User user : users) {
                if (userRepository.getUserByUsername(user.getUsername()) == null) {
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                    userRepository.save(user);
                }
            }
        }else if(annRepo.count() == 0) {
            for (int i = 1; i <= 5; i++) {
                Announcement a = new Announcement();
                a.setTitle("Aviso " + i);
                a.setPriority(i % 2 == 0 ? "Alta" : "Média");
                a.setDescription("Descrição do anúncio " + i);
                a.setCreatedAt(LocalDateTime.now());
                annRepo.save(a);
            }
        }else if(stockRepo.count() == 0) {
            for (int i = 1; i <= 5; i++) {
                Stock s = new Stock();
                s.setName("Item " + i);
                s.setCurrentQuantity(i * 2);
                s.setLowQuantity(5);
                s.setNote("Nota de stock " + i);
                s.setLowStock(s.isLowStock());
                stockRepo.save(s);
            }
        }else{
            return;
        }

        // NOVO — dados de teste para turnos
        if (shiftRepo.count() == 0) {
            User joao = userRepository.getUserByUsername("joao.vol");
            User pedro = userRepository.getUserByUsername("pedro.vol");

            Shift s1 = new Shift();
            s1.setDate(LocalDate.now().plusDays(3));
            s1.setStartTime(LocalTime.of(9, 0));
            s1.setEndTime(LocalTime.of(13, 0));
            s1.setVolunteers(List.of(joao, pedro));
            s1.setTasks(new ArrayList<>());
            shiftRepo.save(s1);

            Shift s2 = new Shift();
            s2.setDate(LocalDate.now().plusDays(7));
            s2.setStartTime(LocalTime.of(14, 0));
            s2.setEndTime(LocalTime.of(18, 0));
            s2.setVolunteers(List.of(joao));
            s2.setTasks(new ArrayList<>());
            shiftRepo.save(s2);

            Shift s3 = new Shift();
            s3.setDate(LocalDate.now().minusDays(5));
            s3.setStartTime(LocalTime.of(9, 0));
            s3.setEndTime(LocalTime.of(13, 0));
            s3.setVolunteers(List.of(joao));
            s3.setTasks(new ArrayList<>());
            shiftRepo.save(s3);

            Shift s4 = new Shift();
            s4.setDate(LocalDate.now());
            s4.setStartTime(LocalTime.of(9, 0));
            s4.setEndTime(LocalTime.of(13, 0));
            s4.setVolunteers(List.of(joao));
            s4.setTasks(new ArrayList<>());
            shiftRepo.save(s4);
        }
    }
}