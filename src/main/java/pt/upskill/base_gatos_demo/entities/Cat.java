package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.net.URL;
import java.util.Date;
import java.util.List;

public class Cat {
    @Id
    @GeneratedValue
    private Long id;

    private String imagem;
    private String nome;
    private String idade_estimada;
    private boolean genero;
    private String raca;
    private String estado;
    private Date data_captura;
    private String descricao;
    private List<String> tags;

    private boolean fiv;
    private boolean felv;
    private boolean vacinacao;
    private boolean desparazitacao;
    private boolean esterilizacao;



}
