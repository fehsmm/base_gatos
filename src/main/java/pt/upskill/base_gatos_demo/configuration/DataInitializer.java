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

    @Autowired
    private ShiftRepository shiftRepo;

    @Autowired
    private CatRepository catRepo;
    @Autowired
    private AdoptionRepository adoptRepo;

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private MedicationRecordRepository medRepo;


    @PostConstruct
    public void init() {

        if (userRepository.count() == 0) {
            // lista de dados
            List<User> users = List.of(
                    new User("AdminSistema", "admin", "123", "admin", 910000001L, "Rua Central, 1", true),
                    new User("JoãoV", "joao.vol", "123", "volunteer", 910000002L, "Avenida da Liberdade, 10", true),
                    new User("MariaA", "maria.adop", "123", "adopter", 910000003L, "Rua das Flores, 5", true),
                    new User("PedroV", "pedro.vol", "123", "volunteer", 910000004L, "Travessa do Ouro, 12", true),
                    new User("AnaA", "ana.adop", "123", "adopter", 910000005L, "Praceta do Sol, 3", true),
                    new User("CatarinaV", "catarina.vol", "123", "volunteer", 910000004L, "Praça do Chile, 15", false)
            );

            for (User user : users) {
                if (userRepository.getUserByUsername(user.getUsername()) == null) {
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                    userRepository.save(user);
                }
            }
        }

        if (annRepo.count() == 0) {
            for (int i = 1; i <= 5; i++) {
                Announcement a = new Announcement();
                a.setTitle("Aviso " + i);
                a.setPriority(i % 5 == 0 ? "Alta" : "Média");
                a.setDescription("Descrição do anúncio " + i);
                a.setCreatedAt(LocalDateTime.now());
                annRepo.save(a);
            }
        }

        if (stockRepo.count() == 0) {
            for (int i = 1; i <= 5; i++) {
                Stock s = new Stock();
                s.setProductType("Item " + i);
                s.setCurrentQuantity(i * 2);
                s.setLowQuantity(5);
                s.setMeasureUnit("Kg");
                s.setTag("Alimentação");
                s.setStockNote("Nota de stock " + i);
                s.setLowStock(s.isLowStock());
                stockRepo.save(s);
            }
        }

        if (shiftRepo.count() == 0) {
            // NOVO — dados de teste para turnos
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
            s4.setStartTime(LocalTime.of(11, 0));
            s4.setEndTime(LocalTime.of(23, 59));
            s4.setVolunteers(List.of(joao));
            s4.setTasks(new ArrayList<>());
            shiftRepo.save(s4);

            Task t1 = new Task();
            t1.setTitle("Alimentar os gatos");
            t1.setDescription("Dar ração seca e húmida");
            t1.setCompleted(false);
            t1.setShift(s4);
            taskRepository.save(t1);

            Task t2 = new Task();
            t2.setTitle("Limpar jaulas");
            t2.setDescription("Limpar todas as jaulas");
            t2.setCompleted(false);
            t2.setShift(s4);
            taskRepository.save(t2);

            Task t3 = new Task();
            t3.setTitle("Trocar água");
            t3.setDescription("Mudar a água de todos os bebedouros");
            t3.setCompleted(false);
            t3.setShift(s4);
            taskRepository.save(t3);

            if (medRepo.count() == 0 && catRepo.count() > 0) {
                Cat cat = catRepo.findAll().get(0);

                MedicationRecord med1 = new MedicationRecord();
                med1.setCat(cat);
                med1.setMedicationName("Lepicortinol");
                med1.setDose("5mg — 3/4 comprimido");
                med1.setStorageLocation("Gaveta da Andreia");
                med1.setStartDate(LocalDate.now().minusDays(3));
                med1.setEndDate(LocalDate.now().plusDays(10));
                med1.setNotes("Dar sempre com comida. Confirmar que engoliu.");
                med1.setCreatedBy("AdminSistema");
                medRepo.save(med1);
            }
        }
    }

        /*if (adoptRepo.count() == 0) {

            User maria = userRepository.getUserByUsername("maria.adop");

            if (maria != null &&
                    adoptRepo.findByUserAndStatus(maria, "Aprovada").isEmpty()) {

                List<Cat> cats = catRepo.findByStatus("Disponível");

                System.out.println("AVAILABLE CATS: " + cats.size());

                if (cats.size() >= 2) {

                    Cat cat1 = cats.get(0);
                    Cat cat2 = cats.get(1);

                    System.out.println("A criar adoções para: " + maria.getUsername());

                    Adoption a1 = new Adoption();
                    a1.setUser(maria);
                    a1.setCat(cat1);
                    a1.setStatus("Aprovada");
                    a1.setApplicantName(maria.getName());
                    a1.setEmail(maria.getUsername());
                    a1.setPhone(String.valueOf(maria.getTelephone()));
                    a1.setAddress(maria.getAddress());
                    a1.setReason("Adoro gatos");
                    a1.setExperience("Tenho experiência com animais");
                    a1.setAdoptionDate(LocalDate.now());
                    adoptRepo.save(a1);

                    Adoption a2 = new Adoption();
                    a2.setUser(maria);
                    a2.setCat(cat2);
                    a2.setStatus("Aprovada");
                    a2.setApplicantName(maria.getName());
                    a2.setEmail(maria.getUsername());
                    a2.setPhone(String.valueOf(maria.getTelephone()));
                    a2.setAddress(maria.getAddress());
                    a2.setReason("Adoro gatos");
                    a2.setExperience("Tenho experiência com gatinhos");
                    a2.setAdoptionDate(LocalDate.now());
                    adoptRepo.save(a2);

                    // atualizar estado
                    cat1.setStatus("Adotado");
                    cat2.setStatus("Adotado");
                    catRepo.save(cat1);
                    catRepo.save(cat2);

                    System.out.println("ADOÇÕES CRIADAS!");
                } else {
                    System.out.println("Não há gatos suficientes disponíveis!");
                }

            }
        }*/
}
