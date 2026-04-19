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

        //USERS
        if (userRepository.count() == 0) {
            List<User> users = List.of(
                    // ADMIN
                    new User("AdminSistema", "admin", "123", "admin", 910000001L, "Rua Central, 1", "admin@gmail.pt", true),

                    //VOLUNTÁRIOS
                    new User("João Silva", "joao.vol", "123", "volunteer", 910000002L, "Avenida da Liberdade, 10", "joao@gmail.pt", true),
                    new User("Pedro Costa", "pedro.vol", "123", "volunteer", 910000003L, "Travessa do Ouro, 12", "pedro@gmail.pt", true),
                    new User("Inês Martins", "ines.vol", "123", "volunteer", 910000004L, "Rua do Almada, 22", "ines@gmail.pt", true),
                    new User("Catarina Lopes", "catarina.vol", "123", "volunteer", 969000001L, "Praça do Chile, 15", "catarina@gmail.pt", false),
                    new User("Ricardo Gomes", "ricardo.vol", "123", "volunteer", 969000002L, "Rua Nova, 8", "ricardo@gmail.pt", false),

                    //ADOTANTES
                    new User("Maria Fernandes", "maria.adop", "123", "adopter", 910000005L, "Rua das Flores, 5", "maria@gmail.pt", true),
                    new User("Ana Ribeiro", "ana.adop", "123", "adopter", 910000006L, "Praceta do Sol, 3", "ana@gmail.pt", true),
                    new User("Bruno Carvalho", "bruno.adop", "123", "adopter", 910000007L, "Rua da Alegria, 44", "bruno@gmail.pt", true),
                    new User("Sofia Almeida", "sofia.adop", "123", "adopter", 910000008L, "Avenida do Mar, 9", "sofia@gmail.pt", true)
            );

            //para termos diferentes datas de criação
            LocalDateTime now = LocalDateTime.now();
            int i = 0;
            for (User user : users) {
                user.setAccountCreation(now.minusDays(i * 2));
                i++;
            }

            for (User user : users) {
                if (userRepository.getUserByUsername(user.getUsername()) == null) {
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                    userRepository.save(user);
                }
            }
        }

        //GATOS
        if (catRepo.count() == 0) {
            Object[][] cats = {
                    {"Branco", "3 anos", true, "Europeu comum", "Adotado", "2023-06-15",
                            "O Branco é um gato muito carinhoso e sociável. Dá-se bem com outros gatos e adora festas. Está à procura de um lar tranquilo onde possa ser o centro das atenções.",
                            false, false, true, true, true, List.of("Sociável", "Calmo"), "e8b7e3e0-2e24-4ea8-a437-d144f1ffe4b4.jpg"},
                    {"Andreia", "5 anos", false, "Europeu comum", "Disponível", "2022-11-20",
                            "A Andreia é uma gata um pouco tímida no início mas muito meiga quando cria confiança. Prefere ambientes calmos e sem crianças pequenas.",
                            false, false, true, true, true, List.of("Tímida", "Calma"), "6641c4cf-f2bc-4ffb-80ee-e37e63832c94.jpg"},
                    {"Favorito", "8 anos", true, "Europeu comum", "Disponível", "2021-03-10",
                            "O Favorito é o mais antigo do abrigo e o queridinho de todas as voluntárias. Tem alguma dificuldade em ser adotado pela idade mas é um gato absolutamente adorável.",
                            false, false, true, true, true, List.of("Idoso", "Dócil"), "6af72982-cc56-4e5a-a7f0-08cc23ef80fc.jpg"},
                    {"Natalina", "2 anos", false, "Tricolor", "Adotado", "2024-01-05",
                            "A Natalina chegou ao abrigo no Natal e rapidamente conquistou toda a gente. É muito brincalhona e enérgica. Ideal para família com crianças.",
                            false, false, true, false, false, List.of("Energética", "Brincalhona"), "fd561020-f1ba-4c2d-b8c6-e1c291f0aa5a.jpg"},
                    {"Kelly", "4 anos", false, "Europeu comum", "Adotado", "2023-09-30",
                            "A Kelly é uma gata muito especial — às vezes parece triste mas é só o temperamento dela. Adora paté e fica completamente diferente quando lhe dão o petisco favorito.",
                            false, false, true, true, true, List.of("Gulosa", "Independente"), "a1bfdb8a-5788-4d8a-a614-22d75cc3bdd9.jpg"},
                    {"Beringela", "1 ano", false, "Preta", "Disponível", "2024-08-12",
                            "A Beringela é a mais nova do abrigo. Está sempre a coçar-se e está a fazer tratamento para alergias. Muito curiosa e brincalhona.",
                            true, true, false, false, false, List.of("Tratamento", "Curiosa"), "e1d1cae1-e2c4-4a2d-ba3e-53b19430b133.jpg"},
                    {"Perdiz", "2 anos", false, "Preta", "Adotado", "2026-02-04",
                            "Não gosta muito de brincar. Adora dormir. Ótima companhia para pessoas idosas.",
                            false, false, true, true, true, List.of("Calma", "Caseira"), "585576c8-a870-4b6c-bfb1-cc2f274bae03.jpg"},
                    {"Lagoa", "7 meses", false, "Europeu comum", "Em Processo", "2026-04-02",
                            "A Lagoa é muito meiga mas também muito tímida. Está sempre atenta ao que acontece ao redor e pode ficar a olhar-te por horas com aquela carinha gira.",
                            true, true, false, true, true, List.of("Tímida", "Observadora"), "89bc63db-7fc5-46f3-9824-1c23a825f7e3.jpg"},
                    {"Tobias", "3 anos", true, "Laranja", "Em Processo", "2024-05-20",
                            "Muito sociável, dá-se bem com outros gatos e também com cães, precisa de companhia de quatro patas.",
                            false, false, true, true, true, List.of("Sociável", "Brincalhão"), "89bc63db-7fc5-46f3-9824-1c23a825f7e3.jpg"},
                    {"Nuvem", "6 anos", false, "Branco", "Disponível", "2022-07-10",
                            "Gata FIV+, precisa de cuidados especiais.",
                            true, false, true, true, true, List.of("FIV+", "Especial"), "89bc63db-7fc5-46f3-9824-1c23a825f7e3.jpg"}
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
                cat.setTags((List<String>) c[12]);
                cat.setImage((String) c[13]);
                catRepo.save(cat);
            }
        }

        //ADOÇÕES
        if (adoptRepo.count() == 0) {
            User maria = userRepository.getUserByUsername("maria.adop");
            User ana = userRepository.getUserByUsername("ana.adop");
            User bruno = userRepository.getUserByUsername("bruno.adop");
            User sofia = userRepository.getUserByUsername("sofia.adop");

            Cat branco = catRepo.findFirstByName("Branco");
            Cat natalina = catRepo.findFirstByName("Natalina");
            Cat kelly = catRepo.findFirstByName("Kelly");
            Cat perdiz = catRepo.findFirstByName("Perdiz");
            Cat andreia = catRepo.findFirstByName("Andreia");
            Cat tobias = catRepo.findFirstByName("Tobias");

            if (maria == null || ana == null || bruno == null || sofia == null ||
                    branco == null || natalina == null || kelly == null || perdiz == null || andreia == null || tobias == null) {

                System.out.println("⚠️ DataInitializer: Dados de adoção incompletos.");
                return;
            }

            LocalDate today = LocalDate.now();

            //MARIA » Branco + Natalina
            Adoption a1 = new Adoption();
            a1.setUser(maria);
            a1.setCat(branco);
            a1.setApplicantName(maria.getName());
            a1.setEmail(maria.getEmail());
            a1.setPhone(String.valueOf(maria.getTelephone()));
            a1.setAddress(maria.getAddress());
            a1.setReason("Procuro companhia tranquila para casa.");
            a1.setExperience("Já tive gatos durante vários anos.");
            a1.setStatus("Aprovada");
            a1.setRequestDate(branco.getArrivalDate().atStartOfDay().plusDays(5));
            a1.setReviewDate(a1.getRequestDate().plusDays(2));
            a1.setAdoptionDate(a1.getReviewDate().toLocalDate());
            a1.setRead(true);
            adoptRepo.save(a1);

            Adoption a2 = new Adoption();
            a2.setUser(maria);
            a2.setCat(natalina);
            a2.setApplicantName(maria.getName());
            a2.setEmail(maria.getEmail());
            a2.setPhone(String.valueOf(maria.getTelephone()));
            a2.setAddress(maria.getAddress());
            a2.setReason("Quero uma gata jovem e ativa.");
            a2.setExperience("Tenho experiência com gatos energéticos.");
            a2.setStatus("Aprovada");
            a2.setRequestDate(natalina.getArrivalDate().atStartOfDay().plusDays(3));
            a2.setReviewDate(a2.getRequestDate().plusDays(1));
            a2.setAdoptionDate(a2.getReviewDate().toLocalDate());
            a2.setRead(true);
            adoptRepo.save(a2);

            //ANA » Kelly, Andreia pendente
            Adoption a3 = new Adoption();
            a3.setUser(ana);
            a3.setCat(andreia);
            a3.setApplicantName(ana.getName());
            a3.setEmail(ana.getEmail());
            a3.setPhone(String.valueOf(ana.getTelephone()));
            a3.setAddress(ana.getAddress());
            a3.setReason("Procuro uma companhia para a Kelly.");
            a3.setExperience("Alguma experiência com gatos.");
            a3.setStatus("Pendente");
            a3.setRequestDate(andreia.getArrivalDate().atStartOfDay().plusDays(7));
            a3.setRead(false);
            adoptRepo.save(a3);

            Adoption a6 = new Adoption();
            a6.setUser(ana);
            a6.setCat(kelly);
            a6.setApplicantName(ana.getName());
            a6.setEmail(ana.getEmail());
            a6.setPhone(String.valueOf(ana.getTelephone()));
            a6.setAddress(ana.getAddress());
            a6.setReason("Procuro uma gata calma para apartamento.");
            a6.setExperience("Alguma experiência com gatos.");
            a6.setStatus("Aprovada");
            a6.setRequestDate(kelly.getArrivalDate().atStartOfDay().plusDays(7));
            a6.setReviewDate(a2.getRequestDate().plusDays(5));
            a6.setAdoptionDate(a2.getReviewDate().toLocalDate());
            a6.setRead(true);
            adoptRepo.save(a6);

            //BRUNO » Perdiz
            Adoption a4 = new Adoption();
            a4.setUser(bruno);
            a4.setCat(perdiz);
            a4.setApplicantName(bruno.getName());
            a4.setEmail(bruno.getEmail());
            a4.setPhone(String.valueOf(bruno.getTelephone()));
            a4.setAddress(bruno.getAddress());
            a4.setReason("Quero um gato tranquilo para companhia.");
            a4.setExperience("Primeira vez com gatos.");
            a4.setStatus("Aprovada");
            a4.setRequestDate(perdiz.getArrivalDate().atStartOfDay().plusDays(10));
            a4.setReviewDate(a4.getRequestDate().plusDays(2));
            a4.setAdoptionDate(a4.getReviewDate().toLocalDate());
            a4.setRead(true);
            adoptRepo.save(a4);

            //SOFIA » Tobias rejeitado
            Adoption a5 = new Adoption();
            a5.setUser(sofia);
            a5.setCat(tobias);
            a5.setApplicantName(sofia.getName());
            a5.setEmail(sofia.getEmail());
            a5.setPhone(String.valueOf(sofia.getTelephone()));
            a5.setAddress(sofia.getAddress());
            a5.setReason("Procuro um novo gatinho para apartamento.");
            a5.setExperience("Tenho uma gata sénior.");
            a5.setStatus("Rejeitada");
            a5.setRequestDate(tobias.getArrivalDate().atStartOfDay().plusDays(2));
            a5.setRead(true);
            a5.setRejectionMotive("Já recebemos contacto sobre o Tobias e ele está atualmente em início de processo de adoção");
            adoptRepo.save(a5);
        }

        //RELATÓRIOS PÓS-ADOÇÃO
        if (reportRepo.count() == 0) {
            User bruno = userRepository.getUserByUsername("bruno.adop");
            User ana = userRepository.getUserByUsername("ana.adop");
            User maria = userRepository.getUserByUsername("maria.adop");

            Cat perdiz = catRepo.findFirstByName("Perdiz");
            Cat kelly = catRepo.findFirstByName("Kelly");
            Cat branco = catRepo.findFirstByName("Branco");
            Cat natalina = catRepo.findFirstByName("Natalina");

            if (bruno == null || ana == null || maria == null ||
                    perdiz == null || kelly == null || branco == null || natalina == null) {

                System.out.println("⚠️ Dados de relatórios incompletos.");
                return;
            }

            //PERDIZ (Bruno)
            Report p1 = new Report();
            p1.setUser(bruno);
            p1.setCat(perdiz);
            p1.setStatus("Bom");
            p1.setNotes("Adaptou-se rapidamente à nova casa. Passa grande parte do tempo a dormir e já procura contacto com o dono.");
            p1.setHealth("Sem alterações relevantes.");
            p1.setReportDate(LocalDateTime.now().minusDays(20));
            reportRepo.save(p1);

            Report p2 = new Report();
            p2.setUser(bruno);
            p2.setCat(perdiz);
            p2.setStatus("Excelente");
            p2.setNotes("Totalmente integrado. Muito tranquilo e afetuoso, especialmente durante a noite.");
            p2.setHealth("Sem alterações relevantes.");
            p2.setReportDate(LocalDateTime.now().minusDays(10));
            reportRepo.save(p2);

            Report p3 = new Report();
            p3.setUser(bruno);
            p3.setCat(perdiz);
            p3.setStatus("Excelente");
            p3.setNotes("Mantém comportamento calmo e estável. Demonstra confiança total no ambiente.");
            p3.setHealth("Sem alterações relevantes.");
            p3.setReportDate(LocalDateTime.now().minusDays(3));
            reportRepo.save(p3);

            // KELLY (Ana)
            Report k1 = new Report();
            k1.setUser(ana);
            k1.setCat(kelly);
            k1.setStatus("Normal");
            k1.setNotes("Inicialmente mais reservada. Evita contacto direto mas observa tudo ao redor.");
            k1.setHealth("Sem alterações relevantes.");
            k1.setReportDate(LocalDateTime.now().minusDays(18));
            reportRepo.save(k1);

            Report k2 = new Report();
            k2.setUser(ana);
            k2.setCat(kelly);
            k2.setStatus("Bom");
            k2.setNotes("Já aceita festas em momentos específicos, especialmente quando recebe comida húmida.");
            k2.setHealth("Apetite irregular nos primeiros dias, entretanto estabilizado.");
            k2.setReportDate(LocalDateTime.now().minusDays(9));
            reportRepo.save(k2);

            Report k3 = new Report();
            k3.setUser(ana);
            k3.setCat(kelly);
            k3.setStatus("Bom");
            k3.setNotes("Mais sociável, começa a procurar companhia. Mantém personalidade independente.");
            k3.setHealth("Sem alterações relevantes.");
            k3.setReportDate(LocalDateTime.now().minusDays(2));
            reportRepo.save(k3);

            // BRANCO (Maria)
            Report b1 = new Report();
            b1.setUser(maria);
            b1.setCat(branco);
            b1.setStatus("Excelente");
            b1.setNotes("Adaptação imediata. Muito carinhoso e confortável com a nova família.");
            b1.setReportDate(LocalDateTime.now().minusDays(25));
            b1.setHealth("Sem alterações relevantes.");
            reportRepo.save(b1);

            Report b2 = new Report();
            b2.setUser(maria);
            b2.setCat(branco);
            b2.setStatus("Excelente");
            b2.setNotes("Extremamente sociável, procura constantemente atenção e interação.");
            b2.setHealth("Sem alterações relevantes.");
            b2.setReportDate(LocalDateTime.now().minusDays(12));
            reportRepo.save(b2);

            Report b3 = new Report();
            b3.setUser(maria);
            b3.setCat(branco);
            b3.setStatus("Excelente");
            b3.setNotes("Perfeitamente integrado no ambiente familiar. Muito ativo e brincalhão.");
            b3.setHealth("Vacinação em dia.");
            b3.setReportDate(LocalDateTime.now().minusDays(4));
            reportRepo.save(b3);

            // NATALINA (Maria)
            Report n1 = new Report();
            n1.setUser(maria);
            n1.setCat(natalina);
            n1.setStatus("Bom");
            n1.setNotes("Muito ativa e curiosa. Explora constantemente a casa.");
            n1.setHealth("Sem alterações relevantes.");
            n1.setReportDate(LocalDateTime.now().minusDays(22));
            reportRepo.save(n1);

            Report n2 = new Report();
            n2.setUser(maria);
            n2.setCat(natalina);
            n2.setStatus("Excelente");
            n2.setNotes("Totalmente adaptada. Brinca frequentemente e interage bem com o Branco.");
            n2.setHealth("Sem alterações relevantes.");
            n2.setReportDate(LocalDateTime.now().minusDays(11));
            reportRepo.save(n2);

            Report n3 = new Report();
            n3.setUser(maria);
            n3.setCat(natalina);
            n3.setStatus("Excelente");
            n3.setNotes("Muito feliz e energética. Demonstra grande confiança no ambiente.");
            n3.setHealth("Foi esterilizada recentemente, mas fez uma boa recuperação.");
            n3.setReportDate(LocalDateTime.now().minusDays(1));
            reportRepo.save(n3);
        }

        //COMUNICADOS
        if (annRepo.count() == 0) {
            Object[][] announcements = {
                    {"urgent", "Urgente — Favorito precisa de medicação às 15h30", "O Favorito está a fazer tratamento com Caniquantel e Doxyboctin. É obrigatório dar sempre com comida antes e depois. Confirmar com a coordenadora se houver dúvidas."},
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
                if(Math.random() < 0.5) {
                    a.setLastUpdatedBy("AdminSistema");
                    a.setUpdatedAt(LocalDateTime.now().minusDays((int) (Math.random() * 7)));
                }
                annRepo.save(a);
            }
        }

        //STOCK
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
                if(Math.random() < 0.5) {
                    s.setUpdatedAt(LocalDateTime.now().minusDays((int) (Math.random() * 7)));
                }
                stockRepo.save(s);
            }
        }

        //TURNOS
        if (shiftRepo.count() == 0) {
            User joao = userRepository.getUserByUsername("joao.vol");
            User pedro = userRepository.getUserByUsername("pedro.vol");
            User ines = userRepository.getUserByUsername("ines.vol");

            if (joao != null && pedro != null && ines != null) {

                // Turno de hoje — para demo do fluxo completo
                Shift s1 = new Shift();
                s1.setDate(LocalDate.now());
                s1.setStartTime(LocalTime.of(9, 0));
                s1.setEndTime(LocalTime.of(23, 0));
                s1.setVolunteers(List.of(joao, pedro));
                shiftRepo.save(s1);

                // Turnos futuros
                Shift s2 = new Shift();
                s2.setDate(LocalDate.now().plusDays(2));
                s2.setStartTime(LocalTime.of(14, 0));
                s2.setEndTime(LocalTime.of(18, 0));
                s2.setVolunteers(List.of(joao, ines));
                shiftRepo.save(s2);

                Shift s3 = new Shift();
                s3.setDate(LocalDate.now().plusDays(3));
                s3.setStartTime(LocalTime.of(9, 0));
                s3.setEndTime(LocalTime.of(13, 0));
                s3.setVolunteers(List.of(pedro, ines));
                shiftRepo.save(s3);

                //Tarefas
                Task t1 = new Task();
                t1.setTitle("Alimentar os gatos");
                t1.setDescription("Dar ração seca e húmida a todos os gatos");
                t1.setCompleted(true);
                t1.setShift(s1);
                taskRepository.save(t1);

                Task t2 = new Task();
                t2.setTitle("Limpar jaulas");
                t2.setDescription("Limpar todas as jaulas — começar pelos gatos mais saudáveis");
                t2.setCompleted(true);
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

                Task t5 = new Task();
                t5.setTitle("Alimentar os gatos");
                t5.setDescription("Dar ração seca e húmida a todos os gatos");
                t5.setCompleted(false);
                t5.setShift(s2);
                taskRepository.save(t5);

                Task t6 = new Task();
                t6.setTitle("Limpar jaulas");
                t6.setDescription("Limpar todas as jaulas — começar pelos gatos mais saudáveis");
                t6.setCompleted(false);
                t6.setShift(s2);
                taskRepository.save(t6);

                Task t7 = new Task();
                t7.setTitle("Trocar água");
                t7.setDescription("Mudar a água de todos os bebedouros e limpar a fonte");
                t7.setCompleted(false);
                t7.setShift(s3);
                taskRepository.save(t7);

                Task t8 = new Task();
                t8.setTitle("Dar medicação ao Favorito");
                t8.setDescription("Caniquantel 1/2 cp + Doxyboctin 1/4 cp — sempre com comida antes e depois");
                t8.setCompleted(false);
                t8.setShift(s3);
                taskRepository.save(t8);

                List<Task> tasks1 = new ArrayList<>();
                tasks1.add(t1);
                tasks1.add(t2);
                tasks1.add(t3);
                tasks1.add(t4);

                List<Task> tasks2 = new ArrayList<>();
                tasks2.add(t5);
                tasks2.add(t6);

                List<Task> tasks3 = new ArrayList<>();
                tasks3.add(t7);
                tasks3.add(t8);

                s1.setTasks(tasks1);
                shiftRepo.save(s1);

                s2.setTasks(tasks2);
                shiftRepo.save(s2);

                s3.setTasks(tasks3);
                shiftRepo.save(s3);

                // Turno concluído com notas — para demo do shift-report
                Shift s4 = new Shift();
                s4.setDate(LocalDate.now().minusDays(4));
                s4.setStartTime(LocalTime.of(9, 0));
                s4.setEndTime(LocalTime.of(13, 0));
                s4.setStartedAt(LocalDateTime.now().minusDays(4).withHour(9).withMinute(5));
                s4.setEndedAt(LocalDateTime.now().minusDays(4).withHour(12).withMinute(50));
                s4.setVolunteers(List.of(ines, joao, pedro));
                shiftRepo.save(s4);

                Task t9 = new Task();
                t9.setTitle("Trocar água");
                t9.setDescription("Mudar a água de todos os bebedouros e limpar a fonte");
                t9.setCompleted(true);
                t9.setShift(s4);
                taskRepository.save(t9);

                Task t10 = new Task();
                t10.setTitle("Dar medicação ao Favorito");
                t10.setDescription("Caniquantel 1/2 cp + Doxyboctin 1/4 cp — sempre com comida antes e depois");
                t10.setCompleted(true);
                t10.setShift(s4);
                taskRepository.save(t10);

                List<Task> tasks4 = new ArrayList<>();
                tasks4.add(t9);
                tasks4.add(t10);

                Note nota1 = new Note();
                nota1.setShift(s4);
                nota1.setSummary("Escala correu bem. Todos os gatos comeram. Limpeza feita. Favorito tomou a medicação sem problemas.");
                nota1.setImportantObservations("A Kelly esteve muito murchinha durante toda a escala. Na primeira vez que a vimos miar parecia que lhe faltava a voz. Teve reflexos de vómito mas sem concretizar. A Beringela estava a coçar-se muito — pode precisar de consulta.");
                nota1.setRead(false);
                nota1.setPriority("high");
                nota1.setUpdatedAt(s4.getEndedAt());
                nota1.setAuthor(ines);
                noteRepository.save(nota1);

                s4.setTasks(tasks4);
                s4.setNotes(List.of(nota1));
                shiftRepo.save(s4);

                Shift s5 = new Shift();
                s5.setDate(LocalDate.now().minusDays(8));
                s5.setStartTime(LocalTime.of(14, 0));
                s5.setEndTime(LocalTime.of(18, 0));
                s5.setStartedAt(LocalDateTime.now().minusDays(8).withHour(14).withMinute(3));
                s5.setEndedAt(LocalDateTime.now().minusDays(8).withHour(17).withMinute(45));
                s5.setVolunteers(List.of(joao));
                shiftRepo.save(s5);

                Task t11 = new Task();
                t11.setTitle("Alimentar os gatos");
                t11.setDescription("Dar ração seca e húmida a todos os gatos");
                t11.setCompleted(true);
                t11.setShift(s5);
                taskRepository.save(t11);

                Task t12 = new Task();
                t12.setTitle("Limpar jaulas");
                t12.setDescription("Limpar todas as jaulas — começar pelos gatos mais saudáveis");
                t12.setCompleted(true);
                t12.setShift(s5);
                taskRepository.save(t12);

                List<Task> tasks5 = new ArrayList<>();
                tasks5.add(t11);
                tasks5.add(t12);

                Note nota2 = new Note();
                nota2.setShift(s5);
                nota2.setSummary("Escala da tarde. Todos os gatos bem. Favorito comeu bem e tomou a medicação sem problemas. Natalina muito brincalhona hoje.");
                nota2.setImportantObservations("A fonte de água estava com o motor a fazer barulho estranho — avisámos a coordenadora. Deixámos a areia da Andreia para lavar na próxima escala pois não tivemos tempo.");
                nota2.setRead(true);
                nota2.setPriority("normal");
                nota2.setUpdatedAt(s5.getEndedAt());
                nota2.setAuthor(joao);
                noteRepository.save(nota2);

                s5.setTasks(tasks5);
                s5.setNotes(List.of(nota2));
                shiftRepo.save(s5);

            } else {
                System.out.println("⚠️ DataInitializer: Voluntários 'joao.vol' ou 'pedro.vol' ou 'ines.vol' não encontrados — turnos não criados.");
            }
        }

        //MEDICAÇÃO
        if (medRepo.count() == 0 && catRepo.count() > 0) {
            Cat favorito = catRepo.findFirstByName("Favorito");
            Cat andreia = catRepo.findFirstByName("Andreia");

            MedicationRecord med1 = new MedicationRecord();
            med1.setCat(favorito);
            med1.setMedicationName("Caniquantel");
            med1.setDose("1/2 comprimido de 24 em 24 horas durante 5 dias");
            med1.setStorageLocation("Caixa branca dos medicamentos — prateleira do meio");
            med1.setStartDate(LocalDate.now().minusDays(2));
            med1.setEndDate(LocalDate.now().plusDays(3));
            med1.setNotes("Dar sempre com comida antes e depois. Comer antes e depois da medicação.");
            med1.setCreatedBy("AdminSistema");
            med1.setUpdatedBy("AdminSistema");
            med1.setLastAdministeredDate(LocalDate.now().minusDays(1));
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
            med2.setLastAdministeredDate(LocalDate.now());
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
            med3.setLastAdministeredDate(LocalDate.now());
            medRepo.save(med3);
        }

    }
}