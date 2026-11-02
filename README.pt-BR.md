# 🐱 Base de Gatos

🇬🇧 [Read in English](README.md)

Aplicação web desenvolvida em **Java / Spring Boot** para o **MEG – Movimento Esterilização de Gatos de Lisboa**, uma associação que resgata, esteriliza e cuida de gatos de rua.

O sistema centraliza a gestão dos gatos acompanhados pela associação e a organização do trabalho dos voluntários.

> Projeto final em grupo do curso intensivo de programação Java no **ISCTE – Instituto Universitário de Lisboa** (2026).

## Funcionalidades

- Cadastro e acompanhamento de gatos
- Registro e controle de medicação por animal
- Gestão de voluntários e escalas de turnos
- [Doações via Stripe – confirmar]
- Base de dados pré-carregada com dados realistas para demonstração

## Tecnologias

- Java [17/21] · Spring Boot
- Spring Data JPA / Hibernate
- [MySQL / PostgreSQL / H2]
- [Thymeleaf / HTML / CSS / JavaScript]
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

1. Clone o repositório
   ```bash
   git clone https://github.com/fehsmm/base_gatos.git
   ```
2. Configure a variável de ambiente da chave de teste do Stripe:
   ```bash
   STRIPE_SECRET_KEY=sk_test_...
   ```
3. [Configure o banco de dados em `application.properties`]
4. Rode a aplicação
   ```bash
   mvn spring-boot:run
   ```
5. Acesse `http://localhost:8080`

## Equipe

- Fernanda [Sobrenome] – [LinkedIn]
- Daniel Duarte
- João Louro
- Vitor Braz
