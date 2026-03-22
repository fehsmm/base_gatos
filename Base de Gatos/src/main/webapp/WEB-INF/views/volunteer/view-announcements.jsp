<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Comunicados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../layout.jsp" />
        <div class="page-title">Comunicados</div>
        <div class="page-subtitle">Informações importantes para os voluntários.</div>

        <div class="panel">
            <strong>Atualização de rotina</strong>
            <p>A medicação do gato Thor passa a ser administrada duas vezes por dia.</p>
        </div>

        <div class="panel">
            <strong>Falta de stock</strong>
            <p>Estamos com pouco stock de ração húmida. Registar pedidos quando necessário.</p>
        </div>

        <div class="panel">
            <strong>Limpeza de sábado</strong>
            <p>No próximo sábado haverá limpeza geral da área externa do abrigo.</p>
        </div>
    </main>
</div>
</body>
</html>