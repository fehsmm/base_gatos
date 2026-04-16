<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Gerir Escalas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>

<body>

<div class="admin-layout">

    <c:set var="activePage" value="manage-schedule"/>
    <c:set var="dashboardUrl" value="/admin/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="admin-main">

        <div style="padding:1.5rem">
            <div class="mb-8">
                <h1 style="margin-bottom:.25rem">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px"
                         fill="black">
                        <path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/>
                    </svg>
                    Gestão de Escalas
                </h1>
                <p>Organização dos turnos e tarefas dos voluntários</p>

            </div>

            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>

        </div>

        <div class="mb-4" style="margin: 0 1.5rem; margin-bottom: 1.5rem; position: relative;">
            <h4 class="mb-1">
                Escalas dos próximos dias.
            </h4>
            <p class="text-muted">
                ${shiftCount} turnos agendados.
            </p>

            <button class="btn btn-dark position-absolute top-0 end-0" onclick="openModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="white">
                    <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/>
                </svg>
                Criar Turno
            </button>
        </div>

        <c:if test="${empty shiftsByDay}">
            <div class="card" style="margin: 0 1.5rem; margin-bottom: 1.5rem;">
                <div class="card-body text-center text-muted p-5">
                    Nenhum turno agendado ainda.
                </div>
            </div>
        </c:if>

        <c:forEach var="entry" items="${shiftsByDay}">
            <div class="card mb-4" style="margin: 25px;">

                <div class="card-header fw-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#1f1f1f">
                        <path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/>
                    </svg>
                    <c:choose>
                        <c:when test="${entry.key == todayFormatted}">
                            Hoje - ${entry.key}
                        </c:when>

                        <c:when test="${entry.key == tomorrowFormatted}">
                            Amanhã - ${entry.key}
                        </c:when>

                        <c:otherwise>
                            ${entry.key}
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="card-body">

                    <c:forEach var="shift" items="${entry.value}">

                        <div class="shift-card">

                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>

                                    <strong>
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                             width="24px" fill="#1f1f1f">
                                            <path d="M582-298 440-440v-200h80v167l118 118-56 57ZM440-720v-80h80v80h-80Zm280 280v-80h80v80h-80ZM440-160v-80h80v80h-80ZM160-440v-80h80v80h-80ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                        </svg>
                                            ${shift.startTime} - ${shift.endTime}</strong>

                                    <span class="ms-3 text-muted">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                             width="24px" fill="#1f1f1f"><path
                                                d="M367-527q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q560-607 560-640t-23.5-56.5Q513-720 480-720t-56.5 23.5Q400-673 400-640t23.5 56.5Q447-560 480-560t56.5-23.5ZM480-640Zm0 400Z"/></svg>
                                        <c:forEach var="vol" items="${shift.volunteers}" varStatus="status">
                                            ${vol.name}<c:if test="${!status.last}">, </c:if>
                                        </c:forEach>
                                    </span>
                                </div>

                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-outline-primary"
                                            onclick="editShift(this)"
                                            data-id="${shift.id}"
                                            data-date="${shift.date}"
                                            data-start="${shift.startTime}"
                                            data-end="${shift.endTime}"
                                            data-volunteers="<c:forEach var='v' items='${shift.volunteers}' varStatus='s'>${v.id}<c:if test='${!s.last}'>,</c:if></c:forEach>"
                                            data-tasks="<c:forEach var='t' items='${shift.tasks}' varStatus='s'>${t.title}|${t.description}<c:if test='${!s.last}'>;</c:if></c:forEach>">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                             width="24px" fill="#1f1f1f">
                                            <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/>
                                        </svg>
                                    </button>

                                    <button class="btn btn-sm btn-outline-danger"
                                            onclick="openDeleteModal(${shift.id})">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                             width="24px" fill="#1f1f1f">
                                            <path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/>
                                        </svg>
                                    </button>

                                </div>
                            </div>

                            <span class="badge bg-light text-dark border mb-3">
                                ${completedTasks[shift.id]}/${totalTasks[shift.id]} tarefas concluídas
                            </span>

                            <div>
                                <p class="fw-semibold mb-2">Tarefas:</p>

                                <c:forEach var="task" items="${shift.tasks}">
                                    <div class="d-flex gap-2 mb-2">

                                    <span>
                                        <c:choose>
                                            <c:when test="${task.completed}">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="20px"
                                                     viewBox="0 -960 960 960" width="20px" fill="#16a34a"><path
                                                        d="M382-240 154-468l57-57 171 171 367-367 57 57-424 424Z"/></svg>
                                            </c:when>
                                            <c:otherwise>
                                                <svg xmlns="http://www.w3.org/2000/svg" height="20px"
                                                     viewBox="0 -960 960 960" width="20px" fill="#adb5bd"><path
                                                        d="M480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>

                                        <div>
                                            <strong>${task.title}</strong>

                                            <c:if test="${not empty task.description}">
                                                <small class="text-muted"> ${task.description}</small>
                                            </c:if>


                                        </div>

                                    </div>
                                </c:forEach>
                                <c:if test="${empty shift.tasks}">
                                    <div class="text-muted text-center p-3">
                                        Sem tarefas para este turno.
                                    </div>
                                </c:if>


                                //Aparecer as medicações do Dia
                                <p class="fw-semibold mb-2">
                                    <img src="/icons/pill.svg" width="20px" height="20px"/>
                                    Medicações de hoje:
                                </p>
                                <c:forEach var="catEntry" items="${medsByCat}">
                                    <div style="margin-bottom:0.5rem;">
                                        <strong>${catEntry.key}</strong>
                                        <c:forEach var="med" items="${catEntry.value}">
                                            <div class="d-flex gap-2 mb-1 align-items-center"
                                                 style="padding-left:1rem;">
                                                <span>
                                                    <c:choose>
                                                        <c:when test="${med.administeredToday}">
                                                            <img src="/icons/checkmark.svg" width="20px" height="20px"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/icons/alarm-clock.svg" width="20px"
                                                                 height="20px"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <div>
                                                        ${med.medicationName}
                                                    <small class="text-muted"> ${med.dose}</small>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty entry.value}">
                        <div class="text-muted text-center p-3">
                            Sem turnos para este dia.
                        </div>
                    </c:if>

                </div>
            </div>
        </c:forEach>
    </main>

