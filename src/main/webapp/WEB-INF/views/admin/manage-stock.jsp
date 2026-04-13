<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gerir Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <aside class="sidebar">

        <div class="sidebar-header">
            <a href="/admin/" class="logo" style="color:white">
                <div class="logo-icon">
                    <img src="/images/logo.svg"
                         alt="Logo MEG"
                         style="width:48px;height:48px;border-radius:50%;object-fit:cover;">                </div>
                <div>
                    <div style="font-weight:600">
                        MEG
                    </div>
                    <div style="font-size:.7rem;color:#9ca3af">
                        Administrador
                    </div>
                </div>
            </a>
            <div style="margin-top:1rem;padding-top:1rem;border-top:1px solid #1f2937;font-size:.8rem;color:#9ca3af">
            </div>
        </div>

        <nav class="sidebar-nav">
            <a href="/admin/">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h320v-560H200v560Zm400 0h160v-240H600v240Zm0-320h160v-240H600v240Z"/></svg>
                Página Inicial</a>
            <a href="/admin/manage-cat">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                Gatos</a>
            <a href="/admin/manage-schedule">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/></svg>
                Escalas</a>
            <a href="/admin/manage-user">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm720 0v-120q0-44-24.5-84.5T666-434q51 6 96 20.5t84 35.5q36 20 55 44.5t19 53.5v120H760ZM247-527q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47Zm466 0q-47 47-113 47-11 0-28-2.5t-28-5.5q27-32 41.5-71t14.5-81q0-42-14.5-81T544-792q14-5 28-6.5t28-1.5q66 0 113 47t47 113q0 66-47 113ZM120-240h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-240Zm0-400Z"/></svg>
                Utilizadores</a>
            <a href="/admin/manage-stock" class="active">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="white"><path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/></svg>
                Stock</a>
            <a href="/admin/post-announcement">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M720-440v-80h160v80H720Zm48 280-128-96 48-64 128 96-48 64Zm-80-480-48-64 128-96 48 64-128 96ZM200-200v-160h-40q-33 0-56.5-23.5T80-440v-80q0-33 23.5-56.5T160-600h160l200-120v480L320-360h-40v160h-80Zm240-182v-196l-98 58H160v80h182l98 58Zm120 36v-268q27 24 43.5 58.5T620-480q0 41-16.5 75.5T560-346ZM300-480Z"/></svg>
                Comunicados</a>
            <a href="/admin/manage-application">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
                Candidaturas</a>
            <a href="/admin/view-shift-note">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M80-80v-720q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H240L80-80Zm126-240h594v-480H160v525l46-45Zm-46 0v-480 480Z"/></svg>
                Notas de Turno</a>
            <a href="/admin/vet">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M300-840q52 0 99 22t81 62q34-40 81-62t99-22q94 0 157 63t63 157q0 5-.5 10t-.5 10h-80q1-5 1-10v-10q0-60-40-100t-100-40q-47 0-87 26.5T518-666h-76q-15-41-55-67.5T300-760q-60 0-100 40t-40 100v10q0 5 1 10H81q0-5-.5-10t-.5-10q0-94 63-157t157-63Zm-88 480h112q32 31 70 67t86 79q48-43 86-79t70-67h113q-38 42-90 91T538-158l-58 52-58-52q-69-62-120.5-111T212-360Zm230 40q13 0 22.5-7.5T478-347l54-163 35 52q5 8 14 13t19 5h320v-80H623l-69-102q-6-9-15.5-13.5T518-640q-13 0-22.5 7.5T482-613l-54 162-34-51q-5-8-14-13t-19-5H40v80h297l69 102q6 9 15.5 13.5T442-320Zm38-167Z"/></svg>
                Informação Clínica</a>
        </nav>
        <div class="sidebar-footer">
            <a href="/public/home" class="sidebar-link">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M838-65 720-183v89h-80v-226h226v80h-90l118 118-56 57ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 20-2 40t-6 40h-82q5-20 7.5-40t2.5-40q0-20-2.5-40t-7.5-40H654q3 20 4.5 40t1.5 40q0 20-1.5 40t-4.5 40h-80q3-20 4.5-40t1.5-40q0-20-1.5-40t-4.5-40H386q-3 20-4.5 40t-1.5 40q0 20 1.5 40t4.5 40h134v80H404q12 43 31 82.5t45 75.5q20 0 40-2.5t40-4.5v82q-20 2-40 4.5T480-80ZM170-400h136q-3-20-4.5-40t-1.5-40q0-20 1.5-40t4.5-40H170q-5 20-7.5 40t-2.5 40q0 20 2.5 40t7.5 40Zm34-240h118q9-37 22.5-72.5T376-782q-55 18-99 54.5T204-640Zm172 462q-18-34-31.5-69.5T322-320H204q29 51 73 87.5t99 54.5Zm28-462h152q-12-43-31-82.5T480-798q-26 36-45 75.5T404-640Zm234 0h118q-29-51-73-87.5T584-782q18 34 31.5 69.5T638-640Z"/></svg>
                Site Público</a>
            <form action="/logout" method="POST" class="sidebar-form">
                <button type="submit" class="sidebar-link">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg>
                    Terminar Sessão
                </button>
            </form>
        </div>

    </aside>

