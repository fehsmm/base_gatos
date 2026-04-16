<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Adoção — ${adoption.cat.name}</title>
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
                        <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#1f1f1f"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>                        Adoção — ${adoption.cat.name}
                    </h1>
                    <p>Informação sobre a adoção e relatórios pós-adoção</p>
                </div>

                <div style="margin-left:auto; display:flex; flex-direction:column; gap:0.5rem; align-items: flex-end;">
                    <a href="/admin/manage-application" class="btn btn-secondary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="white"><path d="m313-440 224 224-57 56-320-320 320-320 57 56-224 224h487v80H313Z"/></svg>
                        Voltar</a>
                </div>
            </div>

            <div class="grid grid-2" style="gap:1.5rem; padding: 0 1.5rem;">

                <div class="card">

                    <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                        <strong>
                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#1f1f1f"><path d="M240-200h120v-240h240v240h120v-360L480-740 240-560v360Zm-80 80v-480l320-240 320 240v480H520v-240h-80v240H160Zm320-350Z"/></svg>
                            Adoção
                        </strong>

                        <div class="text-muted" style="font-size:0.8rem;">
                            Adotado: ${adoption.adoptionDate != null ? adoption.formattedAdoptionDate : adoption.formattedRequestDate}
                        </div>
                    </div>

                    <div class="card-body" style="display:flex; flex-direction:column; gap:1rem;">
                        <div class="grid grid-2" style="gap:1rem;">

                            <div class="shift-card">
                                <div style="font-weight:600; margin-bottom:.5rem;">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#1f1f1f"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                                    Gato
                                </div>

                                <div class="text-sm">
                                    <strong>${adoption.cat.name}</strong>
                                </div>

                                <div class="text-xs text-gray">
                                    ${adoption.cat.estimatedAge}
                                </div>

                                <span class="badge ${adoption.cat.vaccination ? 'badge-green' : 'badge-yellow'}">
                                    ${adoption.cat.vaccination ? 'Vacinado' : 'Não vacinado'}
                                </span>

                                <span class="badge ${adoption.cat.sterilization ? 'badge-green' : 'badge-yellow'}">
                                    ${adoption.cat.sterilization ? 'Esterilizado' : 'Não esterilizado'}
                                </span>
                            </div>

                            <div class="shift-card">
                                <div style="font-weight:600; margin-bottom:.5rem;">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M367-527q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q560-607 560-640t-23.5-56.5Q513-720 480-720t-56.5 23.5Q400-673 400-640t23.5 56.5Q447-560 480-560t56.5-23.5ZM480-640Zm0 400Z"/></svg>
                                    Adotante
                                </div>

                                <div class="text-sm">
                                    <strong>${adoption.user.name}</strong>
                                </div>

                                <div class="text-xs text-gray">
                                    ${adoption.user.email}
                                </div>

                                <div class="text-xs text-gray">
                                    ${adoption.user.telephone}
                                </div>

                                <div style="margin-top:.5rem;" class="text-xs text-gray">
                                    ${adoption.user.address}
                                </div>
                            </div>
                        </div>

                        <div class="shift-card" style="background:#f8fafc;">
                            <div style="font-weight:600; margin-bottom:.25rem;">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="black"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
                                Candidatura
                            </div>

                            <div class="text-xs text-gray">
                                Pedido em ${adoption.formattedRequestDate}
                            </div>

                            <div style="margin-top:.5rem;">
                                <strong>Motivação: </strong>
                                <div class="text-sm text-gray">
                                    ${adoption.reason}
                                </div>
                            </div>

                            <div style="margin-top:.5rem;">
                                <strong>Experiência com Gatos: </strong>
                                <div class="text-sm text-gray">
                                    ${adoption.experience}
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="card">

                    <div class="card-header" style="display:flex;justify-content:space-between;align-items:center">
                        <strong>
                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v268q-19-9-39-15.5t-41-9.5v-243H200v560h242q3 22 9.5 42t15.5 38H200Zm0-120v40-560 243-3 280Zm80-40h163q3-21 9.5-41t14.5-39H280v80Zm0-160h244q32-30 71.5-50t84.5-27v-3H280v80Zm0-160h400v-80H280v80ZM720-40q-83 0-141.5-58.5T520-240q0-83 58.5-141.5T720-440q83 0 141.5 58.5T920-240q0 83-58.5 141.5T720-40Zm-20-80h40v-100h100v-40H740v-100h-40v100H600v40h100v100Z"/></svg>
                            Relatórios Pós-Adoção
                        </strong>
                    </div>

                    <div class="card-body">
                        <c:forEach var="report" items="${reports}">
                            <div class="shift-card
                             ${report.status == 'Preocupante' ? 'warning-announcement' : ''}">
                                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:.35rem">
                                    <div style="font-weight:500;font-size:.9rem">
                                            Relatório sobre ${report.cat.name}
                                    </div>
                                    <span class="badge
                                    ${report.status == 'Preocupante' ? 'badge-red' :
                                      (report.status == 'Normal' ? 'badge-grey' :
                                      (report.status == 'Bom' ? 'badge-blue' : 'badge-green'))}">
                                            ${report.status}
                                    </span>
                                </div>

                                <div class="text-xs text-gray">
                                        Submetido a: ${report.formattedReportDate}
                                </div>

                                <div style="display:flex; justify-content:flex-end; margin-top:0.5rem;">
                                    <button class="btn btn-sm btn-outline-secondary"
                                            onclick="openViewModal(this)"
                                            data-id="${report.id}"
                                            data-user-name="${report.user.name}"
                                            data-cat-name="${report.cat.name}"
                                            data-status="${report.status}"
                                            data-date="${report.formattedReportDate}"
                                            data-notes="${report.notes}"
                                            data-health="${report.health}">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M280-280h280v-80H280v80Zm0-160h400v-80H280v80Zm0-160h400v-80H280v80Zm-80 480q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h560v-560H200v560Zm0-560v560-560Z"/></svg>
                                        Ver Relatório
                                    </button>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty reports}">
                            <div class="text-gray text-sm">Ainda não foram submetidos relatórios de monitorização.</div>
                        </c:if>

                    </div>
                </div>
            </div>

        </div>
    </main>
