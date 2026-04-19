<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Base de Gatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>

<body>
<div class="admin-layout">

    <c:set var="activePage" value="manage-cat" />
    <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="admin-main">

        <div style="padding:1.5rem">

            <div class="mb-8">
                <h1 style="margin-bottom:.25rem">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                    Gestão de Gatos
                </h1>
                <p>Visualização e gestão dos gatos do abrigo</p>
            </div>

            <c:if test="${success != null}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <c:if test="${error != null}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <div>
                <h3>
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                    Filtrar Gatos
                </h3>
            </div>

            <form method="GET" action="/admin/manage-cat" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Nome do Gato
                    </label>
                    <input type="text" name="nameFilter" id="nameFilter" class="form-control" placeholder="Nome do gato"
                    value="${param.nameFilter}">
                </div>

                <div style="display:flex; flex-direction:column; flex: 1">
                    <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                        Estado do Gato
                    </label>
                    <select name="statusFilter" id="statusFilter" class="form-control">
                        <option value="">Qualquer estado</option>
                        <option value="Disponível">Disponível</option>
                        <option value="Em Processo">Em Processo</option>
                        <option value="Adotado">Adotado</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href="/admin/manage-cat" class="btn btn-secondary">Limpar</a>

            </form>

            <div style="display:flex; gap:1rem; margin-bottom:1.5rem;">
                <div class="card" style="flex:1; text-align:center; padding:1rem;">
                    <h3>${allCats}</h3>
                    <p class="text-muted">Total de Gatos</p>
                </div>

                <div class="card" style="flex:1; text-align:center; padding:1rem;">
                    <h3>
                        <c:out value="${availableCats}" />
                    </h3>
                    <p class="text-muted">Gatos Disponíveis</p>
                </div>

                <div class="card" style="flex:1; text-align:center; padding:1rem;">
                    <h3>
                        <c:out value="${adoptedCats}" />
                    </h3>
                    <p class="text-muted">Gatos Adotados</p>
                </div>

                <div class="card" style="flex:1; text-align:center; padding:1rem;">
                    <h3>
                        <c:out value="${inProcessCats}" />
                    </h3>
                    <p class="text-muted">Gatos em Processo de Adoção</p>
                </div>
            </div>

            <div class="card-body">
                <div class="card">

                    <div class="card-header" style="display:flex; align-items:center; gap:1rem; padding:0.75rem 1.5rem;">
                        <div style="flex:1.5;">
                            <strong>
                                <svg xmlns="http://www.w3.org/2000/svg" height="17px" viewBox="0 -960 960 960" width="17px" fill="black"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                                Gatos Resgatados
                            </strong>
                        </div>

                        <div style="flex:1; font-size:0.85rem; color:#6b7280;">
                            Informação
                        </div>

                        <div style="flex:1; font-size:0.85rem; color:#6b7280;">
                            Estado
                        </div>

                        <div style="flex:1; font-size:0.85rem; color:#6b7280;">
                            Chegada
                        </div>

                        <div style="width:200px; display:flex; justify-content:flex-end;">
                            <button class="btn btn-dark" onclick="openModal()">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="white"><path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/></svg>
                                Adicionar Gato
                            </button>
                        </div>
                    </div>

                    <div class="card-body">
                        <c:forEach var="cat" items="${cats}">
                            <div style="display:flex; align-items:center; gap:1rem; padding:.75rem 1.5rem; border-top:1px solid #f3f4f6">

                                <div style="flex:1.5; display:flex; align-items:center; gap:.75rem;">
                                    <img src="/image/${cat.image}" alt="${cat.name}" class="avatar" style="width:40px; height:40px; border-radius:50%; object-fit:cover;"/>
                                    <div>
                                        <div style="font-weight:500">${cat.name}</div>
                                        <div class="text-sm text-gray">${cat.breed}</div>
                                    </div>
                                </div>

                                <div style="flex:1;">
                                        ${cat.estimatedAge} • ${cat.gender ? 'Macho' : 'Fêmea'}
                                </div>

                                <div style="flex:1;">
                                    <span class="badge
                                        ${cat.status == 'Disponível' ? 'badge-green' :
                                        (cat.status == 'Em Processo' ? 'badge-yellow' : 'badge-gray')}">
                                            ${cat.status}
                                    </span>
                                </div>

                                <div style="flex:1;">
                                        ${cat.formattedArrivalDate}
                                </div>

                                <div style="width:200px; display:flex; justify-content:flex-end; align-items:center; gap:.5rem;">

                                    <div class="d-flex gap-2">
                                        <a href="/admin/medication/${cat.id}" class="btn btn-sm btn-outline-success">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="currentColor"><path d="M345-120q-94 0-159.5-65.5T120-345q0-45 17-86t49-73l270-270q32-32 73-49t86-17q94 0 159.5 65.5T840-615q0 45-17 86t-49 73L504-186q-32 32-73 49t-86 17Zm266-286 107-106q20-20 31-47t11-56q0-60-42.5-102.5T615-760q-29 0-56 11t-47 31L406-611l205 205ZM345-200q29 0 56-11t47-31l106-107-205-205-107 106q-20 20-31 47t-11 56q0 60 42.5 102.5T345-200Z"/></svg>
                                            Medicação
                                        </a>

                                        <button class="btn btn-sm btn-outline-primary"
                                                onclick="editCat(this)"
                                                data-id="${cat.id}"
                                                data-image="/image/${cat.image}"
                                                data-name="${cat.name}"
                                                data-estimatedAge="${cat.estimatedAge}"
                                                data-gender="${cat.gender}"
                                                data-breed="${cat.breed}"
                                                data-status="${cat.status}"
                                                data-arrivalDate="${cat.arrivalDate}"
                                                data-description="${cat.description}"
                                                data-tags="<c:forEach var='tag' items='${empty cat.tags ? {} : cat.tags}' varStatus='s'>${tag}<c:if test='${!s.last}'>,</c:if></c:forEach>"
                                                data-fiv="${cat.fiv}"
                                                data-felv="${cat.felv}"
                                                data-vaccination="${cat.vaccination}"
                                                data-parasiteControl="${cat.parasiteControl}"
                                                data-sterilization="${cat.sterilization}">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h357l-80 80H200v560h560v-278l80-80v358q0 33-23.5 56.5T760-120H200Zm280-360ZM360-360v-170l367-367q12-12 27-18t30-6q16 0 30.5 6t26.5 18l56 57q11 12 17 26.5t6 29.5q0 15-5.5 29.5T897-728L530-360H360Zm481-424-56-56 56 56ZM440-440h56l232-232-28-28-29-28-231 231v57Zm260-260-29-28 29 28 28 28-28-28Z"/></svg>
                                        </button>

                                        <button class="btn btn-sm btn-outline-danger"
                                                onclick="openDeleteModal(${cat.id})">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg>
                                        </button>

                                    </div>

                                </div>

                            </div>
                        </c:forEach>

                        <c:if test="${empty cats}">
                            <div class="text-gray text-sm">Sem gatos resgatados.</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>

