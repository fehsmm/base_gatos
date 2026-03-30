<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>As Minhas Escalas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <aside class="sidebar">
        <div class="sidebar-header">
            <a href="/volunteer/" class="logo" style="color:white">
                <div class="logo-icon">
                    <img src="/images/logo.svg"
                         alt="Logo MEG"
                         style="width:48px;height:48px;border-radius:50%;object-fit:cover;">
                </div>
                <div>
                    <div style="font-weight:600">MEG</div>
                    <div style="font-size:.7rem;color:#9ca3af">Voluntário</div>
                </div>
            </a>
            <div style="margin-top:1rem;padding-top:1rem;border-top:1px solid #1f2937;font-size:.8rem;color:#9ca3af"></div>
        </div>

        <nav class="sidebar-nav">
            <a href="/volunteer/">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h320v-560H200v560Zm400 0h160v-240H600v240Zm0-320h160v-240H600v240Z"/>
                </svg>
                Página Inicial</a>
            <a href="/volunteer/manage-cat">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                Gatos</a>
            <a href="/volunteer/leave-shift-note">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v268q-19-9-39-15.5t-41-9.5v-243H200v560h242q3 22 9.5 42t15.5 38H200Zm0-120v40-560 243-3 280Zm80-40h163q3-21 9.5-41t14.5-39H280v80Zm0-160h244q32-30 71.5-50t84.5-27v-3H280v80Zm0-160h400v-80H280v80ZM720-40q-83 0-141.5-58.5T520-240q0-83 58.5-141.5T720-440q83 0 141.5 58.5T920-240q0 83-58.5 141.5T720-40Zm-20-80h40v-100h100v-40H740v-100h-40v100H600v40h100v100Z"/>
                </svg>
                Notas do Turno</a>
            <a href="/volunteer/request-stock">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/>
                </svg>
                Pedido de Stock</a>
            <a href="/volunteer/view-announcement">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M720-440v-80h160v80H720Zm48 280-128-96 48-64 128 96-48 64Zm-80-480-48-64 128-96 48 64-128 96ZM200-200v-160h-40q-33 0-56.5-23.5T80-440v-80q0-33 23.5-56.5T160-600h160l200-120v480L320-360h-40v160h-80Zm240-182v-196l-98 58H160v80h182l98 58Zm120 36v-268q27 24 43.5 58.5T620-480q0 41-16.5 75.5T560-346ZM300-480Z"/>
                </svg>
                Comunicados</a>
            <a href="/volunteer/view-schedule" class="active">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="white">
                    <path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/>
                </svg>
                Escalas</a>
            <a href="/volunteer/view-shift">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M655-200 513-342l56-56 85 85 170-170 56 57-225 226Zm0-320L513-662l56-56 85 85 170-170 56 57-225 226ZM80-280v-80h360v80H80Zm0-320v-80h360v80H80Z"/>
                </svg>
                Tarefas</a>
        </nav>

        <div class="sidebar-footer">
            <a href="/public/home" class="sidebar-link">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#adb5bd">
                    <path d="M838-65 720-183v89h-80v-226h226v80h-90l118 118-56 57ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 20-2 40t-6 40h-82q5-20 7.5-40t2.5-40q0-20-2.5-40t-7.5-40H654q3 20 4.5 40t1.5 40q0 20-1.5 40t-4.5 40h-80q3-20 4.5-40t1.5-40q0-20-1.5-40t-4.5-40H386q-3 20-4.5 40t-1.5 40q0 20 1.5 40t4.5 40h134v80H404q12 43 31 82.5t45 75.5q20 0 40-2.5t40-4.5v82q-20 2-40 4.5T480-80ZM170-400h136q-3-20-4.5-40t-1.5-40q0-20 1.5-40t4.5-40H170q-5 20-7.5 40t-2.5 40q0 20 2.5 40t7.5 40Zm34-240h118q9-37 22.5-72.5T376-782q-55 18-99 54.5T204-640Zm172 462q-18-34-31.5-69.5T322-320H204q29 51 73 87.5t99 54.5Zm28-462h152q-12-43-31-82.5T480-798q-26 36-45 75.5T404-640Zm234 0h118q-29-51-73-87.5T584-782q18 34 31.5 69.5T638-640Z"/>
                </svg>
                Site Público</a>
            <form action="/logout" method="POST" class="sidebar-form">
                <button type="submit" class="sidebar-link">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#adb5bd">
                        <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/>
                    </svg>
                    Terminar Sessão
                </button>
            </form>
        </div>
    </aside>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title"
                     style="font-size: 2rem; text-align: left; margin-bottom: 0.25rem; font-weight: bold;">
                    As Minhas Escalas
                </div>
                <div class="info-line">${user.username} &nbsp;•&nbsp; ${user.role}</div>

                <%-- Cards de estatísticas --%>
                <div class="stats-row">
                    <div class="stat-card">
                        <div class="stat-number orange">${upcomingCount}</div>
                        <div>Turnos Próximos</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number green">${pastShifts.size()}</div>
                        <div>Turnos Completos</div>
                    </div>
                </div>

                <%-- Próximos Turnos --%>
                <c:choose>
                    <c:when test="${empty upcomingShifts}">
                        <div class="panel text-center">
                            Não tem turnos agendados proximamente.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="section-title">Próximos Turnos</div>
                        <c:forEach var="shift" items="${upcomingShifts}">
                            <div class="shift-card">
                                <div class="shift-header">
                                    <div>
                                        <div class="shift-date">
                                                ${shift.date}
                                        </div>
                                        <div class="shift-time">
                                                ${shift.startTime} - ${shift.endTime}
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${not empty shift.tasks}">
                                    <div class="task-list">
                                        <c:forEach var="task" items="${shift.tasks}">
                                            <div class="task-item">
                                                <input type="checkbox" disabled>
                                                <div>
                                                    <div class="task-title">${task.description}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <%-- Turnos Anteriores --%>
                <c:if test="${not empty pastShifts}">
                    <div class="section-title">Turnos Anteriores</div>
                    <c:forEach var="shift" items="${pastShifts}">
                        <div class="shift-card">
                            <div class="shift-header">
                                <div>
                                    <div class="shift-date">
                                            ${shift.date}
                                    </div>
                                    <div class="shift-time">
                                            ${shift.startTime} - ${shift.endTime}
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty shift.tasks}">
                                <div class="task-list">
                                    <c:forEach var="task" items="${shift.tasks}">
                                        <div class="task-item">
                                            <input type="checkbox" disabled>
                                            <div>
                                                <div class="task-title">${task.description}</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>

                <div class="alert-panel">
                    <strong>Informação Importante</strong>
                    <ul class="simple-list" style="margin-top:10px;">
                        <li>Se não puder comparecer a um turno, avise com antecedência</li>
                        <li>Em caso de emergência, contacte: +351 912 345 678</li>
                        <li>Consulte o manual do voluntário na área comum do abrigo</li>
                    </ul>
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
