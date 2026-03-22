<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Notas do Turno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../layout.jsp" />
        <div class="page-title">Notas do Turno</div>
        <div class="page-subtitle">Registe observações para o próximo voluntário.</div>

        <div class="panel">
            <label class="form-label">Resumo do turno</label>
            <textarea class="form-textarea-custom" placeholder="Ex: O Thor comeu pouco, a Luna estava mais ativa, faltam sacos de areia..."></textarea>

            <label class="form-label">Ocorrências importantes</label>
            <textarea class="form-textarea-custom" placeholder="Ex: Gato isolado, medicação administrada, limpeza pendente..."></textarea>

            <button class="btn-primary-custom">Guardar Notas</button>
        </div>
    </main>
</div>
</body>
</html>