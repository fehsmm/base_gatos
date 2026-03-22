<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Turno Atual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../header.jsp" />
        <div class="page-title">Turno Atual</div>
        <div class="page-subtitle">Resumo do turno em curso.</div>

        <div class="shift-card">
            <div class="shift-date">quarta-feira, 18 de março de 2026</div>
            <div class="shift-time">10:00 - 14:00</div>

            <div class="task-list">
                <div class="task-item">
                    <input type="checkbox">
                    <div>
                        <div class="task-title">Trocar água</div>
                        <div class="task-description">Verificar todos os recipientes</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox">
                    <div>
                        <div class="task-title">Limpar zona comum</div>
                        <div class="task-description">Varredura e organização</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox">
                    <div>
                        <div class="task-title">Observar gato em recuperação</div>
                        <div class="task-description">Monitorizar comportamento do Thor</div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>