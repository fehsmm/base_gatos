# 🐱 Base de Gatos

🇧🇷 [Leia em português](README.pt-BR.md)

A **Java / Spring Boot** web application built for **MEG – Movimento Esterilização de Gatos de Lisboa**, a Lisbon-based nonprofit that rescues, neuters and cares for street cats.

The system centralizes the management of the cats in the association's care, volunteer work, adoptions and donations.

> Final group project of the intensive Java programming course at **ISCTE – University Institute of Lisbon** (2026).

## Features

- Role-based access for **admins, volunteers and adopters** (Spring Security)
- Cat registration and tracking, with photo upload
- Per-animal medication records
- Volunteer shift scheduling, tasks and notes
- Adoption requests
- Stock control and announcements
- Online donations via **Stripe** (test mode)
- Email notifications
- Preloaded database with realistic demo data

## Tech Stack

- Java 17 · Spring Boot 4
- Spring MVC · Spring Security
- Spring Data JPA / Hibernate · MySQL
- JSP / JSTL · HTML · CSS · JavaScript
- Stripe API · Spring Mail
- Maven

## Architecture

The project follows a layered architecture (**Controller → Service → Repository**). Controllers never access repositories directly; all business logic goes through the service layer.

## My Contribution

I was mainly responsible for the **volunteer-facing backend**:

- Designed the JPA entities and their relationships
- Implemented volunteer shift management logic
- Fixed a bug in multi-volunteer assignment
- Built the medication records module
- Created a `DataInitializer` to populate the system with realistic MEG data
- Refactored the architecture so controllers route exclusively through the service layer

## Getting Started

**Requirements:** Java 17 and MySQL.

1. Clone the repository
   ```bash
   git clone https://github.com/fehsmm/base_gatos.git
   ```
2. Create a MySQL database named `base_gatos_oficial`.
3. Create the file `src/main/resources/application-secrets.properties` (it is git-ignored) with your own credentials:
   ```properties
   spring.datasource.password=your_mysql_password
   stripe.api.key=sk_test_...
   spring.mail.username=your_email@gmail.com
   spring.mail.password=your_app_password
   ```
4. Run the application
   ```bash
   ./mvnw spring-boot:run
   ```
5. Open `http://localhost:8080`

## Team

- Fernanda Moura
- Daniel Duarte
- João Louro
- Vitor Braz
