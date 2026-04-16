<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Comunicados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="post-announcement" />
    <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

<main class="admin-main">

    <div style="padding:1.5rem">
        <div class="mb-8">
            <h1 style="margin-bottom:.25rem">
                <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M720-440v-80h160v80H720Zm48 280-128-96 48-64 128 96-48 64Zm-80-480-48-64 128-96 48 64-128 96ZM200-200v-160h-40q-33 0-56.5-23.5T80-440v-80q0-33 23.5-56.5T160-600h160l200-120v480L320-360h-40v160h-80Zm240-182v-196l-98 58H160v80h182l98 58Zm120 36v-268q27 24 43.5 58.5T620-480q0 41-16.5 75.5T560-346ZM300-480Z"/></svg>
                Comunicados
            </h1>
            <p>Partilha de informação e comunicados administrativos</p>

        </div>

        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <div>
            <h3>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                Filtrar Comunicados
            </h3>
        </div>

        <form method="GET" action="/admin/post-announcement" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

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

            <button type="submit" class="btn btn-primary">Filtrar</button>
            <a href="/admin/post-announcement" class="btn btn-secondary">Limpar</a>

        </form>


        <div style="gap:1rem; margin-bottom:1.5rem;">
            <div class="card">

                <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                    <strong>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="black"><path d="M720-440v-80h160v80H720Zm48 280-128-96 48-64 128 96-48 64Zm-80-480-48-64 128-96 48 64-128 96ZM200-200v-160h-40q-33 0-56.5-23.5T80-440v-80q0-33 23.5-56.5T160-600h160l200-120v480L320-360h-40v160h-80Zm240-182v-196l-98 58H160v80h182l98 58Zm120 36v-268q27 24 43.5 58.5T620-480q0 41-16.5 75.5T560-346ZM300-480Z"/></svg>
                        Comunicados Recentes
                    </strong>
                    <button class="btn btn-dark" onclick="openModal()">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="white">
                            <path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/>
                        </svg>
                        Novo Comunicado
                    </button>
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

                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-outline-primary"
                                            onclick="editAnnouncement(this)"
                                            data-id="${ann.id}"
                                            data-title="${ann.title}"
                                            data-description="${ann.description}"
                                            data-priority="${ann.priority}">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/></svg>
                                    </button>

                                    <button class="btn btn-sm btn-outline-danger"
                                            onclick="openDeleteModal(${ann.id})">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg>
                                    </button>
                                </div>
                            </div>

                            <div class="text-sm text-gray" style="margin-bottom: 10px">
                                    Por ${ann.createdBy} • ${ann.formattedCreatedAt}
                            </div>

                                <div>
                                        ${ann.description}
                                </div>

                            <div>
                            <c:if test="${ann.updatedAt != null}">
                                <div class="text-gray text-xs" style="margin-top: 10px">Atualizado por ${ann.lastUpdatedBy} • ${ann.formattedUpdatedAt}</div>
                            </c:if>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty announcements}">
                        <div class="text-gray text-sm">Sem comunicados.</div>
                    </c:if>
                </div>

            </div>
        </div>
    </div>
</main>
</div>

<div id="createAnnouncementModal" class="modal-overlay">

    <div class="modal-content" style="height: fit-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Criar Novo Comunicado</h4>
            <button class="modal-close" onclick="closeModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/create-announcement" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <h3 class="mb-4">Detalhes do Comunicado</h3>
            <hr>

            <div class="mb-3">
                <label>Título</label>
                <input type="text" name="title" id="title" class="form-control" placeholder="Título do comunicado" required>
            </div>

            <div class="mb-3">
                <label>Nível de Prioridade</label>
                <select name="priority" id="priority" class="form-control" required>
                    <option disabled selected> Selecione o nível de prioridade do comunicado </option>
                    <option value="urgent">Urgente</option>
                    <option value="high">Alta</option>
                    <option value="normal">Normal</option>
                    <option value="low">Baixa</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Descrição</label>
                <input type="text" name="description" id="description" class="form-control" placeholder="Texto do comunicado" required>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Publicar Comunicado
                </button>
            </div>

        </form>
    </div>

</div>

<div id="editAnnouncementModal" class="modal-overlay">

    <div class="modal-content" style="height: fit-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Alterar Detalhes do Comunicado</h4>
            <button class="modal-close" onclick="closeEditModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/update-announcement" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="editAnnouncementId"/>
            <h3 class="mb-4">Detalhes do Comunicado</h3>
            <hr>

            <div class="mb-3">
                <label>Título</label>
                <input type="text" name="title" id="editTitle" class="form-control" placeholder="Título do comunicado" required>
            </div>

            <div class="mb-3">
                <label>Nível de Prioridade</label>
                <select name="priority" id="editPriority" class="form-control" required>
                    <option disabled selected> Selecione o nível de prioridade do comunicado </option>
                    <option value="urgent">Urgente</option>
                    <option value="high">Alta</option>
                    <option value="normal">Normal</option>
                    <option value="low">Baixa</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Descrição</label>
                <input type="text" name="description" id="editDescription" class="form-control" placeholder="Texto do comunicado" required>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeEditModal()">
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

        <h5 class="mb-3">Eliminar Comunicado</h5>

        <p class="text-muted">
            Tens a certeza que queres eliminar este comunicado?
        </p>

        <form id="deleteForm" method="POST" action="/admin/delete-announcement">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="announcementId" id="deleteAnnouncementId"/>

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
        document.getElementById("createAnnouncementModal").classList.add("open");
    }

    function closeModal() {
        document.getElementById("createAnnouncementModal").classList.remove("open");
        const form = document.querySelector("#createAnnouncementModal form");
        form.reset();
        form.action = "/admin/create-announcement";
        document.getElementById("announcementId").value = "";
    }

    function openEditModal() {
        document.getElementById("editAnnouncementModal").classList.add("open");
    }

    function closeEditModal() {
        document.getElementById("editAnnouncementModal").classList.remove("open");
        const form = document.querySelector("#editAnnouncementModal form");
        form.reset();
        form.action = "/admin/update-announcement";
        document.getElementById("editAnnouncementId").value = "";
    }

    function editAnnouncement(button) {
        const id = button.getAttribute("data-id");
        const title = button.getAttribute("data-title");
        const description = button.getAttribute("data-description");
        const priority = button.getAttribute("data-priority");

        openEditModal();

        document.getElementById("editAnnouncementId").value = id;
        document.getElementById("editTitle").value = title;
        document.getElementById("editDescription").value = description;
        document.getElementById("editPriority").value = priority;
    }

    function openDeleteModal(id) {
        document.getElementById("deleteAnnouncementId").value = id;
        document.getElementById("deleteModal").classList.add("open");
    }

    function closeDeleteModal() {
        document.getElementById("deleteModal").classList.remove("open");
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>