</div>

<div id="addShiftModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Criar Novo Turno</h4>
            <button class="modal-close" onclick="closeModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#1f1f1f">
                    <path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/>
                </svg>
            </button>
        </div>

        <form action="/admin/create-shift" method="POST"
              style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <h3 class="mb-4">Detalhes do Turno</h3>
            <hr>

            <div class="mb-3">
                <label>Data</label>
                <input type="date" name="date" id="date" class="form-control" required>
            </div>

            <div class="row">
                <div class="col">
                    <label>Hora de Início</label>
                    <input type="time" name="startTime" id="startTime" class="form-control" required/>
                </div>
                <div class="col">
                    <label>Hora de Fim</label>
                    <input type="time" name="endTime" id="endTime" class="form-control" required/>
                </div>
            </div>

            <div class="mt-3">
                <label>
                    Voluntários
                    <select name="volunteerIds" class="form-control" multiple required>
                        <c:forEach var="user" items="${volunteers}">
                            <option value="${user.id}">
                                    ${user.name}
                            </option>
                        </c:forEach>
                    </select>
                </label>
            </div>

            <div class="mt-4">
                <h5>Tarefas</h5>
                <hr>

                <div id="tasksList" class="mb-3"></div>

                <label>
                    Título da Tarefa
                    <input type="text" name="title" id="taskTitle" class="form-control mb-2"
                           placeholder="Ex: Alimentar os gatos">
                </label>

                <label>
                    Descrição da Tarefa (opcional)
                    <input type="text" name="description" id="taskDesc" class="form-control mb-2"
                           placeholder="Ex: Gato Mike deve receber ração de sénior.">
                </label>

                <button type="button" class="btn btn-outline w-full mb-4" style="background-color:#e5e7eb"
                        onclick="addTask()">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#1f1f1f">
                        <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/>
                    </svg>
                    Adicionar Tarefa
                </button>

                <div id="taskHiddenInputs"></div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Criar Turno
                </button>
            </div>

        </form>
    </div>

</div>

