# AGENTS.md

## Architecture Overview
This is a Spring Boot 4.0.3 MVC web application for managing a cat adoption shelter. It uses role-based access control with three user types: admin, volunteer, and adopter. The app manages cats, adoptions, announcements, shifts, tasks, medications, stock, and notes.

Key components:
- **Controllers**: Role-specific controllers (e.g., `AdminController`, `VolunteerController`) handle requests and return JSP view names.
- **Services**: Business logic layer (e.g., `CatService`) with autowired repositories.
- **Repositories**: JPA repositories (e.g., `CatRepository`) for data access.
- **Entities**: JPA entities (e.g., `Cat`, `User`) with relationships like `Cat.medications` (OneToMany).
- **Models**: DTOs/forms (e.g., `CreateCatModel`) for view binding.
- **Configuration**: Security config with role-based URL patterns, data initializer for demo data.

Data flows from controllers → services → repositories → entities, with views in `/WEB-INF/views/` and static assets in `src/main/resources/static/`.

## Critical Workflows
- **Build & Run**: Use Maven wrapper (`mvnw.cmd clean install` then `mvnw.cmd spring-boot:run`). App runs on embedded Tomcat with MySQL (localhost:3306/teste, root/no password).
- **Database**: JPA with `ddl-auto=create` recreates schema on startup. Initial data loaded via `DataInitializer` (users, cats, shifts, etc.).
- **Authentication**: Spring Security with custom `UserAuthenticationProvider`. Volunteers require approval; others auto-approved. Login redirects to role-specific dashboards.
- **Debugging**: Enable devtools for hot reload. Security logging set to DEBUG in `application.properties`.

## Project-Specific Patterns
- **Role Checks**: Use `User.isAdmin()`, `isVolunteer()`, `isAdopter()` methods instead of string comparisons.
- **Health Logic**: `Cat.isHealthy()` returns `fiv && felv` (note: likely a bug, as healthy cats should be FIV/FELV negative).
- **View Resolution**: Controllers return strings like `"auth/login"` mapping to `/WEB-INF/views/auth/login.jsp`.
- **Entity Relationships**: `Cat` has `@OneToMany MedicationRecord`, `Shift` has tasks and notes.
- **Data Initialization**: `@PostConstruct` in `DataInitializer` populates demo data if tables empty.
- **URL Security**: `/volunteer/**` requires VOLUNTEER role, `/admin/**` ADMIN, `/adopter/**` ADOPTER, `/private/**` ADMIN or VOLUNTEER, `/public/**` open.

## Key Files
- `pom.xml`: Dependencies include Spring Boot MVC, JPA, MySQL, Security, JSP support.
- `application.properties`: DB config, view prefixes/suffixes, security debug.
- `SecurityWebConfig.java`: Role-based HTTP security rules.
- `DataInitializer.java`: Loads initial users (admin/admin123, volunteers/adopters), cats, shifts with tasks.
- `User.java`: Entity with role/approved fields and helper methods.
- `Cat.java`: Entity with health booleans, formatted arrival date method.</content>
<parameter name="filePath">C:\Users\USUARIO\Desktop\JAVA - UPSKILL\PROJETO\base_gatos_base\AGENTS.md
