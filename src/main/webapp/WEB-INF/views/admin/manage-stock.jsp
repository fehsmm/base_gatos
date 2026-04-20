<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerir Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="manage-stock"/>
    <c:set var="dashboardUrl" value="/admin/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="admin-main">

        <div style="padding:1.5rem">
            <div class="mb-8">
                <h1 style="margin-bottom:.25rem">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px"
                         fill="black">
                        <path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/>
                    </svg>
                    Gestão de Stock
                </h1>
                <p>Registo e atualização do stock</p>

            </div>

            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <c:if test="${lowStockCount > 0}">
                <div style="display:flex;gap:1rem;flex-wrap:wrap">

                    <c:if test="${lowStockCount > 0}">
                        <c:choose>
                            <c:when test="${lowStockCount == 1}">
                                <div class="alert alert-error" style="flex:1;min-width:200px">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                         width="24px" fill="#991b1b">
                                        <path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/>
                                    </svg>
                                        ${lowStockCount} item de stock abaixo do mínimo —
                                    <c:forEach var="stock" items="${lowStockItems}" varStatus="status">
                                        ${stock.productType}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:when test="${lowStockCount > 1}">
                                <div class="alert alert-error" style="flex:1;min-width:200px">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                         width="24px" fill="#991b1b">
                                        <path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/>
                                    </svg>
                                        ${lowStockCount} itens de stock abaixo do mínimo —
                                    <c:forEach var="stock" items="${lowStockItems}" varStatus="status">
                                        ${stock.productType}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:if>

                </div>
            </c:if>

            <%-- BLOCO DE PEDIDOS DOS VOLUNTÁRIOS --%>
            <c:if test="${not empty pendingRequests}">
                <div class="alert alert-warning"
                     style="border: 2px solid #f97316; background: #fff7ed; margin-bottom: 1.5rem;">
                    <h4 style="color: #c2410c; font-size: 1rem; font-weight: 700; margin-bottom: 0.5rem;">
                        🔔 Pedidos de Reposição Pendentes:
                    </h4>
                    <c:forEach var="req" items="${pendingRequests}">
                        <div style="display:flex; justify-content:space-between; align-items:center; padding: 0.5rem 0; border-bottom: 1px solid #fed7aa;">
                            <span><strong>${req.productType}</strong>: ${req.stockNote}</span>
                            <form action="/admin/update-stock" method="POST" style="margin:0">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="id" value="${req.id}"/>
                                <input type="hidden" name="productType" value="${req.productType}"/>
                                <input type="hidden" name="currentQuantity" value="${req.currentQuantity}"/>
                                <input type="hidden" name="lowQuantity" value="${req.lowQuantity}"/>
                                <input type="hidden" name="measureUnit" value="${req.measureUnit}"/>
                                <input type="hidden" name="tag" value="${req.tag}"/>
                                <input type="hidden" name="stockNote" value=""/> <%-- LIMPA A NOTA --%>
                                <button type="submit" class="btn btn-sm btn-dark">Visto</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <div>
                <h3>
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#1f1f1f">
                        <path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/>
                    </svg>
                    Filtrar Produtos
                </h3>
            </div>

            <form method="GET" action="/admin/manage-stock"
                  style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Nome do Produto
                    </label>
                    <input type="text" name="productTypeFilter" id="productTypeFilter" class="form-control"
                           placeholder="Nome do produto"
                           value="${param.productTypeFilter}">
                </div>

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Categoria
                    </label>
                    <select name="tagFilter" id="tagFilter" class="form-control">
                        <option value="">Selecione a categoria do produto</option>
                        <c:forEach var="tag" items="${tags}">
                            <option value="${tag}">
                                    ${tag}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href="/admin/manage-stock" class="btn btn-secondary">Limpar</a>

            </form>

            <div style="gap:1rem; margin-bottom:1.5rem;">
                <div class="card">

                    <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                        <strong>
                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px"
                                 fill="black">
                                <path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/>
                            </svg>
                            Produtos Recolhidos
                        </strong>
                        <button class="btn btn-dark" onclick="openModal()">
                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px"
                                 fill="white">
                                <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/>
                            </svg>
                            Adicionar Produto
                        </button>
                    </div>

                    <div class="card-body">
                        <div class="mini-card">
                            <c:forEach var="product" items="${stockList}">

                                <div class="stock-card
                            ${product.lowStock ? 'low-stock' : ''}">

                                    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:.5rem;">
                                        <div>
                                            <h2>
                                                    ${product.productType}
                                            </h2>
                                        </div>

                                        <div style="display:flex; align-items:center; gap:.5rem;">
                                            <c:if test="${product.lowStock}">
                                            <span style="color:#dc2626;">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                     viewBox="0 -960 960 960" width="24px" fill="#991b1b"><path
                                                        d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                            </span>
                                            </c:if>

                                            <button class="btn btn-sm btn-outline-danger"
                                                    onclick="openDeleteStockModal(${product.id})">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                     viewBox="0 -960 960 960" width="24px" fill="#1f1f1f">
                                                    <path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/>
                                                </svg>
                                            </button>
                                        </div>

                                    </div>
                                    <div style="margin-bottom:.5rem;">
                                    <span class="badge
                                    ${product.tag == 'Alimentação' ? 'badge-orange' :
                                        (product.tag == 'Higiene' ? 'badge-green' :
                                        (product.tag == 'Medicação' ? 'badge-red' :
                                        (product.tag == 'Limpeza' ? 'badge-blue' :
                                        (product.tag == 'Conforto' ? 'badge-yellow' :
                                        (product.tag == 'Brinquedos' ? 'badge-purple' : 'badge-gray')))))}">

                                            ${product.tag}
                                    </span>
                                    </div>

                                    <div style="font-size:0.9rem; margin-bottom:.25rem;">
                                        Quantidade Atual:
                                        <strong>${product.currentQuantity}</strong> ${product.measureUnit}
                                    </div>
                                    <div style="font-size:0.75rem; color:#6b7280; margin-bottom:.75rem;">
                                        Valor Mínimo: ${product.lowQuantity} ${product.measureUnit}
                                    </div>
                                    <hr>
                                    <div style="display:flex; gap:.5rem; margin-bottom:.75rem;">
                                        <button class="btn btn-sm btn-outline-primary"
                                                onclick="useStockModal(this)"
                                                data-id="${product.id}"
                                                data-productType="${product.productType}"
                                                data-measureUnit="${product.measureUnit}">>
                                            Registar Uso
                                        </button>

                                        <button class="btn btn-sm btn-outline-secondary"
                                                onclick="editStockModal(this)"
                                                data-id="${product.id}"
                                                data-productType="${product.productType}"
                                                data-currentQuantity="${product.currentQuantity}"
                                                data-lowQuantity="${product.lowQuantity}"
                                                data-measureUnit="${product.measureUnit}"
                                                data-tag="${product.tag}">
                                            Atualizar Stock
                                        </button>
                                    </div>
                                    <c:choose>
                                        <c:when test="${product.updatedAt == null}">
                                            <div class="text-xs">
                                                Sem atualizações.
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-xs">
                                                Atualizado: ${product.formattedUpdatedAt}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>

                            <c:if test="${empty stockList}">
                                <div class="text-gray text-sm">Sem produtos em stock.</div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<div id="createStockModal" class="modal-overlay">

    <div class="modal-content" style="height: fit-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Adicionar Produto</h4>
            <button class="modal-close" onclick="closeModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#1f1f1f">
                    <path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/>
                </svg>
            </button>
        </div>

        <form action="/admin/create-stock" method="POST"
              style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <h3 class="mb-4">Detalhes do Produto</h3>
            <hr>

            <div class="row">
                <div class="col">
                    <label>Tipo de Produto</label>
                    <input type="text" name="productType" id="productType" class="form-control"
                           placeholder="Ex: Ração (Gato Adulto)" required>
                </div>

                <div class="col">
                    <label>
                        Categoria
                    </label>
                    <select name="tag" id="tag" class="form-control" required>
                        <option value="">Selecione a categoria do produto</option>
                        <option value="Alimentação">Alimentação</option>
                        <option value="Higiene">Higiene</option>
                        <option value="Medicação">Medicação</option>
                        <option value="Limpeza">Limpeza</option>
                        <option value="Conforto">Conforto</option>
                        <option value="Brinquedos">Brinquedos</option>
                        <option value="Outros">Outros</option>
                    </select>
                </div>

                <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                    <div class="col">
                        <label>Quantidade Atual</label>
                        <input type="number" name="currentQuantity" id="currentQuantity" class="form-control"
                               placeholder="Total em stock" required/>
                    </div>
                    <div class="col">
                        <label>Unidade de Medida</label>
                        <input type="text" name="measureUnit" id="measureUnit" class="form-control"
                               placeholder="Ex: Kg, litros, sacos" required/>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Quantidade Mínima</label>
                    <input type="number" name="lowQuantity" id="lowQuantity" class="form-control"
                           placeholder="Ex: 5 (Kg)" required/>
                    <span class="text-gray text-xs">*Quantidade a partir da qual é considerado stock baixo.</span>
                </div>

                <div class="d-flex justify-content-end gap-2 mt-4">
                    <button type="button" class="btn btn-secondary" style="background-color:#9ca3af"
                            onclick="closeModal()">
                        Cancelar
                    </button>

                    <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                        Adicionar
                    </button>
                </div>
            </div>
        </form>

    </div>
