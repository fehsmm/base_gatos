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

    <%-- SIDEBAR — copia a do post-announcement.jsp do admin --%>
    <aside class="sidebar">
        <%-- ... sidebar do admin ... --%>
    </aside>

    <main class="admin-main">
        <div style="padding:1.5rem">

            <%-- CABEÇALHO --%>
            <div style="display:flex; align-items:center; gap:1rem; margin-bottom:1.5rem;">
                <a href="/admin/manage-cat" class="btn btn-secondary btn-sm">← Voltar</a>
                <c:if test="${not empty cat.image}">
                    <img src="${cat.image}" alt="${cat.name}"
                         style="width:48px; height:48px; border-radius:50%; object-fit:cover;">
                </c:if>
                <div>
                    <h1 style="margin:0; font-size:1.5rem;">💊 Medicações — ${cat.name}</h1>
                    <p style="margin:0; color:#9ca3af; font-size:0.85rem;">
                        Gerir medicações ativas e histórico clínico
                    </p>
                </div>
                <button class="btn btn-dark ms-auto" onclick="document.getElementById('modalAdd').style.display='flex'">
                    + Nova Medicação
                </button>
            </div>

            <%-- LISTA DE MEDICAÇÕES --%>
            <div class="card">
                <div class="card-header">
                    <strong>Medicações Registadas</strong>
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
                                                <%-- Nome + badge ativo/inativo --%>
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

                                                <%-- Dose --%>
                                            <div style="font-size:0.9rem; margin-bottom:0.25rem;">
                                                Dose: <strong>${med.dose}</strong>
                                            </div>

                                                <%-- Localização --%>
                                            <c:if test="${not empty med.storageLocation}">
                                                <div style="font-size:0.85rem; color:#6b7280; margin-bottom:0.25rem;">
                                                    📦 ${med.storageLocation}
                                                </div>
                                            </c:if>

                                                <%-- Datas --%>
                                            <div style="font-size:0.85rem; color:#9ca3af;">
                                                    ${med.formattedStartDate} → ${med.formattedEndDate}
                                            </div>

                                                <%-- Notas --%>
                                            <c:if test="${not empty med.notes}">
                                                <div style="font-size:0.85rem; color:#dc2626; margin-top:0.5rem;">
                                                    ⚠️ ${med.notes}
                                                </div>
                                            </c:if>

                                                <%-- Criado por --%>
                                            <div style="font-size:0.8rem; color:#9ca3af; margin-top:0.5rem;">
                                                Registado por ${med.createdBy}
                                            </div>
                                        </div>

                                            <%-- Botão apagar --%>
                                        <form action="/admin/medication/delete/${med.id}" method="POST">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-sm btn-outline-danger"
                                                    onclick="return confirm('Apagar esta medicação?')">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="20px"
                                                     viewBox="0 -960 960 960" width="20px" fill="#1f1f1f">
                                                    <path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/>
                                                </svg>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
    </main>
</div>

<%-- MODAL ADICIONAR MEDICAÇÃO --%>
<div id="modalAdd" class="modal-overlay">
    <div class="modal-content">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1.5rem;">
            <h4>Nova Medicação — ${cat.name}</h4>
            <button class="modal-close"
                    onclick="document.getElementById('modalAdd').style.display='none'">✕</button>
        </div>

        <form action="/admin/medication/create" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="catId" value="${cat.id}"/>

            <div class="mb-3">
                <label class="form-label">Nome do medicamento *</label>
                <input type="text" name="medicationName" class="form-control"
                       placeholder="Ex: Lepicortinol" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Dose *</label>
                <input type="text" name="dose" class="form-control"
                       placeholder="Ex: 5mg — 3/4 comprimido" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Localização no abrigo</label>
                <input type="text" name="storageLocation" class="form-control"
                       placeholder="Ex: Gaveta da Andreia">
            </div>

            <div style="display:flex; gap:1rem;">
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de início *</label>
                    <input type="date" name="startDate" class="form-control" required>
                </div>
                <div class="mb-3" style="flex:1">
                    <label class="form-label">Data de fim</label>
                    <input type="date" name="endDate" class="form-control">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Observações para o voluntário</label>
                <textarea name="notes" class="form-control" rows="3"
                          placeholder="Ex: Dar sempre com comida. Confirmar que engoliu."></textarea>
            </div>

            <div style="display:flex; justify-content:flex-end; gap:0.75rem; margin-top:1rem;">
                <button type="button" class="btn btn-secondary"
                        onclick="document.getElementById('modalAdd').style.display='none'">
                    Cancelar
                </button>
                <button type="submit" class="btn btn-dark"
                        style="background-color:#f97316; color:white;">
                    Guardar Medicação
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>