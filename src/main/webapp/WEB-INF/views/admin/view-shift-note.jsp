<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Base de Gatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="view-shift-note" />
    <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="admin-main">

        <div style="padding:1.5rem">
            <div class="mb-8">
                <h1 style="margin-bottom:.25rem">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M80-80v-720q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H240L80-80Zm126-240h594v-480H160v525l46-45Zm-46 0v-480 480Z"/></svg>
                    Notas de Turno
                </h1>
                <p>Comunicação e observações importantes dos voluntários</p>

            </div>

            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <c:if test="${unreadNotesCount > 0}">
                <div style="padding: 0 1.5rem; margin-top:1.5rem;">
                        <c:choose>
                            <c:when test="${unreadNotesCount == 1}">
                                <div class="alert alert-info" style="flex:1;min-width:200px">
                                    <strong>${unreadNotesCount} nota não lida</strong>
                                </div>
                            </c:when>
                            <c:when test="${unreadNotesCount > 1}">
                                <div class="alert alert-warning" style="flex:1;min-width:200px">
                                    <strong>${unreadNotesCount} notas não lidas</strong>
                                </div>
                            </c:when>
                        </c:choose>
                </div>
            </c:if>

            <div>
                <h3>
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                    Filtrar Notas
                </h3>
            </div>

            <form method="GET" action="/admin/view-shift-note" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Data de Início
                    </label>
                    <input type="date" name="dateStartFilter" id="dateStartFilter" class="form-control" value="${param.dateStartFilter}"/>
                </div>

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Data de Fim
                    </label>
                    <input type="date" name="dateEndFilter" id="dateEndFilter" class="form-control" value="${param.dateEndFilter}"/>
                </div>

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Prioridade
                    </label>
                    <select name="priorityFilter" id="priorityFilter" class="form-control">
                        <option value="">Todas as prioridades</option>
                        <option value="urgent">Urgente</option>
                        <option value="high">Alta</option>
                        <option value="normal">Normal</option>
                        <option value="low">Baixa</option>
                    </select>
                </div>

                <div style="display:flex; align-items:center; height:38px;">
                    <label style="display:flex; align-items:center; gap:.5rem; margin:0; white-space:nowrap; font-size:0.95rem;">
                        <input type="checkbox" name="unreadFilter" id="unreadFilter" value="true"
                        ${param.unreadFilter == 'true' ? 'checked' : ''}>
                        Não lidas
                    </label>
                </div>

                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href="/admin/view-shift-note" class="btn btn-secondary">Limpar</a>
            </form>

            <div style="gap:1rem; margin-bottom:1.5rem;">
                <div class="card">
                    <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                        <strong>
                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="black"><path d="M80-80v-720q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H240L80-80Zm126-240h594v-480H160v525l46-45Zm-46 0v-480 480Z"/></svg>
                            Observações de Turnos
                        </strong>
                    </div>

                    <div class="card-body">
                        <c:forEach var="note" items="${shiftNotes}">
                            <div class="shift-card
                            ${note.priority == 'urgent' ? 'error-announcement' :
                             (note.priority == 'high' ? 'warning-announcement' :
                             (!note.read ? 'info-announcement' : ''))}"
                                 data-note-id="${note.id}">
                                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:.35rem">
                                    <div style="font-weight:500;font-size:.9rem">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/></svg>
                                        ${note.shift.formattedDate}

                                        <c:if test="${!note.read}">
                                            <button class="btn btn-sm btn-outline-primary ms-2"
                                                    onclick="openMarkAsReadModal(${note.id})"
                                                    id="mark-btn-${note.id}">
                                                Marcar como lida
                                            </button>
                                        </c:if>
                                    </div>

                                    <div>
                                        <span class="badge
                                    ${note.priority == 'urgent' ? 'badge-red' :
                                      (note.priority == 'high' ? 'badge-yellow' :
                                      (note.priority == 'normal' ? 'badge-blue' : 'badge-gray'))}">

                                                ${note.priority == 'urgent' ? 'Urgente' :
                                                        (note.priority == 'high' ? 'Alta' :
                                                                (note.priority == 'normal' ? 'Normal' : 'Baixa'))}
                                        </span>

                                        <span id="badge-${note.id}" class="badge
                                        ${!note.read ? 'badge-blue' : 'badge-gray'}">
                                                ${!note.read ? 'Nova' : 'Lida'}
                                        </span>
                                    </div>
                                </div>

                                <div style="font-size:.9rem; margin-bottom:.5rem;">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M582-298 440-440v-200h80v167l118 118-56 57ZM440-720v-80h80v80h-80Zm280 280v-80h80v80h-80ZM440-160v-80h80v80h-80ZM160-440v-80h80v80h-80ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
                                    ${note.shift.startTime} - ${note.shift.endTime}

                                    <span class="ms-3 text-muted">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M367-527q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q560-607 560-640t-23.5-56.5Q513-720 480-720t-56.5 23.5Q400-673 400-640t23.5 56.5Q447-560 480-560t56.5-23.5ZM480-640Zm0 400Z"/></svg>
                                        <c:forEach var="vol" items="${note.shift.volunteers}" varStatus="s">
                                            ${vol.name}<c:if test="${!s.last}">, </c:if>
                                        </c:forEach>
                                    </span>
                                </div>

                                <div style="margin-top:.5rem;">
                                    <strong>Resumo: </strong> ${note.summary}
                                </div>

                                <c:if test="${not empty note.importantObservations}">
                                    <div style="margin-top:.5rem;">
                                        <strong>Observações:</strong> ${note.importantObservations}
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>

                        <c:if test="${empty shiftNotes}">
                            <div class="text-gray text-sm">Ainda sem notas de turno.</div>
                        </c:if>
                    </div>
                </div>
            </div>

        </div>

    </main>

</div>

<div id="markAsReadModal" class="modal-overlay">
    <div class="modal-content" style="max-width:400px; max-height: fit-content">

        <h5 class="mb-3">Confirmar</h5>

        <p class="text-muted">
            Marcar esta nota como lida?
        </p>

        <div style="display:flex; justify-content:flex-end; gap:.5rem;">
            <button class="btn btn-secondary" onclick="closeMarkAsReadModal()">Cancelar</button>
            <button class="btn btn-primary" onclick="confirmMarkAsRead()">Confirmar</button>
        </div>

    </div>
</div>

<script>
    let selectedNoteId = null;

    function openMarkAsReadModal(id) {
        selectedNoteId = id;
        document.getElementById("markAsReadModal").classList.add("open");
    }

    function closeMarkAsReadModal() {
        document.getElementById("markAsReadModal").classList.remove("open");
    }

    function confirmMarkAsRead() {
        fetch('/admin/view-shift-notes/mark-as-read/' + selectedNoteId, {
            method: 'POST'
        })
            .then(() => {
                const btn = document.getElementById("mark-btn-" + selectedNoteId);
                if (btn) btn.remove();

                const badge = document.getElementById("badge-" + selectedNoteId);
                if (badge) {
                    badge.classList.remove("badge-blue");
                    badge.classList.add("badge-gray");
                    badge.innerText = "Lida";
                }

                const card = document.querySelector(`[data-note-id='\${selectedNoteId}']`);
                if (card) {
                    card.classList.remove("info-announcement");
                }

            });

        closeMarkAsReadModal();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>