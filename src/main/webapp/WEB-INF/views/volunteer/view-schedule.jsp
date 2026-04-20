<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>As Minhas Escalas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout" style="display: flex; width: 100%;">

    <c:set var="activePage" value="view-schedule"/>
    <c:set var="dashboardUrl" value="/volunteer/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page" style="width: 100%; overflow-x: hidden;">
        <div class="container-fluid px-2">
            <div class="mb-4">
                <div class="page-title"
                     style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">
                    As Minhas Escalas
                </div>
                <div class="info-line" style="margin-bottom: 1.5rem;">
                    ${user.name} &nbsp;•&nbsp; ${upcomingCount} turnos próximos
                </div>

                <div class="section-title">Próximos Turnos</div>
                <c:choose>
                    <c:when test="${empty upcomingShifts}">
                        <div class="panel text-center" style="margin-bottom:1.5rem;">
                            Não tem turnos agendados proximamente.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive" style="border: 1px solid #e5e7eb; border-radius: 8px;">
                            <table class="table table-hover"
                                   style="background:white; font-size:0.85rem; width:100%; min-width: 600px;">
                                <thead style="background:#1f2937; color:white;">
                                <tr style="text-align:center;">
                                    <th style="padding:12px;">Data / Dia</th>
                                    <th style="padding:12px;">Voluntários</th>
                                    <th style="padding:12px;">Horário</th>
                                    <th style="padding:12px;">Tarefas</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="shift" items="${upcomingShifts}">
                                    <tr style="color:#1f2937; vertical-align: middle;">

                                        <td style="padding:10px; text-align:center; min-width:110px;">
                                            <div style="font-weight:700; font-size:0.9rem;">${shift.date}</div>
                                            <div style="font-size:0.75rem; color:#6b7280;">
                                                <c:set var="dow" value="${shift.date.dayOfWeek}"/>
                                                <c:choose>
                                                    <c:when test="${dow == 'MONDAY'}">Segunda-feira</c:when>
                                                    <c:when test="${dow == 'TUESDAY'}">Terça-feira</c:when>
                                                    <c:when test="${dow == 'WEDNESDAY'}">Quarta-feira</c:when>
                                                    <c:when test="${dow == 'THURSDAY'}">Quinta-feira</c:when>
                                                    <c:when test="${dow == 'FRIDAY'}">Sexta-feira</c:when>
                                                    <c:when test="${dow == 'SATURDAY'}">Sábado</c:when>
                                                    <c:when test="${dow == 'SUNDAY'}">Domingo</c:when>
                                                </c:choose>
                                            </div>
                                        </td>

                                        <td style="padding:10px; font-size:0.85rem;">
                                            <c:forEach var="vol" items="${shift.volunteers}" varStatus="s">
                                                <div style="white-space: nowrap;">${vol.name}</div>
                                            </c:forEach>
                                        </td>

                                        <td style="padding:10px; text-align:center; white-space:nowrap; font-size:0.85rem; font-weight:600;">
                                                ${shift.startTime} <br> ${shift.endTime}
                                        </td>

                                        <td style="padding:10px; font-size:0.85rem;">
                                            <c:choose>
                                                <c:when test="${empty shift.tasks}">
                                                    <span style="color:#9ca3af;">—</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="task" items="${shift.tasks}" varStatus="s">
                                                        ${task.title}<c:if test="${!s.last}">, </c:if>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>

                <c:if test="${not empty pastShifts}">
                    <div class="section-title">Turnos Anteriores</div>
                    <div class="table-responsive" style="border: 1px solid #e5e7eb; border-radius: 8px;">
                        <table class="table table-hover"
                               style="background:white; font-size:0.85rem; width:100%; min-width: 600px;">
                            <thead style="background:#1f2937; color:white;">
                            <tr style="text-align:center;">
                                <th style="padding:12px;">Data / Dia</th>
                                <th style="padding:12px;">Voluntários</th>
                                <th style="padding:12px;">Horário</th>
                                <th style="padding:12px;">Tarefas</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="shift" items="${upcomingShifts}">
                                <tr style="color:#1f2937; vertical-align: middle;">

                                    <td style="padding:10px; text-align:center; min-width:110px;">
                                        <div style="font-weight:700; font-size:0.9rem;">${shift.date}</div>
                                        <div style="font-size:0.75rem; color:#6b7280;">
                                            <c:set var="dow" value="${shift.date.dayOfWeek}"/>
                                            <c:choose>
                                                <c:when test="${dow == 'MONDAY'}">Segunda-feira</c:when>
                                                <c:when test="${dow == 'TUESDAY'}">Terça-feira</c:when>
                                                <c:when test="${dow == 'WEDNESDAY'}">Quarta-feira</c:when>
                                                <c:when test="${dow == 'THURSDAY'}">Quinta-feira</c:when>
                                                <c:when test="${dow == 'FRIDAY'}">Sexta-feira</c:when>
                                                <c:when test="${dow == 'SATURDAY'}">Sábado</c:when>
                                                <c:when test="${dow == 'SUNDAY'}">Domingo</c:when>
                                            </c:choose>
                                        </div>
                                    </td>

                                    <td style="padding:10px; font-size:0.85rem;">
                                        <c:forEach var="vol" items="${shift.volunteers}" varStatus="s">
                                            <div style="white-space: nowrap;">${vol.name}</div>
                                        </c:forEach>
                                    </td>

                                    <td style="padding:10px; text-align:center; white-space:nowrap; font-size:0.85rem; font-weight:600;">
                                            ${shift.startTime} <br> ${shift.endTime}
                                    </td>

                                    <td style="padding:10px; font-size:0.85rem;">
                                        <c:choose>
                                            <c:when test="${empty shift.tasks}">
                                                <span style="color:#9ca3af;">—</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="task" items="${shift.tasks}" varStatus="s">
                                                    ${task.title}<c:if test="${!s.last}">, </c:if>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>

            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
