<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gerir Candidaturas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="manage-application" />
    <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>


<main class="admin-main">

    <div style="padding:1.5rem">
        <div class="mb-8">
            <h1 style="margin-bottom:.25rem">
                <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
                Gestão de Candidaturas
            </h1>
            <p>Gestão de candidaturas a adoção</p>
        </div>

        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <c:if test="${pendingAdoptions > 0}">
            <div style="display:flex;gap:1rem;flex-wrap:wrap">

                <c:if test="${pendingAdoptions > 0}">
                    <c:choose>
                        <c:when test="${pendingAdoptions == 1}">
                            <div class="alert alert-warning" style="flex:1;min-width:200px">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="currentColor"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                    ${pendingAdoptions} candidatura por ver
                            </div>
                        </c:when>
                        <c:when test="${pendingAdoptions > 1}">
                            <div class="alert alert-warning" style="flex:1;min-width:200px">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#991b1b"><path d="m40-120 440-760 440 760H40Zm138-80h604L480-720 178-200Zm330.5-51.5Q520-263 520-280t-11.5-28.5Q497-320 480-320t-28.5 11.5Q440-297 440-280t11.5 28.5Q463-240 480-240t28.5-11.5ZM440-360h80v-200h-80v200Zm40-100Z"/></svg>
                                    ${pendingAdoptions} candidaturas por ver
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>

            </div>
        </c:if>

        <div>
            <h3>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                Filtrar Candidaturas
            </h3>
        </div>

        <form method="GET" action="/admin/manage-application" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

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
                    Estado da Candidatura
                </label>
                <select name="statusFilter" id="statusFilter" class="form-control">
                    <option value="">Todas as candidaturas</option>
                    <option value="Pendente">Pendente</option>
                    <option value="Aprovada">Aceite</option>
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
            <a href="/admin/manage-application" class="btn btn-secondary">Limpar</a>

        </form>

        <div style="gap:1rem; margin-bottom:1.5rem;">
            <div class="card">

                <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                    <strong>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="black"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
                        Candidaturas
                    </strong>
                </div>

                <div class="card-body">
                    <c:forEach var="app" items="${adoptionApps}">
                        <div class="shift-card ${!app.read ? 'info-announcement' : ''}">

                        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:.35rem">
                            <div style="display:flex; flex-direction:column; gap:0.35rem;">

                                <div style="font-size:1rem; display:flex; align-items:center; gap:0.5rem; flex-wrap:wrap;">
                                        <strong>${app.applicantName}</strong>

                                        <span class="badge
                                                ${app.status == 'Pendente' ? 'badge-yellow' :
                                                  (app.status == 'Aprovada' ? 'badge-green' :
                                                  (app.status == 'Rejeitada' ? 'badge-red' : 'badge-gray'))}">
                                                ${app.status}
                                        </span>

                                        <span class="badge
                                        ${!app.read ? 'badge-blue' : 'badge-gray'}">
                                                ${!app.read ? 'Nova' : 'Lida'}
                                        </span>
                                </div>

                                <div style="font-size:0.9rem">
                                    Gato a adotar: ${app.cat.name}
                                </div>

                                <div class="text-sm text-gray">
                                    Submetido a ${app.formattedRequestDate}
                                </div>

                                <c:if test="${app.reviewDate != null}">
                                    <div class="text-sm text-gray">
                                        Avaliado a ${app.formattedReviewDate}
                                    </div>
                                </c:if>
                            </div>

                            <div style="display:flex; gap:.5rem;">
                                <button class="btn btn-sm btn-outline-secondary"
                                        onclick="openViewModal(${app.id})">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M280-280h280v-80H280v80Zm0-160h400v-80H280v80Zm0-160h400v-80H280v80Zm-80 480q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h560v-560H200v560Zm0-560v560-560Z"/></svg>
                                    Ver Candidatura
                                </button>

                                <button class="btn btn-sm btn-outline-success"
                                        onclick="openApproveModal(${app.id}, ${app.read})">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M702-480 560-622l57-56 85 85 170-170 56 57-226 226Zm-455-47q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-300Zm0-340Z"/></svg>
                                    Aceitar Candidatura
                                </button>
                                <button class="btn btn-sm btn-outline-danger"
                                        onclick="openRejectModal(${app.id}, ${app.read})">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m696-440-56-56 83-84-83-83 56-57 84 84 83-84 57 57-84 83 84 84-57 56-83-83-84 83Zm-449-87q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-640Zm0 400Z"/></svg>
                                    Rejeitar Candidatura
                                </button>
                            </div>

                        </div>

                        </div>
                    </c:forEach>


                    <c:if test="${empty adoptionApps}">
                        <div class="text-gray text-sm">Sem candidaturas.</div>
                    </c:if>
                </div>

            </div>
        </div>

    </div>
</main>
</div>

