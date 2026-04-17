package pt.upskill.base_gatos_demo.configuration;

import jakarta.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pt.upskill.base_gatos_demo.entities.*;
import pt.upskill.base_gatos_demo.repositories.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
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
    @Autowired
    private NoteRepository noteRepository;
    @Autowired
    private ReportRepository reportRepo;


    @PostConstruct
    @Transactional
    public void init() {

        if (userRepository.count() == 0) {
            List<User> users = List.of(
                    new User("AdminSistema", "admin", "123", "admin", 910000001L, "Rua Central, 1", "admin@gmail.pt", true),
                    new User("João Voluntário", "joao.vol", "123", "volunteer", 910000002L, "Avenida da Liberdade, 10", "joao@gmail.pt", true),
                    new User("Maria Adotante", "maria.adop", "123", "adopter", 910000003L, "Rua das Flores, 5", "maria@gmail.pt", true),
                    new User("Pedro Voluntário", "pedro.vol", "123", "volunteer", 910000004L, "Travessa do Ouro, 12", "pedro@gmail.pt", true),
                    new User("Ana Adotante", "ana.adop", "123", "adopter", 910000005L, "Praceta do Sol, 3", "ana@gmail.pt", true),
                    new User("Catarina Voluntária", "catarina.vol", "123", "volunteer", 969000001L, "Praça do Chile, 15", "catarina@gmail.pt", false)
            );

            for(User user : users) {
                user.setAccountCreation(LocalDateTime.now());
            }

            for (User user : users) {
                if (userRepository.getUserByUsername(user.getUsername()) == null) {
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                    userRepository.save(user);
                }
            }
        }

        if (annRepo.count() == 0) {
            Object[][] announcements = {
                    {"urgent", "⚠️ Urgente — Favorito precisa de medicação às 15h30", "O Favorito está a fazer tratamento com Caniquantel e Doxyboctin. É obrigatório dar sempre com comida antes e depois. Confirmar com a coordenadora se houver dúvidas."},
                    {"high", "Consulta veterinária marcada — 20 de Abril", "O Favorito e a Natalina têm consulta marcada no dia 20 de Abril às 10h na Associação Zoófila Portuguesa. Precisamos de voluntária disponível para transporte."},
                    {"normal", "Novo protocolo de limpeza das jaulas", "A partir desta semana, as jaulas dos gatos com coriza devem ser limpas sempre por último. Usar luvas descartáveis e desinfetar as mãos entre cada jaula."},
                    {"normal", "Bem-vinda à nova voluntária Catarina!", "A Catarina juntou-se à nossa equipa esta semana. Por favor ajudem-na a integrar-se e mostrem-lhe os procedimentos do abrigo."},
                    {"low", "Ração a acabar — repor stock", "O saco de ração seca da Royal Canin está quase no fim. Quem puder trazer na próxima escala agradecemos. Ver lista de compras na arrecadação."}
            };

            for (Object[] ann : announcements) {
                Announcement a = new Announcement();
                a.setPriority((String) ann[0]);
                a.setTitle((String) ann[1]);
                a.setDescription((String) ann[2]);
                a.setCreatedAt(LocalDateTime.now().minusDays((int) (Math.random() * 7)));
                a.setCreatedBy("AdminSistema");
                annRepo.save(a);
            }
        }

        if (stockRepo.count() == 0) {
            Object[][] stocks = {
                    {"Ração Seca Royal Canin", 2, 5, "Kg", "Alimentação"},
                    {"Ração Húmida Whiskas", 8, 10, "Latas", "Alimentação"},
                    {"Areia para gatos", 3, 4, "Sacos", "Higiene"},
                    {"Álcool gel", 1, 3, "Frascos", "Higiene"},
                    {"Luvas descartáveis", 20, 15, "Pares", "Higiene"},
                    {"Sacos do lixo", 15, 10, "Unidades", "Limpeza"},
                    {"Desinfetante", 2, 3, "Frascos", "Limpeza"},
                    {"Comedouros", 5, 3, "Unidades", "Equipamento"}
            };

            for (Object[] st : stocks) {
                Stock s = new Stock();
                s.setProductType((String) st[0]);
                s.setCurrentQuantity((int) st[1]);
                s.setLowQuantity((int) st[2]);
                s.setMeasureUnit((String) st[3]);
                s.setTag((String) st[4]);
                s.setLowStock(s.isLowStock());
                stockRepo.save(s);
            }
        }

        if (catRepo.count() == 0) {
            Object[][] cats = {
                    {"Branco", "3 anos", true, "Europeu comum", "Disponível", "2023-06-15",
                            "O Branco é um gato muito carinhoso e sociável. Dá-se bem com outros gatos e adora festas. Está à procura de um lar tranquilo onde possa ser o centro das atenções.",
                            false, false, true, true, true, "e8b7e3e0-2e24-4ea8-a437-d144f1ffe4b4.jpg"},
                    {"Andreia", "5 anos", false, "Europeu comum", "Disponível", "2022-11-20",
                            "A Andreia é uma gata um pouco tímida no início mas muito meiga quando cria confiança. Prefere ambientes calmos e sem crianças pequenas.",
                            false, false, true, true, true, "6641c4cf-f2bc-4ffb-80ee-e37e63832c94.jpg"},
                    {"Favorito", "8 anos", true, "Europeu comum", "Disponível", "2021-03-10",
                            "O Favorito é o mais antigo do abrigo e o queridinho de todas as voluntárias. Tem alguma dificuldade em ser adotado pela idade mas é um gato absolutamente adorável.",
                            false, false, true, true, true, "6af72982-cc56-4e5a-a7f0-08cc23ef80fc.jpg"},
                    {"Natalina", "2 anos", false, "Tricolor", "Disponível", "2024-01-05",
                            "A Natalina chegou ao abrigo no Natal e rapidamente conquistou toda a gente. É muito brincalhona e enérgica. Ideal para família com crianças.",
                            false, false, true, false, false, "fd561020-f1ba-4c2d-b8c6-e1c291f0aa5a.jpg"},
                    {"Kelly", "4 anos", false, "Europeu comum", "Disponível", "2023-09-30",
                            "A Kelly é uma gata muito especial — às vezes parece triste mas é só o temperamento dela. Adora paté e fica completamente diferente quando lhe dão o petisco favorito.",
                            false, false, true, true, true, "a1bfdb8a-5788-4d8a-a614-22d75cc3bdd9.jpg"},
                    {"Beringela", "1 ano", false, "Preta", "Disponível", "2024-08-12",
                            "A Beringela é a mais nova do abrigo. Está sempre a coçar-se e está a fazer tratamento para alergias. Muito curiosa e brincalhona.",
                            false, false, false, false, false, "e1d1cae1-e2c4-4a2d-ba3e-53b19430b133.jpg"},
                    {"Perdiz", "2 anos", false, "Preta", "Adotado", "2026-02-04",
                            "Não gosta muito de brincar. Adora dormir. Ótima companhia para pessoas idosas.",
                            false, false, true, true, true, "585576c8-a870-4b6c-bfb1-cc2f274bae03.jpg"},
                    {"Lagoa", "7 meses", false, "Europeu comum", "Em Processo", "2026-04-02",
                            "A Lagoa é muito meiga mas também muito tímida. Está sempre atenta ao que acontece ao redor e pode ficar a olhar-te por horas com aquela carinha gira.",
                            true, true, false, true, true, "89bc63db-7fc5-46f3-9824-1c23a825f7e3.jpg"}
            };

            for (Object[] c : cats) {
                Cat cat = new Cat();
                cat.setName((String) c[0]);
                cat.setEstimatedAge((String) c[1]);
                cat.setGender((boolean) c[2]);
                cat.setBreed((String) c[3]);
                cat.setStatus((String) c[4]);
                cat.setArrivalDate(LocalDate.parse((String) c[5]));
                cat.setDescription((String) c[6]);
                cat.setFiv((boolean) c[7]);
                cat.setFelv((boolean) c[8]);
                cat.setVaccination((boolean) c[9]);
                cat.setParasiteControl((boolean) c[10]);
                cat.setSterilization((boolean) c[11]);
                cat.setImage((String) c[12]);
                cat.setTags(new ArrayList<>());
                catRepo.save(cat);
            }
        }

        if (shiftRepo.count() == 0) {
            User joao = userRepository.getUserByUsername("joao.vol");
            User pedro = userRepository.getUserByUsername("pedro.vol");

            if (joao != null && pedro != null) {

                // Turno de hoje — para demo do fluxo completo
                Shift s1 = new Shift();
                s1.setDate(LocalDate.now());
                s1.setStartTime(LocalTime.of(9, 0));
                s1.setEndTime(LocalTime.of(23, 0));
                s1.setVolunteers(List.of(joao, pedro));
                s1.setTasks(new ArrayList<>());
                shiftRepo.save(s1);

                Task t1 = new Task();
                t1.setTitle("Alimentar os gatos");
                t1.setDescription("Dar ração seca e húmida a todos os gatos");
                t1.setCompleted(false);
                t1.setShift(s1);
                taskRepository.save(t1);

                Task t2 = new Task();
                t2.setTitle("Limpar jaulas");
                t2.setDescription("Limpar todas as jaulas — começar pelos gatos mais saudáveis");
                t2.setCompleted(false);
                t2.setShift(s1);
                taskRepository.save(t2);

                Task t3 = new Task();
                t3.setTitle("Trocar água");
                t3.setDescription("Mudar a água de todos os bebedouros e limpar a fonte");
                t3.setCompleted(false);
                t3.setShift(s1);
                taskRepository.save(t3);

                Task t4 = new Task();
                t4.setTitle("Dar medicação ao Favorito");
                t4.setDescription("Caniquantel 1/2 cp + Doxyboctin 1/4 cp — sempre com comida antes e depois");
                t4.setCompleted(false);
                t4.setShift(s1);
                taskRepository.save(t4);

                // Turnos futuros
                Shift s2 = new Shift();
                s2.setDate(LocalDate.now().plusDays(3));
                s2.setStartTime(LocalTime.of(14, 0));
                s2.setEndTime(LocalTime.of(18, 0));
                s2.setVolunteers(List.of(joao));
                s2.setTasks(new ArrayList<>());
                shiftRepo.save(s2);

                Shift s3 = new Shift();
                s3.setDate(LocalDate.now().plusDays(7));
                s3.setStartTime(LocalTime.of(9, 0));
                s3.setEndTime(LocalTime.of(13, 0));
                s3.setVolunteers(List.of(joao, pedro));
                s3.setTasks(new ArrayList<>());
                shiftRepo.save(s3);

                // Turno concluído com notas — para demo do shift-report
                Shift s4 = new Shift();
                s4.setDate(LocalDate.now().minusDays(4));
                s4.setStartTime(LocalTime.of(9, 0));
                s4.setEndTime(LocalTime.of(13, 0));
                s4.setStartedAt(LocalDateTime.now().minusDays(4).withHour(9).withMinute(5));
                s4.setEndedAt(LocalDateTime.now().minusDays(4).withHour(12).withMinute(50));
                s4.setVolunteers(List.of(pedro));
                s4.setTasks(new ArrayList<>());
                shiftRepo.save(s4);

                Note nota1 = new Note();
                nota1.setShift(s4);
                nota1.setSummary("Escala correu bem. Todos os gatos comeram. Limpeza feita. Favorito tomou a medicação sem problemas.");
                nota1.setImportantObservations("A Kelly esteve muito murchinha durante toda a escala. Na primeira vez que a vimos miar parecia que lhe faltava a voz. Teve reflexos de vómito mas sem concretizar. A Beringela estava a coçar-se muito — pode precisar de consulta.");
                nota1.setRead(false);
                nota1.setPriority("high");
                nota1.setUpdatedAt(LocalDateTime.now().minusDays(4).withHour(13));
                noteRepository.save(nota1);

                s4.setNotes(List.of(nota1));
                shiftRepo.save(s4);

                Shift s5 = new Shift();
                s5.setDate(LocalDate.now().minusDays(8));
                s5.setStartTime(LocalTime.of(14, 0));
                s5.setEndTime(LocalTime.of(18, 0));
                s5.setStartedAt(LocalDateTime.now().minusDays(8).withHour(14).withMinute(3));
                s5.setEndedAt(LocalDateTime.now().minusDays(8).withHour(17).withMinute(45));
                s5.setVolunteers(List.of(joao));
                s5.setTasks(new ArrayList<>());
                shiftRepo.save(s5);

                Note nota2 = new Note();
                nota2.setShift(s5);
                nota2.setSummary("Escala da tarde. Todos os gatos bem. Favorito comeu bem e tomou a medicação sem problemas. Natalina muito brincalhona hoje.");
                nota2.setImportantObservations("A fonte de água estava com o motor a fazer barulho estranho — avisámos a coordenadora. Deixámos a areia da Andreia para lavar na próxima escala pois não tivemos tempo.");
                nota2.setRead(true);
                nota2.setPriority("normal");
                nota2.setUpdatedAt(LocalDateTime.now().minusDays(8).withHour(18));
                noteRepository.save(nota2);

                s5.setNotes(List.of(nota2));
                shiftRepo.save(s5);

            } else {
                System.out.println("⚠️ DataInitializer: Voluntários 'joao.vol' ou 'pedro.vol' não encontrados — turnos não criados.");
            }
        }

        if (medRepo.count() == 0 && catRepo.count() > 0) {
            Cat favorito = catRepo.findByNameContainingIgnoreCaseOrderByArrivalDateDesc("Favorito").stream().findFirst().orElse(catRepo.findAll().get(0));
            Cat andreia = catRepo.findByNameContainingIgnoreCaseOrderByArrivalDateDesc("Andreia").stream().findFirst().orElse(catRepo.findAll().get(0));

            MedicationRecord med1 = new MedicationRecord();
            med1.setCat(favorito);
            med1.setMedicationName("Caniquantel");
            med1.setDose("1/2 comprimido de 24 em 24 horas durante 5 dias");
            med1.setStorageLocation("Caixa branca dos medicamentos — prateleira do meio");
            med1.setStartDate(LocalDate.now().minusDays(2));
            med1.setEndDate(LocalDate.now().plusDays(3));
            med1.setNotes("Dar sempre com comida antes e depois. Comer antes e depois da medicação.");
            med1.setCreatedBy("AdminSistema");
            medRepo.save(med1);

            MedicationRecord med2 = new MedicationRecord();
            med2.setCat(favorito);
            med2.setMedicationName("Doxyboctin");
            med2.setDose("20mg — 1/4 comprimido de 24 em 24 horas durante 21 dias");
            med2.setStorageLocation("Caixa branca dos medicamentos — prateleira do meio");
            med2.setStartDate(LocalDate.now().minusDays(2));
            med2.setEndDate(LocalDate.now().plusDays(19));
            med2.setNotes("Sempre com comida. Nunca dar em jejum.");
            med2.setCreatedBy("AdminSistema");
            medRepo.save(med2);

            MedicationRecord med3 = new MedicationRecord();
            med3.setCat(andreia);
            med3.setMedicationName("Lepicortinol");
            med3.setDose("5mg — 3/4 comprimido de 3 em 3 dias");
            med3.setStorageLocation("Gaveta da Andreia — junto à jaula");
            med3.setStartDate(LocalDate.now().minusDays(10));
            med3.setEndDate(LocalDate.now().plusDays(5));
            med3.setNotes("Continua sempre de 3 em 3 dias. Verificar se engoliu o comprimido.");
            med3.setCreatedBy("AdminSistema");
            medRepo.save(med3);
        }


        if (adoptRepo.count() == 0) {

            User maria = userRepository.getUserByUsername("maria.adop");
            User ana = userRepository.getUserByUsername("ana.adop");

            if (maria != null && ana != null) {

                List<Cat> cats = catRepo.findByStatus("Disponível");

                if (cats.size() >= 2) {

                    Cat cat1 = catRepo.findFirstByName("Branco");
                    Cat cat2 = catRepo.findFirstByName("Natalina");
                    Cat cat3 = catRepo.findFirstByName("Kelly");

                    if (cat1 == null || cat2 == null || cat3 == null) {
                        System.out.println("⚠️ DataInitializer: Gatos para adoção não encontrados — adoções não criadas.");
                        return;
                    }

                    Adoption a1 = new Adoption();
                    a1.setUser(maria);
                    a1.setCat(cat1);
                    a1.setStatus("Aprovada");
                    a1.setApplicantName(maria.getName());
                    a1.setReason("Adoro gatos");
                    a1.setExperience("Tenho experiência com animais");
                    a1.setAdoptionDate(LocalDate.now());
                    a1.setRead(true);
                    adoptRepo.save(a1);

                    Adoption a2 = new Adoption();
                    a2.setUser(maria);
                    a2.setCat(cat2);
                    a2.setStatus("Pendente");
                    a2.setApplicantName(maria.getName());
                    a2.setReason("Adoro gatos");
                    a2.setExperience("Tenho experiência com gatinhos");
                    a2.setAdoptionDate(LocalDate.now());
                    adoptRepo.save(a2);

                    Adoption a3 = new Adoption();
                    a3.setUser(ana);
                    a3.setCat(cat3);
                    a3.setStatus("Pendente");
                    a3.setApplicantName(ana.getName());
                    a3.setReason("Adoro gatos");
                    a3.setExperience("Tenho experiência com gatinhos");
                    a3.setAdoptionDate(LocalDate.now());
                    adoptRepo.save(a3);

                    // atualizar estado
                    cat1.setStatus("Adotado");
                    cat2.setStatus("Disponível");
                    cat3.setStatus("Disponível");
                    catRepo.save(cat1);
                    catRepo.save(cat2);
                    catRepo.save(cat3);

                    Report reportMaria = new Report();
                    reportMaria.setUser(maria);
                    reportMaria.setCat(cat1);
                    reportMaria.setStatus("Excelente");
                    reportMaria.setNotes("Muito bem adaptado");
                    reportMaria.setReportDate(LocalDateTime.now());

                    reportRepo.save(reportMaria);

                } else {
                    System.out.println("Não há gatos suficientes disponíveis!");
                }

            }
        }

    }
}