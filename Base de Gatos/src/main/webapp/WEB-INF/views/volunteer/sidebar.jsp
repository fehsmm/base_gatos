<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="volunteer-sidebar">
    <div class="sidebar-top">
        <div class="brand-box">
            <img src="/images/logo.svg" alt="Logo MEG" class="brand-logo">
            <div>
                <div class="brand-title">Abrigo Felino</div>
                <div class="brand-subtitle">Voluntário</div>
            </div>
        </div>

        <div class="volunteer-user">
            <strong>${user.username}</strong><br>
            <small>Utilizador autenticado</small>
        </div>

        <div class="menu-group">
            <a href="/volunteer/view-schedule" class="menu-item active">
                <img src="/icons/calendar.svg" alt="Escalas">
                <span>Minhas Escalas</span>
            </a>

            <a href="/volunteer/view-announcements" class="menu-item">
                <img src="/icons/announcements.svg" alt="Comunicados">
                <span>Comunicados</span>
            </a>

            <a href="/volunteer/leave-shift-notes" class="menu-item">
                <img src="/icons/checklist.svg" alt="Notas">
                <span>Notas de Turnos</span>
            </a>

            <a href="/volunteer/request-stock" class="menu-item">
                <img src="/icons/stock.svg" alt="Stock">
                <span>Pedir Stock</span>
            </a>

            <a href="/volunteer/view-shift" class="menu-item">
                <img src="/icons/dashboard.svg" alt="Turno">
                <span>Ver Turno Atual</span>
            </a>
        </div>
    </div>

    <div class="sidebar-footer">
        <a href="/public/home" class="menu-item footer-item">
            <img src="/icons/website.svg" alt="Website">
            <span>Site Público</span>
        </a>

        <a href="/auth/login" class="menu-item footer-item">
            <img src="/icons/logout.svg" alt="Logout">
            <span>Terminar Sessão</span>
        </a>

        <a href="#" class="menu-item footer-item delete-item">
            <img src="/icons/delete.svg" alt="Eliminar">
            <span>Eliminar Conta</span>
        </a>
    </div>
</nav>