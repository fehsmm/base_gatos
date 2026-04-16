<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Medicações — ${cat.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="cat-medications" />
    <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

        <main class="admin-main">
        <div style="padding:1.5rem">

            <div style="display:flex; align-items:center; gap:1rem; margin-bottom:1.5rem;">
                <div>
                    <h1>
                        <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M345-120q-94 0-159.5-65.5T120-345q0-45 17-86t49-73l270-270q32-32 73-49t86-17q94 0 159.5 65.5T840-615q0 45-17 86t-49 73L504-186q-32 32-73 49t-86 17Zm266-286 107-106q20-20 31-47t11-56q0-60-42.5-102.5T615-760q-29 0-56 11t-47 31L406-611l205 205ZM345-200q29 0 56-11t47-31l106-107-205-205-107 106q-20 20-31 47t-11 56q0 60 42.5 102.5T345-200Z"/></svg>                        Medicações — ${cat.name}
                    </h1>
                    <p>Gerir medicações ativas e histórico clínico</p>
                </div>

                <div style="margin-left:auto; display:flex; flex-direction:column; gap:0.5rem; align-items: flex-end;">
                    <a href="/admin/manage-cat" class="btn btn-secondary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="white"><path d="m313-440 224 224-57 56-320-320 320-320 57 56-224 224h487v80H313Z"/></svg>
                        Voltar</a>
                </div>
            </div>

                <c:if test="${success != null}">
                    <div class="alert alert-success">${success}</div>
                </c:if>

            <div style="gap:1rem; margin-bottom:1.5rem;">
            <div class="card">
                <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                    <strong>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="black"><path d="M345-120q-94 0-159.5-65.5T120-345q0-45 17-86t49-73l270-270q32-32 73-49t86-17q94 0 159.5 65.5T840-615q0 45-17 86t-49 73L504-186q-32 32-73 49t-86 17Zm266-286 107-106q20-20 31-47t11-56q0-60-42.5-102.5T615-760q-29 0-56 11t-47 31L406-611l205 205ZM345-200q29 0 56-11t47-31l106-107-205-205-107 106q-20 20-31 47t-11 56q0 60 42.5 102.5T345-200Z"/></svg>
                        Medicações Registadas
                    </strong>
                    <button class="btn btn-dark ms-auto" onclick="openModal()">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="white"><path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/></svg>
                        Nova Medicação
                    </button>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty medications}">
                            <div style="color:#9ca3af; text-align:center; padding:1rem;">
                                Nenhuma medicação registada para ${cat.name}.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="med" items="${medications}">
                                <div class="shift-card ${med.activeToday ? 'error-announcement' : ''}">
                                    <div style="display:flex; justify-content:space-between; align-items:flex-start;">
                                        <div>

                                            <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">
                                                    ${med.medicationName}
                                                <c:choose>
                                                    <c:when test="${med.activeToday}">
                                                        <span class="badge badge-red">Ativa hoje</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-gray">Inativa</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <div style="font-size:0.9rem; margin-bottom:0.25rem;">
                                                Dose: <strong>${med.dose}</strong>
                                            </div>

                                            <c:if test="${not empty med.storageLocation}">
                                                <div style="font-size:0.85rem; color:#6b7280; margin-bottom:0.25rem;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="currentColor">
                                                        <path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/>
                                                    </svg> ${med.storageLocation}
                                                </div>
                                            </c:if>

                                            <div style="font-size:0.85rem; color:#9ca3af;">
                                                    ${med.formattedStartDate} → ${med.formattedEndDate}
                                            </div>

                                            <c:if test="${not empty med.notes}">
                                                    <div style="font-size:0.85rem; color:#ff911c; margin-top:0.5rem;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="orange"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                                        ${med.notes}
                                                </div>
                                            </c:if>

                                            <div style="font-size:0.8rem; color:#9ca3af; margin-top:0.5rem;">
                                                Registado por ${med.createdBy}
                                            </div>
                                        </div>

                                        <div style="width:100px; text-align:right; display:flex; justify-content:flex-end; gap:.5rem;">

                                            <div class="d-flex gap-2">
                                                <button class="btn btn-sm btn-outline-primary"
                                                        onclick="editMedicationModal(this)"
                                                        data-id="${med.id}"
                                                        data-medicationName="${med.medicationName}"
                                                        data-dose="${med.dose}"
                                                        data-storageLocation="${med.storageLocation}"
                                                        data-startDate="${med.startDate}"
                                                        data-endDate="${med.endDate}"
                                                        data-notes="${med.notes}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/></svg>
                                                </button>

                                                <button class="btn btn-sm btn-outline-danger"
                                                        onclick="openDeleteModal(${med.id})">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg>
                                                </button>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </div>

        </div>
    </main>
</div>