<main class="admin-main">

    <div style="padding:1.5rem">
        <div class="mb-8">
            <h1 style="margin-bottom:.25rem">
                <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/></svg>
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
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#991b1b"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                    ${lowStockCount} item de stock abaixo do mínimo —
                                <c:forEach var="stock" items="${lowStockItems}" varStatus="status">
                                    ${stock.productType}<c:if test="${!status.last}">, </c:if>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:when test="${lowStockCount > 1}">
                            <div class="alert alert-error" style="flex:1;min-width:200px">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#991b1b"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
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

        <div>
            <h3>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                Filtrar Produtos
            </h3>
        </div>

        <form method="GET" action="/admin/manage-stock" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

            <div style="display:flex; flex-direction:column; flex: 1">
                <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                    Nome do Produto
                </label>
                <input type="text" name="productTypeFilter" id="productTypeFilter" class="form-control" placeholder="Nome do produto"
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
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="black"><path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/></svg>
                        Produtos Recolhidos
                    </strong>
                    <button class="btn btn-dark" onclick="openModal()">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="white">
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
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#991b1b"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                            </span>
                                        </c:if>

                                        <button class="btn btn-sm btn-outline-danger"
                                                onclick="openDeleteStockModal(${product.id})">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg>
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
                                    Quantidade Atual: <strong>${product.currentQuantity}</strong> ${product.measureUnit}
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
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/create-stock" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id"/>
            <h3 class="mb-4">Detalhes do Produto</h3>
            <hr>

            <div class="row">
                <div class="col">
                    <label>Tipo de Produto</label>
                    <input type="text" name="productType" id="productType" class="form-control" placeholder="Ex: Ração (Gato Adulto)" required>
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
                    <input type="number" name="currentQuantity" id="currentQuantity" class="form-control" placeholder="Total em stock" required/>
                </div>
                <div class="col">
                    <label>Unidade de Medida</label>
                    <input type="text" name="measureUnit" id="measureUnit" class="form-control" placeholder="Ex: Kg, litros, sacos" required/>
                </div>
            </div>

            <div class="mb-3">
                <label>Quantidade Mínima</label>
                <input type="number" name="lowQuantity" id="lowQuantity" class="form-control" placeholder="Ex: 5 (Kg)" required/>
                <span class="text-gray text-xs">*Quantidade a partir da qual é considerado stock baixo.</span>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
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
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/update-stock" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="editStockId"/>
            <h3 class="mb-4">Detalhes do Produto</h3>
            <hr>

            <div class="row">
                <div class="col">
                    <label>Tipo de Produto</label>
                    <input type="text" name="productType" id="editProductType" class="form-control" placeholder="Ex: Ração (Gato Adulto)" required>
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
                    <input type="number" name="currentQuantity" id="editCurrentQuantity" class="form-control" placeholder="Total em stock" required/>
                </div>
                <div class="col">
                    <label>Unidade de Medida</label>
                    <input type="text" name="measureUnit" id="editMeasureUnit" class="form-control" placeholder="Ex: Kg, litros, sacos" required/>
                </div>
            </div>

            <div class="mb-3">
                <label>Quantidade Mínima</label>
                <input type="number" name="lowQuantity" id="editLowQuantity" class="form-control" placeholder="Ex: 5 (Kg)" required/>
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
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/use-stock" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">


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
        console.log("abrir modal", id);
        document.getElementById("deleteStockId").value = id;
        document.getElementById("deleteStockModal").classList.add("open");
    }

    function closeDeleteStockModal() {
        document.getElementById("deleteStockModal").classList.remove("open");
        document.getElementById("deleteStockId").value = "";
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>