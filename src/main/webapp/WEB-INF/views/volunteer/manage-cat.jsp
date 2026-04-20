<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gatos | MEG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout" style="display: flex; width: 100%;">

    <c:set var="activePage" value="manage-cat"/>
    <c:set var="dashboardUrl" value="/volunteer/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page" style="width: 100%; overflow-x: hidden;">
        <div class="container-fluid px-3 py-3" style="width: 100%; max-width: 100%;">

            <div class="page-title" style="font-size:2rem; font-weight:bold; margin-bottom:0.25rem;">
                Gatos
            </div>
            <div class="page-subtitle" style="margin-bottom:1.5rem;">
                Lista de todos os gatos do abrigo.
            </div>

            <form method="GET" action="/volunteer/manage-cat"
                  style="display:flex; flex-wrap:wrap; gap:0.75rem; margin-bottom:1.5rem; width:100%;">
                <input type="text" name="nameFilter" value="${param.nameFilter}"
                       class="form-control" placeholder="Pesquisar por nome" style="flex: 1; min-width: 150px;">

                <select name="statusFilter" class="form-control" style="flex: 1; min-width: 150px;">
                    <option value="">Todos os estados</option>
                    <option value="Disponível" ${param.statusFilter == 'Disponível' ? 'selected' : ''}>Disponível
                    </option>
                    <option value="Em Processo" ${param.statusFilter == 'Em Processo' ? 'selected' : ''}>Em Processo
                    </option>
                    <option value="Adotado" ${param.statusFilter == 'Adotado' ? 'selected' : ''}>Adotado</option>
                </select>

                <div style="display:flex; gap:0.5rem; width:100%; justify-content: flex-end;">
                    <button type="submit" class="btn btn-primary" style="flex:1;">Filtrar</button>
                    <a href="/volunteer/manage-cat" class="btn btn-secondary"
                       style="flex:1; text-align:center;">Limpar</a>
                </div>
            </form>

            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty cats}">
                            <div style="color:#9ca3af; text-align:center; padding:1rem;">
                                Nenhum gato encontrado.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="cat" items="${cats}">
                                <div style="display:flex; align-items:center; gap:1rem; padding:1rem; border-bottom:1px solid #f3f4f6; width:100%;">

                                    <img src="/image/${cat.image}"
                                         style="width:60px; height:60px; border-radius:50%; object-fit:cover; flex-shrink:0;"/>

                                    <div style="flex:1;">
                                        <div style="font-weight:700; font-size:1.1rem; color:#111827;">${cat.name}</div>
                                        <div style="font-size:0.85rem; color:#6b7280; margin-bottom: 4px;">
                                                ${cat.estimatedAge} • ${cat.gender ? 'Macho' : 'Fêmea'} • ${cat.breed}
                                        </div>
                                        <span class="badge ${cat.status == 'Disponível' ? 'badge-green' : (cat.status == 'Em Processo' ? 'badge-yellow' : 'badge-gray')}">
                                                ${cat.status}
                                        </span>
                                    </div>

                                    <a href="/public/cat-profile/${cat.id}"
                                       class="btn btn-sm btn-outline-primary" style="white-space:nowrap;">
                                        Ver Perfil
                                    </a>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>