<div id="addMedicationModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Adicionar Medicação — ${cat.name}</h4>
            <button class="modal-close" onclick="closeModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/medication/create-medication" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="catId" value="${cat.id}"/>

            <div class="mb-4">
                <h5 style="font-weight:600;">Informação da Medicação</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="mb-3">
                <label class="form-label">Nome do medicamento</label>
                <input type="text" name="medicationName" id ="medicationName" class="form-control"
                       placeholder="Ex: Lepicortinol" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Dose</label>
                <input type="text" name="dose" id="dose" class="form-control"
                       placeholder="Ex: 5mg — 3/4 comprimido" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Localização no abrigo</label>
                <input type="text" name="storageLocation" id="storageLocation" class="form-control"
                       placeholder="Ex: Gaveta da Andreia">
            </div>

            <div style="display:flex; gap:1rem;">
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de início</label>
                    <input type="date" name="startDate" id="startDate" class="form-control" required>
                </div>
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de fim</label>
                    <input type="date" name="endDate" id="endDate" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Observações para o voluntário</label>
                <input type="text" name="notes" id="notes" class="form-control" rows="3"
                          placeholder="Ex: Dar sempre com comida. Confirmar que engoliu.">
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Adicionar Medicação
                </button>
            </div>
        </form>
    </div>
</div>

<div id="editMedicationModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Atualizar Medicação — ${cat.name}</h4>
            <button class="modal-close" onclick="closeEditModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/medication/update-medication" method="POST" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="catId" value="${cat.id}"/>
            <input type="hidden" name="id" id="editMedicationId"/>

            <div class="mb-4">
                <h5 style="font-weight:600;">Informação da Medicação</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="mb-3">
                <label class="form-label">Nome do medicamento</label>
                <input type="text" name="medicationName" id ="editMedicationName" class="form-control"
                       placeholder="Ex: Lepicortinol" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Dose</label>
                <input type="text" name="dose" id="editDose" class="form-control"
                       placeholder="Ex: 5mg — 3/4 comprimido" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Localização no abrigo</label>
                <input type="text" name="storageLocation" id="editStorageLocation" class="form-control"
                       placeholder="Ex: Gaveta da Andreia">
            </div>

            <div style="display:flex; gap:1rem;">
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de início</label>
                    <input type="date" name="startDate" id="editStartDate" class="form-control" required>
                </div>
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de fim</label>
                    <input type="date" name="endDate" id="editEndDate" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Observações para o voluntário</label>
                <input type="text" name="notes" id="editNotes" class="form-control" rows="3"
                       placeholder="Ex: Dar sempre com comida. Confirmar que engoliu.">
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeEditModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Atualizar Medicação
                </button>
            </div>
        </form>
    </div>
</div>

<div id="deleteModal" class="modal-overlay">

    <div class="modal-content" style="max-width:400px; max-height: fit-content">

        <h5 class="mb-3">Eliminar Medicação</h5>

        <p class="text-muted">
            Tens a certeza que queres eliminar esta medicação?
        </p>

        <form id="deleteForm" method="POST" action="/admin/medication/delete-medication">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="medicationId" id="deleteMedicationId"/>

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
        document.getElementById("addMedicationModal").classList.add("open");
    }

    function closeModal() {
        document.getElementById("addMedicationModal").classList.remove("open");
        const form = document.querySelector("#addMedicationModal form");
        form.reset();
    }

    function openEditModal() {
        document.getElementById("editMedicationModal").classList.add("open");
    }

    function closeEditModal() {
        document.getElementById("editMedicationModal").classList.remove("open");
        const form = document.querySelector("#editMedicationModal form");
        form.reset();
        form.action = "/admin/medication/update-medication";
        document.getElementById("editMedicationId").value = "";
    }

    function editMedicationModal(button) {
        const id = button.getAttribute("data-id");
        const medicationName = button.getAttribute("data-medicationName");
        const dose = button.getAttribute("data-dose");
        const storageLocation = button.getAttribute("data-storageLocation");
        const startDate = button.getAttribute("data-startDate");
        const endDate = button.getAttribute("data-endDate");
        const notes = button.getAttribute("data-notes");

        openEditModal();

        document.getElementById("editMedicationId").value = id;
        document.getElementById("editMedicationName").value = medicationName;
        document.getElementById("editDose").value = dose;
        document.getElementById("editStorageLocation").value = storageLocation;
        document.getElementById("editStartDate").value = startDate;
        document.getElementById("editEndDate").value = endDate;
        document.getElementById("editNotes").value = notes;
    }

    function openDeleteModal(id) {
        document.getElementById("deleteMedicationId").value = id;
        document.getElementById("deleteModal").classList.add("open");
    }

    function closeDeleteModal() {
        document.getElementById("deleteModal").classList.remove("open");
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>