</div>

<div id="addCatModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Registar Novo Gato</h4>
            <button class="modal-close" onclick="closeModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/create-cat" method="POST" enctype="multipart/form-data" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="mb-4">
                <h5 style="font-weight:600;">Informação Básica</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="mb-3">
                <label>Foto do Gato</label>
                <input type="file" name="photo" id="photo" class="form-control" accept="image/*">
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Nome</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Insira o nome do gato" required/>
                </div>
                <div class="col">
                    <label>Idade Estimada</label>
                    <input type="text" name="estimatedAge" class="form-control" id="estimatedAge" placeholder="Ex: 1 ano / 4-5 meses" required/>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Raça</label>
                    <input type="text" name="breed" class="form-control" id="breed" placeholder="Ex: Gato laranja"/>
                </div>
                <div class="col">
                    <label>Género</label>
                    <select class="form-control" name="gender" id="gender" required>
                        <option disabled selected> Selecione o sexo do gato </option>
                        <option value="true">Macho</option>
                        <option value="false">Fêmea</option>
                    </select>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Estado de Adoção</label>
                    <select class="form-control" name="status" id="status" required>
                        <option disabled selected> Selecione o estado do gato </option>
                        <option>Disponível</option>
                        <option>Em Processo</option>
                        <option>Adotado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Data de Entrada</label>
                    <input type="date" name="arrivalDate" id="arrivalDate" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label>Descrição</label>
                <input type="text" name="description" id="description" class="form-control" placeholder="Ex: Dá-se bem com outros gatos, mas tem medo de pessoas">
            </div>

            <div class="mt-4">
                <h5>Traços de Personalidade</h5>
                <hr>

                <div id="tagList" class="mb-3"></div>

                    <label class="form-label">
                        Traço de Personalidade
                        <input type="text" class="form-control mb-2" id="tag" name="tag" placeholder="Ex: Carinhoso">
                    </label>

                    <button type="button" class="btn btn-outline w-full mb-4" style="background-color:#e5e7eb" onclick="addTag()">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/></svg>
                        Adicionar Traço de Personalidade
                    </button>

                    <div id="tagHiddenInputs"></div>
            </div>

            <div class="mt-4 mb-3">
                <h5 style="font-weight:600;">Saúde</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Teste FIV</label>
                    <select class="form-control" name="fiv" id="fiv">
                        <option disabled selected> Selecione o resultado do teste FIV </option>
                        <option value="true">Positivo</option>
                        <option value="false">Negativo</option>
                    </select>
                </div>
                <div class="col">
                    <label>Teste FELV</label>
                    <select class="form-control" name="felv" id="felv">
                        <option disabled selected> Selecione o resultado do teste FELV </option>
                        <option value="true">Positivo</option>
                        <option value="false">Negativo</option>
                    </select>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Vacinação</label>
                    <select class="form-control" name="vaccination" id="vaccination">
                        <option disabled selected> Selecione o estado de vacinação </option>
                        <option value="true">Vacinado</option>
                        <option value="false">Não Vacinado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Esterilização/Castração</label>
                    <select class="form-control" name="sterilization" id="sterilization">
                        <option disabled selected> Selecione o estado de esterilização/castração </option>
                        <option value="true">Esterilizado/Castrado</option>
                        <option value="false">Não Esterilizado/Castrado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Desparasitação</label>
                    <select class="form-control" name="parasiteControl" id="parasiteControl">
                        <option disabled selected> Selecione o estado de desparasitação </option>
                        <option value="true">Desparasitado</option>
                        <option value="false">Não desparasitado</option>
                    </select>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <button type="button" class="btn btn-secondary" style="background-color:#9ca3af" onclick="closeModal()">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-dark" style="background-color:#f97316; color:white">
                    Registar Gato
                </button>
            </div>

        </form>
    </div>

