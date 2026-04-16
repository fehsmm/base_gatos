<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pedir Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="request-stock" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title" style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">
                    Pedir Stock
                </div>
                <div class="page-subtitle" style="margin-bottom: 1.5rem;">
                    Registe materiais em falta no abrigo para que possamos repor o mais rapidamente possível.
                </div>

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
                    <textarea class="form-textarea-custom" placeholder="Exemplo: Ração Renal"></textarea>

                    <button type="button" class="btn btn-success">Enviar Pedido</button>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
