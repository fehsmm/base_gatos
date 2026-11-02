# 🐱 Base de Gatos

🇧🇷 [Leia em português](README.pt-BR.md)

A **Java / Spring Boot** web application built for **MEG – Movimento Esterilização de Gatos de Lisboa**, a Lisbon-based nonprofit that rescues, neuters and cares for street cats.

The system centralizes the management of the cats in the association's care and the organization of volunteer work.

> Final group project of the intensive Java programming course at **ISCTE – University Institute of Lisbon** (2026).

## Features

- Cat registration and tracking
- Per-animal medication records
- Volunteer management and shift scheduling
- [Donations via Stripe – confirm]
- Preloaded database with realistic demo data

## Tech Stack

- Java [17/21] · Spring Boot
- Spring Data JPA / Hibernate
- [MySQL / PostgreSQL / H2]
- [Thymeleaf / HTML / CSS / JavaScript]
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

1. Clone the repository
   ```bash
   git clone https://github.com/fehsmm/base_gatos.git
   ```
2. Set the Stripe test key environment variable:
   ```bash
   STRIPE_SECRET_KEY=sk_test_...
   ```
3. [Configure the database in `application.properties`]
4. Run the application
   ```bash
   mvn spring-boot:run
   ```
5. Open `http://localhost:8080`

## Team

- Fernanda [Last name] – [LinkedIn]
- Daniel Duarte
- João Louro
- Vitor Braz
