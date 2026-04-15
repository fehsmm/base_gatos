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
    <%@ include file="/WEB-INF/views/fragments/adminSidebar.jsp" %>


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
                        <div class="shift-card ${!app.read ? 'alert-info' : ''}">

                        <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:.35rem">
                            <div>
                                <div style="font-weight:500;font-size:1rem; margin-bottom:0.25rem">
                                        ${app.applicantName}

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

                                   <!--ver se aqui posso tirar o style inline quando testar-->
                                    <div style="font-size:0.9rem; margin-bottom:0.25rem;">
                                        Gato a adotar: <strong>${app.cat.name}</strong>
                                    </div>

                                            <div class="text-sm text-gray" style="margin-bottom: 10px">
                                                Submetido a ${app.formattedRequestDate}
                                            </div>

                                            <c:if test="${app.reviewDate != null}">
                                                <div class="text-sm text-gray" style="margin-bottom: 10px">
                                                    Avaliado a ${app.formattedReviewDate}
                                                </div>
                                            </c:if>
                                </div>
                            </div>

                            <div style="display:flex; gap:.5rem;">
                                <button class="btn btn-sm btn-outline-secondary"
                                        onclick="openViewModal(${app.id})">
                                    Ver Candidatura
                                </button>

                                <button class="btn btn-sm btn-outline-success"
                                        onclick="acceptApplication(${app.id}, ${app.read})">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M702-480 560-622l57-56 85 85 170-170 56 57-226 226Zm-455-47q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-300Zm0-340Z"/></svg>
                                </button>
                                <button class="btn btn-sm btn-outline-danger"
                                        onclick="rejectApplication(${app.id}, ${app.read})">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m696-440-56-56 83-84-83-83 56-57 84 84 83-84 57 57-84 83 84 84-57 56-83-83-84 83Zm-449-87q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-640Zm0 400Z"/></svg>                                </button>
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

    <div class="container">
        <c:forEach items="${adoptionApps}" var="adoption">
                <div class="card shadow-sm border-0 rounded-4 h-100">
                    <div class="card-header">
                        <h2 class="fw-bold mb-0">${adoption.applicantName}</h2>
                    </div>

                    <div class="card-body">
                        <img src="${adoption.cat.image}"
                             class="card-img-top"
                             style="height:200px; object-fit:cover;">
                            <h4 class="fw-bold">${adoption.cat.name}</h4>
                        <div class="row text-center">
                            <div class="col-md-6 mb-3">
                                <p><b>Razão</b></p>
                                <p>${adoption.reason}</p>
                            </div>

                            <div class="col-md-6 mb-3">
                                <p><b>Experiência</b></p>
                                <p>${adoption.experience}</p>
                            </div>

                        </div>

                        <div class="d-flex justify-content-center gap-3 mt-3">

                            <form action="/admin/adoptions/${adoption.id}/approve" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-success px-4">Aprovar</button>
                            </form>

                            <form action="/admin/adoptions/${adoption.id}/reject" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-danger px-4">Rejeitar</button>
                            </form>

                        </div>

                    </div>
                </div>
        </c:forEach>
    </div>
</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>