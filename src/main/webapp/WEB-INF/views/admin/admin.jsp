<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="header">
    <div class="sidebar">
        <div class="container">
            <div class="logo-icon">
                <img src="/images/paws.png" alt="logo">
            </div>
        </div>
            <strong>MEG</strong><br>
            <small class="text-muted">Administrator</small>
    </div>
</div>
<div class="mb-4">
        <strong>Nome do Utilizador</strong><br>
        <small class="text-muted">utilizador@email.com</small>
</div>
<nav class="sidebar-nav">
        <a href="/admin" class="active">📊 Dashboard</a>
        <a href="/admin/vet.jsp">🐱 Informação Clínica</a>
        <a href="/admin/manage-schedule.jsp">📅 Gerir Escalas</a>
        <a href="/admin/manage-users.jsp">👥 Gerir Utilizadores</a>
        <a href="/admin/manage-stock.jsp">📦 Gerir Stock</a>
        <a href="/admin/post-announcements.jsp">📢 Comunicados</a>
        <a href="/admin/manage-applications.jsp">✉️ Gerir Candidaturas</a>
</nav>
<div class="mt-5">
    <a href="/public/home">Site Público</a>
    <a href="">Terminar Sessão</a>
    <a href="" class="text-danger">Eliminar Conta</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>