<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Comunicados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="view-announcement" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="/WEB-INF/views/fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title"
                     style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">
                    Comunicados
                </div>
                <div class="page-subtitle" style="margin-bottom: 1.5rem;">
                    Informações importantes para os voluntários.
                </div>
                <form method="GET" action="/volunteer/view-announcement"
                      style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

                    <div style="display:flex; flex-direction:column; flex:1">
                        <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">Data de Início</label>
                        <input type="date" name="dateStartFilter" class="form-control"
                               value="${param.dateStartFilter}"/>
                    </div>

                    <div style="display:flex; flex-direction:column; flex:1">
                        <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">Data de Fim</label>
                        <input type="date" name="dateEndFilter" class="form-control" value="${param.dateEndFilter}"/>
                    </div>

                    <div style="display:flex; flex-direction:column; flex:1">
                        <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">Prioridade</label>
                        <select name="priorityFilter" class="form-control">
                            <option value="">Todas as prioridades</option>
                            <option value="urgent" ${param.priorityFilter == 'urgent' ? 'selected' : ''}>Urgente
                            </option>
                            <option value="high" ${param.priorityFilter == 'high' ? 'selected' : ''}>Alta</option>
                            <option value="normal" ${param.priorityFilter == 'normal' ? 'selected' : ''}>Normal</option>
                            <option value="low" ${param.priorityFilter == 'low' ? 'selected' : ''}>Baixa</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Filtrar</button>
                    <a href="/volunteer/view-announcement" class="btn btn-secondary">Limpar</a>
                </form>

                <div style="gap:1rem; margin-bottom:1.5rem;">
                    <div class="card">

                        <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                            <strong>
                                <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960"
                                     width="20px" fill="black">
                                    <path d="M720-440v-80h160v80H720Zm48 280-128-96 48-64 128 96-48 64Zm-80-480-48-64 128-96 48 64-128 96ZM200-200v-160h-40q-33 0-56.5-23.5T80-440v-80q0-33 23.5-56.5T160-600h160l200-120v480L320-360h-40v160h-80Zm240-182v-196l-98 58H160v80h182l98 58Zm120 36v-268q27 24 43.5 58.5T620-480q0 41-16.5 75.5T560-346ZM300-480Z"/>
                                </svg>
                                Comunicados Recentes
                            </strong>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <c:forEach var="ann" items="${announcements}">
                        <div class="shift-card
                             ${ann.priority == 'urgent' ? 'error-announcement' :
                             (ann.priority == 'high' ? 'warning-announcement' : '')}">
                            <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:.35rem">
                                <div style="font-weight:500;font-size:1rem">
                                        ${ann.title}
                                    <span class="badge
                                                ${ann.priority == 'urgent' ? 'badge-red' :
                                                  (ann.priority == 'high' ? 'badge-orange' :
                                                  (ann.priority == 'normal' ? 'badge-blue' : 'badge-gray'))}">

                                            ${ann.priority == 'urgent' ? 'Urgente' :
                                                    (ann.priority == 'high' ? 'Alta' :
                                                            (ann.priority == 'normal' ? 'Normal' : 'Baixa'))}
                                    </span>
                                </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <c:choose>
                    <c:when test="${empty announcements}">
                        <div class="panel text-center">
                            Não há comunicados de momento.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="ann" items="${announcements}">
                            <div class="shift-card ${ann.priority == 'urgent' ? 'error-announcement' : (ann.priority == 'high' ? 'warning-announcement' : '')}"
                                 style="margin-bottom:0.75rem;">
                                <div style="font-weight:500; font-size:1rem; margin-bottom:0.35rem;">${ann.title}
                                    <span class="badge ${ann.priority == 'urgent' ? 'badge-red' : (ann.priority == 'high' ? 'badge-orange' :
                                    (ann.priority == 'normal' ? 'badge-blue' : 'badge-gray'))}"> ${ann.priority == 'urgent' ? 'Urgente' :
                                            (ann.priority == 'high' ? 'Alta' : (ann.priority == 'normal' ? 'Normal' : 'Baixa'))}
                                    </span>
                                </div>

                                <div class="text-sm text-gray" style="margin-bottom:0.5rem;">
                                    Por ${ann.createdBy} • ${ann.formattedCreatedAt}
                                </div>

                                <div>${ann.description}</div>

                                <c:if test="${ann.updatedAt != null}">
                                    <div class="text-gray text-xs" style="margin-top:0.5rem;">
                                        Atualizado por ${ann.lastUpdatedBy} • ${ann.formattedUpdatedAt}
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>