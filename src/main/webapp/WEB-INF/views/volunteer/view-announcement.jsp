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