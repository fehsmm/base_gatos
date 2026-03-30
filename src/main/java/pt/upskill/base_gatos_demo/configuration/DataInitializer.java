package pt.upskill.base_gatos_demo.configuration;

import jakarta.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.repositories.*;

import java.time.LocalDateTime;
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


    @PostConstruct
    public void init() {

        if(userRepository.count() == 0) {
            // lista de dados
            List<User> users = List.of(
                    new User("AdminSistema", "admin", "123", "admin", 910000001L, "Rua Central, 1", true),
                    new User("JoãoV", "joao.vol", "123", "volunteer", 910000002L, "Avenida da Liberdade, 10", true),
                    new User("MariaA", "maria.adop", "123", "adopter", 910000003L, "Rua das Flores, 5", true),
                    new User("PedroV", "pedro.vol", "123", "volunteer", 910000004L, "Travessa do Ouro, 12", false),
                    new User("AnaA", "ana.adop", "123", "adopter", 910000005L, "Praceta do Sol, 3", true)
            );

            for (User user : users) {
                //se existir user, devolve null
                if (userRepository.getUserByUsername(user.getUsername()) == null) {

                    //Encripta a password antes de guardar
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







}
}