</div>

<div id="editCatModal" class="modal-overlay">

    <div class="modal-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Alterar Detalhes do Gato</h4>
            <button class="modal-close" onclick="closeEditModal()">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
            </button>
        </div>

        <form action="/admin/update-cat" method="POST" enctype="multipart/form-data" style="overflow-y: scroll; overflow-x: hidden; scrollbar-width: thin; padding: 10px;">

            <input type="hidden" name="id" id="editCatId"/>
            <input type="hidden" name="existingImage" id="existingImage"/>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="editCatId"/>
            <input type="hidden" name="existingImage" id="existingImage"/>

            <div class="mb-4">
                <h5 style="font-weight:600;">Informação Básica</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="mb-3">
                <label>Foto Atual</label><br>
                <img id="editCurrentPhoto" src="" alt="Foto atual"
                     class="img-thumbnail mb-2"
                     style="max-width:120px; max-height:120px; object-fit:cover; display:none;">
                <label class="mt-2">Nova Foto (deixe vazio para manter a atual)</label>
                <input type="file" name="photo" id="editPhoto" class="form-control" accept="image/*">
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Nome</label>
                    <input type="text" name="name" class="form-control" id="editName" placeholder="Insira o nome do gato" required/>
                </div>
                <div class="col">
                    <label>Idade Estimada</label>
                    <input type="text" name="estimatedAge" class="form-control" id="editEstimatedAge" placeholder="Ex: 1 ano / 4-5 meses" required/>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Raça</label>
                    <input type="text" name="breed" class="form-control" id="editBreed" placeholder="Ex: Gato laranja"/>
                </div>
                <div class="col">
                    <label>Género</label>
                    <select class="form-control" name="gender" id="editGender" required>
                        <option disabled selected> Selecione o sexo do gato </option>
                        <option value="true">Macho</option>
                        <option value="false">Fêmea</option>
                    </select>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Estado de Adoção</label>
                    <select class="form-control" name="status" id="editStatus" required>
                        <option disabled selected> Selecione o estado do gato </option>
                        <option>Disponível</option>
                        <option>Em Processo</option>
                        <option>Adotado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Data de Entrada</label>
                    <input type="date" name="arrivalDate" id="editArrivalDate" class="form-control" required>
                </div>
            </div>

            <div class="mb-3">
                <label>Descrição</label>
                <input type="text" name="description" id="editDescription" class="form-control" placeholder="Ex: Dá-se bem com outros gatos, mas tem medo de pessoas">
            </div>

            <div class="mt-4">
                <h5>Traços de Personalidade</h5>
                <hr>

                <div id="editTagList" class="mb-3"></div>

                <label class="form-label">
                    Traço de Personalidade
                    <input type="text" class="form-control mb-2" id="editTag" name="tag" placeholder="Ex: Carinhoso">
                </label>

                <button type="button" class="btn btn-outline w-full mb-4" style="background-color:#e5e7eb" onclick="addTagEdit()">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M440-440H200v-80h240v-240h80v240h240v80H520v240h-80v-240Z"/></svg>
                    Adicionar Traço de Personalidade
                </button>

                <div id="editTagHiddenInputs"></div>
            </div>

            <div class="mt-4 mb-3">
                <h5 style="font-weight:600;">Saúde</h5>
                <hr style="margin-top:4px;">
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Teste FIV</label>
                    <select class="form-control" name="fiv" id="editFiv">
                        <option disabled selected> Selecione o resultado do teste FIV </option>
                        <option value="true">Positivo</option>
                        <option value="false">Negativo</option>
                    </select>
                </div>
                <div class="col">
                    <label>Teste FELV</label>
                    <select class="form-control" name="felv" id="editFelv">
                        <option disabled selected> Selecione o resultado do teste FELV </option>
                        <option value="true">Positivo</option>
                        <option value="false">Negativo</option>
                    </select>
                </div>
            </div>

            <div class="row" style="margin-bottom:10px;">
                <div class="col">
                    <label>Vacinação</label>
                    <select class="form-control" name="vaccination" id="editVaccination">
                        <option disabled selected> Selecione o estado de vacinação </option>
                        <option value="true">Vacinado</option>
                        <option value="false">Não Vacinado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Esterilização/Castração</label>
                    <select class="form-control" name="sterilization" id="editSterilization">
                        <option disabled selected> Selecione o estado de esterilização/castração </option>
                        <option value="true">Esterilizado/Castrado</option>
                        <option value="false">Não Esterilizado/Castrado</option>
                    </select>
                </div>
                <div class="col">
                    <label>Desparasitação</label>
                    <select class="form-control" name="parasiteControl" id="editParasiteControl">
                        <option disabled selected> Selecione o estado de desparasitação </option>
                        <option value="true">Desparasitado</option>
                        <option value="false">Não desparasitado</option>
                    </select>
                </div>
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

        <h5 class="mb-3">Eliminar Gato</h5>

        <p class="text-muted">
            Tens a certeza que queres eliminar este gato?
        </p>

        <form id="deleteForm" method="POST" action="/admin/delete-cat">

            <input type="hidden" name="catId" id="deleteCatId"/>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="catId" id="deleteCatId"/>

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
        document.getElementById("addCatModal").classList.add("open");
    }

    function closeModal() {
        document.getElementById("addCatModal").classList.remove("open");
        const form = document.querySelector("#addCatModal form");
        form.reset();
        document.getElementById("tagList").innerHTML = "";
        document.getElementById("tagHiddenInputs").innerHTML = "";
        tagIndex = 0;
    }

    function openEditModal() {
        document.getElementById("editCatModal").classList.add("open");
    }

    function closeEditModal() {
        document.getElementById("editCatModal").classList.remove("open");
        const form = document.querySelector("#editCatModal form");
        form.reset();
        document.getElementById("editTagList").innerHTML = "";
        document.getElementById("editTagHiddenInputs").innerHTML = "";
        tagIndex = 0;
    }

    function editCat(button) {
        const id = button.getAttribute("data-id");
        const image = button.getAttribute("data-image");
        const name = button.getAttribute("data-name");
        const estimatedAge = button.getAttribute("data-estimatedAge");
        const gender = button.getAttribute("data-gender");
        const breed = button.getAttribute("data-breed");
        const status = button.getAttribute("data-status");
        const arrivalDate = button.getAttribute("data-arrivalDate");
        const description = button.getAttribute("data-description");
        const tagsAttr = button.getAttribute("data-tags");
        const tags = tagsAttr ? tagsAttr.split(",").map(t => t.trim()) : [];
        const fiv = button.getAttribute("data-fiv");
        const felv = button.getAttribute("data-felv");
        const vaccination = button.getAttribute("data-vaccination");
        const parasiteControl = button.getAttribute("data-parasiteControl");
        const sterilization = button.getAttribute("data-sterilization");

        document.getElementById("editTagList").innerHTML = ""; //reset tags list
        document.getElementById("editTagHiddenInputs").innerHTML = ""; //reset tags lists hidden inputs

        openEditModal();

        document.getElementById("editCatId").value = id;
        document.getElementById("existingImage").value = image;
        const photoEl = document.getElementById("editCurrentPhoto");
        if (image && image.trim() !== "") {
            photoEl.src = image;
            photoEl.style.display = "block";
        } else {
            photoEl.style.display = "none";
        }
        document.getElementById("editName").value = name;
        document.getElementById("editEstimatedAge").value = estimatedAge;
        document.getElementById("editGender").value = gender;
        document.getElementById("editBreed").value = breed;
        document.getElementById("editStatus").value = status;
        document.getElementById("editArrivalDate").value = arrivalDate;
        document.getElementById("editDescription").value = description;
        document.getElementById("editFiv").value = fiv;
        document.getElementById("editFelv").value = felv;
        document.getElementById("editVaccination").value = vaccination;
        document.getElementById("editParasiteControl").value = parasiteControl;
        document.getElementById("editSterilization").value = sterilization;

        tags.forEach(tag => {
            const cleanTag = tag.trim();
            if (!cleanTag) return;
            addTagToEditModal(cleanTag);
        });

    }

    function openDeleteModal(id) {
        document.getElementById("deleteCatId").value = id;
        document.getElementById("deleteModal").classList.add("open");
    }

    function closeDeleteModal() {
        document.getElementById("deleteModal").classList.remove("open");
    }

    let tagIndex = 0;

    function addTag() {
        const input = document.getElementById("tag");
        const tag = input.value.trim();

        if (!tag) {
            alert("Insira um tag antes de adicionar");
            return;
        }

        const list = document.getElementById("tagList");
        const hidden = document.getElementById("tagHiddenInputs");

        const tagDiv = document.createElement("div");
        tagDiv.className = "tag-item d-flex justify-content-between align-items-center mb-2 p-2 border rounded";

        tagDiv.innerHTML = `
        <span>\${tag}</span>
        <button type="button" onclick="removeTag(this)" class="btn btn-sm btn-danger">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
        </button>
    `;

        list.appendChild(tagDiv);

        hidden.innerHTML += `
        <input type="hidden" name="tags[\${tagIndex}]" value="\${tag}">
    `;

        tagIndex++;

        input.value = "";
    }

    function removeTag(button) {
        const tagDiv = button.closest(".tag-item");
        tagDiv.remove();
        const hidden = document.getElementById("tagHiddenInputs");
        const tags = document.querySelectorAll("#tagList .tag-item");

        hidden.innerHTML = "";
        tags.forEach((tagEl, index) => {
            const tag = tagEl.querySelector("span").innerText;

            hidden.innerHTML += `
            <input type="hidden" name="tags[\${index}]" value="\${tag}">
        `;
        });

        tagIndex = tags.length;
    }

    function addTagEdit() {
        const input = document.getElementById("editTag");
        const tag = input.value.trim();

        if (!tag) {
            alert("Insira um tag antes de adicionar");
            return;
        }

        addTagToEditModal(tag);
        input.value = "";
    }

    function addTagToEditModal(tag) {
        const list = document.getElementById("editTagList");
        const hidden = document.getElementById("editTagHiddenInputs");
        const index = hidden.children.length;

        const tagDiv = document.createElement("div");
        tagDiv.className = "tag-item d-flex justify-content-between align-items-center mb-2 p-2 border rounded";

        tagDiv.innerHTML = `
        <span>\${tag}</span>
        <button type="button" class="btn btn-sm btn-danger" onclick="removeTagEdit(this)">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m336-280-56-56 144-144-144-143 56-56 144 144 143-144 56 56-144 143 144 144-56 56-143-144-144 144Z"/></svg>
        </button>
    `;

        list.appendChild(tagDiv);

        hidden.innerHTML += `
        <input type="hidden" name="tags[\${index}]" value="\${tag}">
    `;
    }

    function removeTagEdit(button) {
        const tagDiv = button.closest(".tag-item");
        tagDiv.remove();
        const hidden = document.getElementById("editTagHiddenInputs");
        const tags = document.querySelectorAll("#editTagList .tag-item");

        hidden.innerHTML = "";
        tags.forEach((tagEl, index) => {
            const tag = tagEl.querySelector("span").innerText;

            hidden.innerHTML += `
            <input type="hidden" name="tags[\${index}]" value="\${tag}">
        `;
        });
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>