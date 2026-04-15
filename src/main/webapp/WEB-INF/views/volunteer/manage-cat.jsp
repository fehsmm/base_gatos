<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Gatos | MEG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="manage-cat" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="/WEB-INF/views/fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">

            <div class="page-title" style="font-size:2rem; font-weight:bold; margin-bottom:0.25rem;">
                Gatos
            </div>
            <div class="page-subtitle" style="margin-bottom:1.5rem;">
                Lista de todos os gatos do abrigo.
            </div>

            <form method="GET" action="/volunteer/manage-cat"
                  style="display:flex; gap:0.75rem; margin-bottom:1.5rem; max-width:500px;">
                <input type="text" name="nameFilter" value="${param.nameFilter}"
                       class="form-control" placeholder="Pesquisar por nome">
                <select name="statusFilter" class="form-control">
                    <option value="">Todos os estados</option>
                    <option value="Disponível" ${param.statusFilter == 'Disponível' ? 'selected' : ''}>Disponível</option>
                    <option value="Em Processo" ${param.statusFilter == 'Em Processo' ? 'selected' : ''}>Em Processo</option>
                    <option value="Adotado" ${param.statusFilter == 'Adotado' ? 'selected' : ''}>Adotado</option>
                </select>
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href="/volunteer/manage-cat" class="btn btn-secondary">Limpar</a>
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
                                <div style="display:flex; align-items:center; gap:1rem;
                                            padding:0.75rem 1rem; border-bottom:1px solid #f3f4f6;">
                                    <c:choose>
                                        <c:when test="${not empty cat.image}">
                                            <img src="${cat.image}" alt="${cat.name}"
                                                 style="width:40px; height:40px; border-radius:50%; object-fit:cover;"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="width:40px; height:40px; border-radius:50%;
                                                        background:#e5e7eb; display:flex; align-items:center;
                                                        justify-content:center; font-size:1.2rem;"><img src="/icons/cat.svg" width="20px" height="20px"/></div>
                                        </c:otherwise>
                                    </c:choose>

                                    <div style="flex:1;">
                                        <div style="font-weight:600;">${cat.name}</div>
                                        <div style="font-size:0.85rem; color:#9ca3af;">
                                                ${cat.estimatedAge} • ${cat.gender ? 'Macho' : 'Fêmea'} • ${cat.breed}
                                        </div>
                                    </div>

                                    <span class="badge
                                        ${cat.status == 'Disponível' ? 'badge-green' :
                                        (cat.status == 'Em Processo' ? 'badge-yellow' : 'badge-gray')}">
                                            ${cat.status}
                                    </span>

                                    <a href="/public/cat-profile/${cat.id}"
                                       class="btn btn-sm btn-outline-primary">
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