<div id="viewModal" class="modal-overlay">
    <div class="modal-content">

        <div class="d-flex justify-content-between align-items-center mb-3">
                <h4>Candidatura — ${applicantName}</h4>
                <button onclick="closeViewModal()">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
                </button>
        </div>

        <div style="display:flex; flex-direction:column; gap:1rem; font-size:0.9rem;">


            <div class="mb-4">
                <h5 style="font-weight:600;">Informação Básica</h5>
                <hr>
            </div>

            <div style="display:flex; gap:1rem;">
                <div style="flex:1">
                    <p>
                        <strong>Nome: </strong>
                        <span id="viewApplicantName"></span></p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Gato: </strong>
                        <span id="viewCat"> </span>
                    </p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Data: </strong>
                        <span id="viewRequestDate"></span>
                    </p>
                </div>
            </div>

            <div style="display:flex; gap:1rem;">
                <div style="flex:1">
                    <p>
                        <strong>Morada: </strong><br/>
                        <span id="viewAddress"> </span>
                    </p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Email: </strong><br/>
                        <span id="viewEmail"> </span>
                    </p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Telefone: </strong><br/>
                        <span id="viewPhone"> </span>
                    </p>
                </div>
            </div>

            <div class="mb-4">
                <h5 style="font-weight:600;">Motivação e Experiência</h5>
                <hr>
            </div>

            <div>
                <p>
                    <strong>Motivação: </strong>
                    <span id="viewReason" style="margin-top: 0.25rem"> </span>
                </p>
            </div>

            <div>
                <p>
                    <strong>Experiência</strong>
                    <span id="viewExperience" style="margin-top:0.25rem;"></span>
                </p>
            </div>

        </div>

        <div style="display:flex; justify-content:flex-end; gap:.5rem; margin-top:1rem;">
            <button class="btn btn-danger" onclick="rejectApplicationFromModal()">Rejeitar</button>
            <button class="btn btn-success" onclick="acceptApplicationFromModal()">Aceitar</button>
        </div>

    </div>
</div>

<div id="approveModal" class="modal-overlay">

    <div class="modal-content" style="max-width:400px;">

        <h5>Confirmar Aprovação</h5>

        <p class="text-muted">
            Tens a certeza que queres aprovar esta candidatura?
        </p>

        <form id="approveForm" method="POST">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" onclick="closeApproveModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-success">
                    Aprovar
                </button>
            </div>

        </form>

    </div>

</div>

<div id="rejectModal" class="modal-overlay">
    <div class="modal-content" style="max-width:500px;">

        <h5>Rejeitar Candidatura</h5>

        <p class="text-muted">
            Indica o motivo da rejeição:
        </p>

        <form id="rejectForm" method="POST">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <textarea name="reason" class="form-control" rows="4"
                      placeholder="Ex: Não reúne condições..." required></textarea>

            <div style="display:flex; justify-content:flex-end; gap:.5rem; margin-top:1rem;">
                <button type="button" class="btn btn-secondary" onclick="closeRejectModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-danger">
                    Confirmar Rejeição
                </button>
            </div>

        </form>
    </div>
</div>

<div id="warningModal" class="modal-overlay">
    <div class="modal-content" style="max-width:400px; max-height: fit-content">

        <h5 class="mb-3">Atenção</h5>

        <p class="text-muted">
            Esta candidatura ainda não foi analisada. Tem a certeza que quer proceder?
        </p>

        <div style="display:flex; justify-content:flex-end; gap:.5rem;">
            <button class="btn btn-secondary" onclick="closeWarningModal()">Cancelar</button>
            <button class="btn btn-danger" onclick="confirmAction()">Continuar</button>
        </div>

    </div>
</div>

<script>
    function openViewModal(id) {
        fetch('/admin/application/mark-as-read/' + id, {
            method: 'POST'
        });
        document.getElementById("viewModal").classList.add("open");
    }

    function closeViewModal() {
        document.getElementById("viewModal").classList.remove("open");
    }

    function openApproveModal(id, isRead) {
        if (!isRead) {
            openWarningModal(id, 'approve');
            return;
        }
        const form = document.getElementById("approveForm");
        form.action = "/admin/adoptions/" + id + "/approve";
        document.getElementById("approveModal").classList.add("open");
    }

    function closeApproveModal() {
        document.getElementById("approveModal").classList.remove("open");
    }

    function openRejectModal(id, isRead) {
        if (!isRead) {
            openWarningModal(id, 'reject');
            return;
        }
        const form = document.getElementById("rejectForm");
        form.action = "/admin/adoptions/" + id + "/reject";
        document.getElementById("rejectModal").classList.add("open");
    }

    function closeRejectModal() {
        document.getElementById("rejectModal").classList.remove("open");
    }

    let actionId = null;
    let actionType = null;

    function openWarningModal(id, type) {
        actionId = id;
        actionType = type;
        document.getElementById("warningModal").classList.add("open");
    }

    function closeWarningModal() {
        document.getElementById("warningModal").classList.remove("open");
    }

    function confirmAction() {
        if (actionType === 'accept') {
            openApproveModal(actionId, true);
        } else if (actionType === 'reject') {
            openRejectModal(actionId, true);
        }
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>