</div>

<div id="editStockModal" class="modal-overlay">

    <div class="modal-content" style="height: fit-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Alterar Produto</h4>
            <button class="modal-close" onclick="closeEditStockModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#1f1f1f">
                    <path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/>
                </svg>
            </button>
        </div>

        <form action="/admin/update-stock" method="POST"
              style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="editStockId"/>
            <h3 class="mb-4">Detalhes do Produto</h3>
            <hr>

            <div class="row">
                <div class="col">
                    <label>Tipo de Produto</label>
                    <input type="text" name="productType" id="editProductType" class="form-control"
                           placeholder="Ex: Ração (Gato Adulto)" required>
                </div>

                <div class="col">
                    <label>
                        Categoria
                    </label>
                    <select name="tag" id="editTag" class="form-control" required>
                        <option value="">Selecione a categoria do produto</option>
                        <option value="Alimentação">Alimentação</option>
                        <option value="Higiene">Higiene</option>
                        <option value="Medicação">Medicação</option>
                        <option value="Limpeza">Limpeza</option>
                        <option value="Conforto">Conforto</option>
                        <option value="Brinquedos">Brinquedos</option>
                        <option value="Outros">Outros</option>
                    </select>
                </div>
            </div>

            <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                <div class="col">
                    <label>Quantidade Atual</label>
                    <input type="number" name="currentQuantity" id="editCurrentQuantity" class="form-control"
                           placeholder="Total em stock" required/>
                </div>
                <div class="col">
                    <label>Unidade de Medida</label>
                    <input type="text" name="measureUnit" id="editMeasureUnit" class="form-control"
                           placeholder="Ex: Kg, litros, sacos" required/>
                </div>
            </div>

            <div class="mb-3">
                <label>Quantidade Mínima</label>
                <input type="number" name="lowQuantity" id="editLowQuantity" class="form-control"
                       placeholder="Ex: 5 (Kg)" required/>
                <span class="text-gray text-xs">*Quantidade a partir da qual é considerado stock baixo.</span>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Atualizar
                </button>
            </div>
        </form>

    </div>
