# 🐱 Base de Gatos

🇬🇧 [Read in English](README.md)

Aplicação web desenvolvida em **Java / Spring Boot** para o **MEG – Movimento Esterilização de Gatos de Lisboa**, uma associação que resgata, esteriliza e cuida de gatos de rua.

O sistema centraliza a gestão dos gatos acompanhados pela associação, o trabalho dos voluntários, as adoções e as doações.

> Projeto final em grupo do curso intensivo de programação Java no **ISCTE – Instituto Universitário de Lisboa** (2026).

## Funcionalidades

- Acesso por perfil para **administradores, voluntários e adotantes** (Spring Security)
- Cadastro e acompanhamento de gatos, com upload de fotos
- Registro de medicação por animal
- Escala de turnos, tarefas e notas dos voluntários
- Pedidos de adoção
- Controle de estoque e avisos
- Doações online via **Stripe** (modo de teste)
- Notificações por e-mail
- Base de dados pré-carregada com dados realistas para demonstração

## Tecnologias

- Java 17 · Spring Boot 4
- Spring MVC · Spring Security
- Spring Data JPA / Hibernate · MySQL
- JSP / JSTL · HTML · CSS · JavaScript
- Stripe API · Spring Mail
- Maven

## Arquitetura

O projeto segue uma arquitetura em camadas (**Controller → Service → Repository**). Os controllers não acessam repositórios diretamente: toda a regra de negócio passa pela camada de serviço.

## Minha contribuição

Fui responsável principalmente pelo **backend voltado aos voluntários**:

- Modelagem das entidades JPA e dos relacionamentos
- Lógica de gestão de turnos dos voluntários
- Correção de um bug na atribuição de múltiplos voluntários
- Módulo de registro de medicação dos gatos
- `DataInitializer` para popular o sistema com dados realistas do MEG
- Refatoração arquitetural para que os controllers passassem a usar apenas a camada de serviço

## Como executar

**Requisitos:** Java 17 e MySQL.

1. Clone o repositório
   ```bash
   git clone https://github.com/fehsmm/base_gatos.git
   ```
2. Crie um banco de dados MySQL chamado `base_gatos_oficial`.
3. Crie o arquivo `src/main/resources/application-secrets.properties` (ele é ignorado pelo Git) com as suas credenciais:
   ```properties
   spring.datasource.password=sua_senha_mysql
   stripe.api.key=sk_test_...
   spring.mail.username=seu_email@gmail.com
   spring.mail.password=sua_senha_de_app
   ```
4. Rode a aplicação
   ```bash
   ./mvnw spring-boot:run
   ```
5. Acesse `http://localhost:8080`

## Equipe

- Fernanda Moura
- Daniel Duarte
- João Louro
- Vitor Braz