<div id="editShiftModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Alterar Detalhes do Turno</h4>
            <button class="modal-close" onclick="closeEditModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                     fill="#1f1f1f">
                    <path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/>
                </svg>
            </button>
        </div>

        <form action="/admin/update-shift" method="POST"
              style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="editShiftId"/>
            <h3 class="mb-4">Detalhes do Turno</h3>
            <hr>

            <div class="mb-3">
                <label>Data</label>
                <input type="date" name="date" id="editDate" class="form-control" required>
            </div>

            <div class="row">
                <div class="col">
                    <label>Hora de Início</label>
                    <input type="time" name="startTime" id="editStartTime" class="form-control" required/>
                </div>
                <div class="col">
                    <label>Hora de Fim</label>
                    <input type="time" name="endTime" id="editEndTime" class="form-control" required/>
                </div>
            </div>

            <div class="mt-3">
                <label>
                    Voluntários
                    <select name="volunteerIds" class="form-control" id="editVolunteerIds" multiple required>
                        <c:forEach var="user" items="${volunteers}">
                            <option value="${user.id}">
                                    ${user.name}
                            </option>
                        </c:forEach>
                    </select>
                </label>
            </div>

            <div class="mt-4">
                <h5>Tarefas</h5>
                <hr>

                <div id="editTasksList" class="mb-3"></div>

                <label>
                    Título da Tarefa
                    <input type="text" id="editTaskTitle" class="form-control mb-2"
                           placeholder="Ex: Alimentar os gatos">
                </label>

                <label>
                    Descrição da Tarefa (opcional)
                    <input type="text" id="editTaskDesc" class="form-control mb-2"
                           placeholder="Ex: Gato Mike deve receber ração de sénior.">
                </label>

                <button type="button" class="btn btn-outline w-full mb-4" style="background-color:#e5e7eb"
                        onclick="addTaskEdit()">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#1f1f1f">
                        <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/>
                    </svg>
                    Adicionar Tarefa
                </button>

                <div id="editTaskHiddenInputs"></div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af"
                        onclick="closeEditModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Guardar Alterações
                </button>
            </div>

        </form>
    </div>

</div>

