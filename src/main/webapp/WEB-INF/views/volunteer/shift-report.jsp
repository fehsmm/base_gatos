<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turno Atual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="shift-report"/>
    <c:set var="dashboardUrl" value="/volunteer/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title"
                     style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">
                    Relatórios de Turno
                </div>
                <div class="page-subtitle" style="margin-bottom: 1.5rem;">
                    Histórico dos teus turnos concluídos.
                </div>

                <form method="GET" action="/volunteer/shift-report"
                      style="display:flex; gap:0.75rem; margin-bottom:1.5rem; max-width:400px;">
                    <input type="text" name="search" value="${search}"
                           class="form-control"
                           placeholder="Pesquisar por data (ex: 2026-03)">
                    <button type="submit" class="btn btn-primary">Pesquisar</button>
                    <c:if test="${not empty search}">
                        <a href="/volunteer/shift-report" class="btn btn-secondary">Limpar</a>
                    </c:if>
                </form>

                <div class="section-title" style="margin-bottom:1rem;">
                    <c:choose>
                        <c:when test="${not empty search}">Resultados para "${search}"</c:when>
                        <c:otherwise>Este mês</c:otherwise>
                    </c:choose>
                </div>

                <c:choose>
                    <c:when test="${empty shifts}">
                        <div class="panel text-center" style="color:#9ca3af;">
                            <c:choose>
                                <c:when test="${not empty search}">Nenhum turno encontrado para "${search}".</c:when>
                                <c:otherwise>Não há turnos concluídos este mês.</c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="shift" items="${shifts}">
                            <div class="panel" style="margin-bottom:0.75rem; cursor:pointer;"
                                 onclick="toggleReport('report-${shift.id}')">
                                <div style="display:flex; justify-content:space-between; align-items:center;">
                                    <div>
                                        <div style="font-weight:600;"><img src="/icons/clockcalendar.svg" width="20px"
                                                                           height="20px"/> ${shift.date}</div>
                                        <div style="color:#9ca3af; font-size:0.85rem;">
                                            <img src="/icons/clock.svg" width="20px" height="20px"/> ${shift.startTime}
                                            — ${shift.endTime} &nbsp;•&nbsp;
                                            <c:forEach var="vol" items="${shift.volunteers}" varStatus="s">
                                                ${vol.name}<c:if test="${!s.last}">, </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div style="display:flex; align-items:center; gap:0.75rem;">
                                    <span style="background:#f3f4f6; color:#6b7280; padding:0.25rem 0.75rem;
                                         border-radius:999px; font-size:0.8rem; font-weight:600;">
                                        Concluído
                                    </span>
                                        <span id="arrow-${shift.id}" style="color:#9ca3af; font-size:1rem;">▼</span>
                                    </div>
                                </div>

                                <div id="report-${shift.id}"
                                     style="display:none; margin-top:1rem; border-top:1px solid #e5e7eb; padding-top:1rem;">
                                    <c:forEach items="${shift.notes}" var="note">
                                        <div class="shift-card"
                                             style="border-left: 5px solid ${note.priority == 'urgent' ? '#dc2626' : (note.priority == 'high' ? '#f97316' : '#9ca3af')}; margin-bottom: 1rem; padding: 1rem;">
                                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem;">
                                                <div style="display: flex; align-items: center; gap: 0.5rem;">
                                                    <img src="/icons/Person.svg" width="18px" height="18px"/>
                                                    <strong style="font-size: 1rem; color: #1f2937;">${note.author.name}</strong>
                                                </div>
                                                <span class="badge ${note.priority == 'urgent' ? 'badge-red' : (note.priority == 'high' ? 'badge-orange' : 'badge-gray')}">
                                                        ${note.priority == 'urgent' ? 'Urgente' : (note.priority == 'high' ? 'Alta' : 'Normal')}
                                                </span>
                                            </div>
                                            <div style="background: #fef2f2; border-radius: 8px; padding: 0.75rem; border: 1px solid #fee2e2; margin-bottom: 0.75rem;">
                                                <div style="display: flex; align-items: center; gap: 0.5rem; color: #991b1b; font-size: 0.8rem; font-weight: 700; text-transform: uppercase; margin-bottom: 0.25rem;">
                                                    <img src="/icons/warning.svg" width="14px" height="14px"/>
                                                    Observações Críticas
                                                </div>
                                                <div style="color: #111827; font-weight: 500; font-size: 0.95rem;">
                                                        ${note.importantObservations}
                                                </div>
                                            </div>
                                            <div style="padding-left: 0.5rem;">
                                                <div style="font-size: 0.75rem; color: #6b7280; font-weight: 600; text-transform: uppercase;">
                                                    Resumo do Turno:
                                                </div>
                                                <div style="color: #4b5563; font-size: 0.9rem; line-height: 1.4;">
                                                        ${note.summary}
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <script>
        function toggleReport(id) {
            const div = document.getElementById(id);
            const shiftId = id.replace('report-', '');
            const arrow = document.getElementById('arrow-' + shiftId);
            if (div.style.display === 'none') {
                div.style.display = 'block';
                arrow.textContent = '▲';
            } else {
                div.style.display = 'none';
                arrow.textContent = '▼';
            }
        }
    </script>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>