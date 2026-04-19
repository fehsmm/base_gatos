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
<div class="admin-layout">

    <c:set var="activePage" value="view-schedule" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
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
                        <div style="overflow-x:auto; margin-bottom:2rem;">
                            <table class="table table-bordered" style="background:white; font-size:0.9rem;">
                                <thead>
                                <tr style="background:#1f2937; color:white; text-align:center;">
                                    <th>Data</th>
                                    <th>Dia da Semana</th>
                                    <th>Voluntários</th>
                                    <th>Horário</th>
                                    <th>Tarefas</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="shift" items="${upcomingShifts}">
                                    <tr>
                                        <td style="text-align:center; white-space:nowrap;">
                                                ${shift.date}
                                        </td>
                                        <td style="text-align:center;">

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
                                        </td>
                                        <td>
                                            <c:forEach var="vol" items="${shift.volunteers}" varStatus="s">
                                                ${vol.name}<c:if test="${!s.last}"> / </c:if>
                                            </c:forEach>
                                        </td>
                                        <td style="text-align:center; white-space:nowrap;">
                                                ${shift.startTime} - ${shift.endTime}
                                        </td>
                                        <td>
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
                    <div style="overflow-x:auto;">
                        <table class="table table-bordered" style="background:white; font-size:0.9rem;">
                            <thead>
                            <tr style="background:#374151; color:white; text-align:center;">
                                <th>Data</th>
                                <th>Dia da Semana</th>
                                <th>Voluntários</th>
                                <th>Horário</th>
                                <th>Tarefas</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="shift" items="${pastShifts}">
                                <tr style="color:#9ca3af;">
                                    <td style="text-align:center; white-space:nowrap;">
                                            ${shift.date}
                                    </td>
                                    <td style="text-align:center;">
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
                                    </td>
                                    <td>
                                        <c:forEach var="vol" items="${shift.volunteers}" varStatus="s">
                                            ${vol.name}<c:if test="${!s.last}"> / </c:if>
                                        </c:forEach>
                                    </td>
                                    <td style="text-align:center; white-space:nowrap;">
                                            ${shift.startTime} - ${shift.endTime}
                                    </td>
                                    <td>
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