</div>

<div id="useStockModal" class="modal-overlay">
    <div class="modal-content" style="height: fit-content">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Registar Uso</h4>
            <button class="modal-close" onclick="closeUseStockModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#1f1f1f">
                    <path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/>
                </svg>
            </button>
        </div>

        <form action="/admin/use-stock" method="POST"
              style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">


            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="useStockId"/>
            <h3 class="mb-4">Detalhes do Uso</h3>
            <hr>

            <p id="useStockLabel"></p>

            <div class="mb-3">
                <label>Quantidade Utilizada</label>
                <input type="number" name="value" id="value" class="form-control" placeholder="Ex: 5 (Kg)" required/>
            </div>

            <button type="submit" class="btn btn-primary">Confirmar Uso</button>
        </form>

    </div>
</div>

<div id="deleteStockModal" class="modal-overlay">
    <div class="modal-content" style="max-width:400px; max-height: fit-content">

        <h5 class="mb-3">Eliminar Produto</h5>

        <p class="text-muted">
            Tens a certeza que queres eliminar este produto?
        </p>

        <form action="/admin/delete-stock" method="POST" id="deleteStockForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="stockId" id="deleteStockId"/>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" onclick="closeDeleteStockModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-danger">
                    Eliminar
                </button>
            </div>
        </form>

    </div>