<div id="deleteModal" class="modal-overlay">

    <div class="modal-content" style="max-width:400px; max-height: fit-content">

        <h5 class="mb-3">Eliminar Turno</h5>

        <p class="text-muted">
            Tens a certeza que queres eliminar este turno?
        </p>

        <form id="deleteForm" method="POST" action="/admin/delete-shift">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="shiftId" id="deleteShiftId"/>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" onclick="closeDeleteModal()">
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
        document.getElementById("addShiftModal").classList.add("open");
    }

    function closeModal() {
        document.getElementById("addShiftModal").classList.remove("open");
        const form = document.querySelector("#addShiftModal form");
        form.reset();
        form.action = "/admin/create-shift";
        document.getElementById("shiftId").value = "";
    }

    function openEditModal() {
        document.getElementById("editShiftModal").classList.add("open");
    }

    function closeEditModal() {
        document.getElementById("editShiftModal").classList.remove("open");
        const form = document.querySelector("#editShiftModal form");
        form.reset();
        form.action = "/admin/update-shift";
        document.getElementById("editShiftId").value = "";
    }

    function editShift(button) {
        const id = button.getAttribute("data-id");
        const date = button.getAttribute("data-date");
        const start = button.getAttribute("data-start");
        const end = button.getAttribute("data-end");
        const volunteers = button.getAttribute("data-volunteers").split(",").map(id => id.trim());
        const tasksAttr = button.getAttribute("data-tasks");
        const tasksData = tasksAttr ? tasksAttr.split(";") : [];

        document.getElementById("editTasksList").innerHTML = ""; //reset tasks list
        document.getElementById("editTaskHiddenInputs").innerHTML = ""; //reset tasks lists hidden inputs

        openEditModal();

        document.getElementById("editShiftId").value = id;
        document.getElementById("editDate").value = date;
        document.getElementById("editStartTime").value = start;
        document.getElementById("editEndTime").value = end;

        const select = document.getElementById("editVolunteerIds");
        for (let option of select.options) {
            option.selected = volunteers.includes(option.value);
        }
        tasksData.forEach(task => {
            if (!task.trim()) return;
            const parts = task.split("|");
            const title = parts[0]?.trim();
            const description = parts[1]?.trim() || "";
            addTaskToEditModal(title, description);
        });
    }

    function openDeleteModal(id) {
        document.getElementById("deleteShiftId").value = id;
        document.getElementById("deleteModal").classList.add("open");
    }

    function closeDeleteModal() {
        document.getElementById("deleteModal").classList.remove("open");
    }

    let taskIndex = 0;

    function addTask() {
        const titleInput = document.getElementById("taskTitle");
        const descInput = document.getElementById("taskDesc");

        const title = titleInput.value.trim();
        const description = descInput.value.trim();

        if (!title) {
            alert("Título obrigatório");
            return;
        }

        const list = document.getElementById("tasksList");
        const div = document.createElement("div");
        div.className = "border rounded p-2 mb-2 d-flex justify-content-between align-items-center";

        div.innerHTML = `
        <div>
            <strong>\${title}</strong>
            <small>\${description || ''}</small>
        </div>
        <button type="button" onclick="removeTask(this, ${taskIndex})" class="btn btn-sm btn-danger">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
        </button>
    `;

        list.prepend(div);

        const hiddenContainer = document.getElementById("taskHiddenInputs");

        hiddenContainer.insertAdjacentHTML('beforeend', `
        <input type="hidden" name="tasks[\${taskIndex}].title" value="\${title}">
        <input type="hidden" name="tasks[\${taskIndex}].description" value="\${description}">
    `);

        taskIndex++;

        document.getElementById("taskTitle").value = "";
        document.getElementById("taskDesc").value = "";
    }

    function removeTask(button, index) {
        const taskDiv = button.closest("div.border");
        taskDiv.remove();
        const hiddenContainer = document.getElementById("taskHiddenInputs");
        const tasks = document.querySelectorAll("#tasksList > div");

        hiddenContainer.innerHTML = "";
        tasks.forEach((task, index) => {
            const title = task.querySelector("strong").innerText;
            const description = task.querySelector("small")?.innerText || "";

            hiddenContainer.innerHTML += `
            <input type="hidden" name="tasks[\${index}].title" value="\${title}">
            <input type="hidden" name="tasks[\${index}].description" value="\${description}">
        `;
        });
    }

    function addTaskEdit() {
        const titleInput = document.getElementById("editTaskTitle");
        const descInput = document.getElementById("editTaskDesc");
        const title = titleInput.value.trim();
        const description = descInput.value.trim();

        if (!title) {
            alert("Título obrigatório");
            return;
        }

        addTaskToEditModal(title, description);

        titleInput.value = "";
        descInput.value = "";
    }

    function addTaskToEditModal(title, description) {
        const list = document.getElementById("editTasksList");
        const hidden = document.getElementById("editTaskHiddenInputs");
        const index = hidden.children.length;

        const taskDiv = document.createElement("div");
        taskDiv.className = "task-item d-flex justify-content-between align-items-center mb-2 p-2 border rounded";

        taskDiv.innerHTML = `
        <div>
            <strong>\${title}</strong>
            <small class="text-muted"> \${description || ''}</small>
        </div>
        <button type="button" class="btn btn-sm btn-danger" onclick="removeTaskEdit(this)">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
        </button>
    `;

        list.appendChild(taskDiv);

        hidden.innerHTML += `
        <input type="hidden" name="tasks[\${index}].title" value="\${title}">
        <input type="hidden" name="tasks[\${index}].description" value="\${description}">
    `;
    }

    function removeTaskEdit(button) {
        const taskDiv = button.closest(".task-item");
        taskDiv.remove();
        const hiddenContainer = document.getElementById("editTaskHiddenInputs");
        const tasks = document.querySelectorAll("#editTasksList .task-item");

        hiddenContainer.innerHTML = "";
        tasks.forEach((task, index) => {
            const title = task.querySelector("strong").innerText;
            const description = task.querySelector("small")?.innerText.replace(": ", "") || "";

            hiddenContainer.innerHTML += `
            <input type="hidden" name="tasks[\${index}].title" value="\${title}">
            <input type="hidden" name="tasks[\${index}].description" value="\${description}">
        `;
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous">
</script>
</body>
</html>