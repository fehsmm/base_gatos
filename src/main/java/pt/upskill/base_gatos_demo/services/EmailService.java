package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String para, String assunto, String texto) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(para);
        message.setSubject(assunto);
        message.setText(texto);
        message.setFrom("grupobasedegatos@gmail.com");

        mailSender.send(message);
    }
}