</div>

<div id="viewModal" class="modal-overlay">
    <div class="modal-content" style="max-height: fit-content">

        <div class="d-flex justify-content-between align-items-center fit-content mb-3">
            <h4>Relatório — <span id="viewCatNameTitle"></span></h4>
            <button onclick="closeViewModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <div style="display:flex; flex-direction:column; gap:0.75rem; font-size:0.9rem;">


            <div style="margin-bottom:0.5rem;">
                <h5 style="font-weight:600; margin-bottom:0.25rem;">Identificação</h5>
                <hr style="margin:0;">
            </div>

            <div style="display:flex; gap:1rem;">
                <div style="flex:1">
                    <p>
                        <strong>Nome do Adotante: </strong>
                        <span style="display:block; margin-top:0.25rem;" id="viewUserName"></span></p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Nome do Gato: </strong>
                        <span style="display:block; margin-top:0.25rem;" id="viewCatNameBody"> </span>
                    </p>
                </div>
            </div>

            <div style="display:flex; gap:1rem;">
                <div style="flex:1">
                    <p>
                        <strong>Data do Relatório: </strong>
                        <span style="display:block; margin-top:0.25rem;" id="viewReportDate"></span>
                    </p>
                </div>

                <div style="flex:1">
                    <p>
                        <strong>Estado do Gato: </strong><br/>
                        <span style="display:block; margin-top:0.25rem;" id="viewStatus"> </span>
                    </p>
                </div>
            </div>

            <div style="margin-bottom:0.5rem;">
                <h5 style="font-weight:600; margin-bottom:0.25rem;">Notas e Observações</h5>
                <hr style="margin:0;">
            </div>

            <div>
                <p>
                    <strong>Atualização sobre o Comportamento do Gato: </strong>
                    <span style="display:block; margin-top:0.25rem;" id="viewNotes" style="margin-top: 0.25rem"> </span>
                </p>
            </div>

            <div>
                <p>
                    <strong>Observações sobre a Saúde do Gato: </strong>
                    <span style="display:block; margin-top:0.25rem;" id="viewHealth" style="margin-top:0.25rem;"></span>
                </p>
            </div>

        </div>

    </div>
</div>

<script>
    function openViewModal(button) {
        document.getElementById("viewUserName").innerText = button.dataset.userName;
        document.getElementById("viewCatNameTitle").innerText = button.dataset.catName;
        document.getElementById("viewCatNameBody").innerText = button.dataset.catName;
        document.getElementById("viewStatus").innerText = button.dataset.status;
        document.getElementById("viewReportDate").innerText = button.dataset.date;
        document.getElementById("viewNotes").innerText = button.dataset.notes;
        document.getElementById("viewHealth").innerText = button.dataset.health;

        document.getElementById("viewModal").classList.add("open");
    }

    function closeViewModal() {
        document.getElementById("viewModal").classList.remove("open");
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>