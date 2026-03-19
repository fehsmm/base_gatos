<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Pedir Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../header.jsp" />
        <div class="page-title">Pedir Stock</div>
        <div class="page-subtitle">Registe materiais em falta no abrigo.</div>

        <div class="panel">
            <label class="form-label">Item</label>
            <select class="form-select-custom">
                <option>Ração seca</option>
                <option>Ração húmida</option>
                <option>Areia</option>
                <option>Medicamentos</option>
                <option>Luvas</option>
                <option>Produtos de limpeza</option>
            </select>

            <label class="form-label">Quantidade</label>
            <input type="number" class="form-control-custom" placeholder="Ex: 5">

            <label class="form-label">Observações</label>
            <textarea class="form-textarea-custom" placeholder="Explique o motivo do pedido"></textarea>

            <button class="btn-primary-custom">Enviar Pedido</button>
        </div>
    </main>
</div>
</body>
</html>