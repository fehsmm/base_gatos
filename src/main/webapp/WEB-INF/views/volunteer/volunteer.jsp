<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Área do Voluntário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../header.jsp" />
        <div class="page-title">Área do Voluntário</div>
        <div class="page-subtitle">Bem-vinda à tua área de trabalho no abrigo.</div>

        <div class="panel">
            <p>Nesta área podes consultar as tuas escalas, ver o teu turno atual, acompanhar comunicados, pedir stock e deixar notas do turno.</p>
        </div>

        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-number orange">1</div>
                <div>Turno Hoje</div>
            </div>
            <div class="stat-card">
                <div class="stat-number green">2</div>
                <div>Turnos Completos</div>
            </div>
            <div class="stat-card">
                <div class="stat-number blue">5</div>
                <div>Tarefas Realizadas</div>
            </div>
        </div>

        <div class="panel">
            <h3 class="section-title" style="margin-top:0;">Acesso Rápido</h3>
            <ul class="simple-list">
                <li><a href="/volunteer/view-schedule">Ver as minhas escalas</a></li>
                <li><a href="/volunteer/view-shift">Consultar turno atual</a></li>
                <li><a href="/volunteer/view-announcements">Ler comunicados</a></li>
                <li><a href="/volunteer/request-stock">Pedir stock</a></li>
                <li><a href="/volunteer/leave-shift-notes">Deixar notas do turno</a></li>
            </ul>
        </div>
    </main>
</div>
</body>
</html>