</div>

<script>
    function openModal() {
        document.getElementById("createStockModal").classList.add("open");
    }

    function closeModal() {
        document.getElementById("createStockModal").classList.remove("open");
        const form = document.querySelector("#createStockModal form");
        form.reset();
        form.action = "/admin/create-stock";
        document.getElementById("stockId").value = "";
    }

    function openUseStockModal() {
        document.getElementById("useStockModal").classList.add("open");
    }

    function closeUseStockModal() {
        document.getElementById("useStockModal").classList.remove("open");
        const form = document.querySelector("#useStockModal form");
        form.reset();
        form.action = "/admin/use-stock";
        document.getElementById("useStockId").value = "";
    }

    function openEditStockModal() {
        document.getElementById("editStockModal").classList.add("open");
    }

    function closeEditStockModal() {
        document.getElementById("editStockModal").classList.remove("open");
        const form = document.querySelector("#editStockModal form");
        form.reset();
        form.action = "/admin/update-stock";
        document.getElementById("editStockId").value = "";
    }

    function editStockModal(button) {
        const id = button.getAttribute("data-id");
        const productType = button.getAttribute("data-productType");
        const currentQuantity = button.getAttribute("data-currentQuantity");
        const lowQuantity = button.getAttribute("data-lowQuantity");
        const measureUnit = button.getAttribute("data-measureUnit");
        const tag = button.getAttribute("data-tag");

        //openEditStockModal();

        document.getElementById("editStockId").value = id;
        document.getElementById("editProductType").value = productType;
        document.getElementById("editCurrentQuantity").value = currentQuantity;
        document.getElementById("editLowQuantity").value = lowQuantity;
        document.getElementById("editMeasureUnit").value = measureUnit;
        document.getElementById("editTag").value = tag;

        document.getElementById("editStockModal").classList.add("open");
    }

    function useStockModal(button) {
        const id = button.getAttribute("data-id");
        const productType = button.getAttribute("data-productType");
        const measureUnit = button.getAttribute("data-measureUnit");

        document.getElementById("useStockId").value = id;
        document.getElementById("useStockLabel").innerText =
            productType + " (" + measureUnit + ")";

        document.getElementById("useStockModal").classList.add("open");
    }

    function openDeleteStockModal(id) {
        document.getElementById("deleteStockId").value = id;
        document.getElementById("deleteStockModal").classList.add("open");
    }

    function closeDeleteStockModal() {
        document.getElementById("deleteStockModal").classList.remove("open");
        document.getElementById("deleteStockId").value = "";
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>