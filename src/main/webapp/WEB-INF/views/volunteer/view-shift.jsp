<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turno Atual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="view-shift"/>
    <c:set var="dashboardUrl" value="/volunteer/"/>
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <%-- 1. MODAL DA NOTA DO TURNO ANTERIOR --%>
        <c:if test="${previousNote != null && !previousNote.read}">
            <div id="modalNoteAnterior"
                 style="display:flex; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:999; align-items:center; justify-content:center;">
                <div style="background:white; border-radius:12px; padding:2rem; width:100%; max-width:500px;">
                    <div style="font-weight:600; font-size:1.2rem;">📝 Nota do turno anterior</div>
                    <hr>
                    <p><strong>Resumo:</strong> ${previousNote.summary}</p>
                    <p><strong>Obs:</strong> ${previousNote.importantObservations}</p>
                    <form action="/volunteer/read-note/${previousNote.id}" method="POST">
                        <button type="submit" class="btn btn-primary">Li e compreendi — Iniciar turno</button>
                    </form>
                </div>
            </div>
        </c:if>

        <%-- 2. MODAL DA NOTA DO COLEGA (MESMO TURNO) --%>
        <c:if test="${sameShiftNote != null && !sameShiftNote.read}">
            <div id="modalSameTurno"
                 style="display:flex; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1000; align-items:center; justify-content:center;">
                <div style="background:white; border-radius:12px; padding:2rem; width:100%; max-width:500px;">
                    <div style="font-weight:600; font-size:1.2rem; display:flex; align-items:center; gap:0.5rem;">
                        <img src="/icons/noteicon.svg" width="24px" height="24px"/>
                        Notas do Turno de Hoje!!!
                    </div>
                    <hr>
                    <div style="margin-bottom: 1rem;">
                        <p style="font-weight: 700; color: #c2410c; margin-bottom: 0.25rem;">⚠️ OBSERVAÇÕES
                            IMPORTANTES:</p>
                        <p style="background: #fff7ed; padding: 0.75rem; border-radius: 8px; border: 1px solid #fed7aa;">
                                ${sameShiftNote.importantObservations}
                        </p>
                    </div>
                    <div style="margin-bottom: 1.5rem;">
                        <p style="font-weight: 700; margin-bottom: 0.25rem;">Resumo do Trabalho:</p>
                        <p>${sameShiftNote.summary}</p>
                    </div>
                    <form action="/volunteer/read-note/${sameShiftNote.id}" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary" style="width:100%;">
                            <img src="/icons/checkicon.svg" width="20px" height="20px"/> Li e compreendi
                        </button>
                    </form>
                </div>
            </div>
        </c:if>

        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title" style="font-size: 2rem; font-weight: bold;">Turno Atual</div>
                <div class="page-subtitle" style="margin-bottom: 1.5rem;">Resumo do turno em curso.</div>

                <c:choose>
                    <%-- CASO: Não há turno hoje --%>
                    <c:when test="${todayShift == null}">
                        <div class="panel text-center">
                            <div style="font-size:2rem;"><img src="/icons/calendar.svg" width="20px"/></div>
                            <div style="font-weight:600;">Sem turno hoje</div>
                            <a href="/volunteer/view-schedule" class="btn btn-primary btn-sm" style="margin-top:1rem;">Ver
                                escalas</a>
                        </div>
                    </c:when>

                    <%-- CASO: Existe turno hoje --%>
                    <c:otherwise>
                        <div class="panel" style="margin-bottom:1rem;">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <div>
                                    <div style="font-weight:600;"><img src="/icons/clockcalendar.svg"
                                                                       width="20px"/> ${todayShift.date}</div>
                                    <div style="color:#9ca3af;">${todayShift.startTime} — ${todayShift.endTime}</div>
                                </div>
                                <c:choose>
                                    <c:when test="${currentUserSubmittedNote}"><span class="badge bg-secondary">Terminado</span></c:when>
                                    <c:when test="${todayShift.startedAt != null}"><span class="badge bg-success">Em curso</span></c:when>
                                    <c:otherwise><span class="badge bg-warning">Agendado</span></c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <%-- Botões de Ação --%>
                        <div style="display:flex; gap:0.75rem; margin-bottom:1.5rem; align-items: center;">
                            <c:choose>
                                <c:when test="${currentUserSubmittedNote}">
                                    <div class="alert alert-success" style="margin:0; flex:1;">Relatório enviado com
                                        sucesso!
                                    </div>
                                </c:when>
                                <c:when test="${!userIsActive}">
                                    <%-- Se houver uma nota do colega, mostramos este aviso amarelo por cima do botão laranja --%>
                                    <c:if test="${not empty sameShiftNote}">
                                        <div class="alert alert-warning"
                                             style="margin-bottom: 1rem; border: 1px solid #ca8a04;">
                                            <strong>⚠️ NOTA DO COLEGA:</strong> O teu colega de turno já deixou um
                                            relatório.
                                            Lê o aviso que apareceu no ecrã antes de clicares em iniciar!
                                        </div>
                                    </c:if>
                                    <form action="/volunteer/start-shift/${todayShift.id}" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-primary">▶ Iniciar o meu Turno</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <div style="color:#16a34a; font-weight:600;">▶ Turno Ativo</div>
                                    <button type="button" class="btn btn-secondary"
                                            onclick="document.getElementById('modalNota').style.display='flex'">
                                        ⏹ Terminar Turno
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <%-- Área de Trabalho (Medicações e Tarefas) --%>
                        <c:if test="${userIsActive && !currentUserSubmittedNote}">
                            <%-- Medicações --%>
                            <c:if test="${not empty medsByCat}">
                                <div class="section-title"><strong>Medicações</strong></div>
                                <c:forEach var="entry" items="${medsByCat}">
                                    <div class="panel mb-3" style="border: 1px solid #fca5a5;">
                                        <div style="font-weight:700;">${entry.key}</div>
                                        <c:forEach var="med" items="${entry.value}">
                                            <div class="d-flex align-items-center gap-2">
                                                <form action="/volunteer/administer-medication/${med.id}" method="POST">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <input type="checkbox"
                                                           onchange="this.form.submit()" ${med.administeredToday ? 'checked disabled' : ''}>
                                                </form>
                                                <span>${med.medicationName}</span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <%-- Tarefas --%>
                            <div class="section-title"><strong>Tarefas</strong></div>
                            <div class="panel">
                                <c:choose>
                                    <c:when test="${empty todayShift.tasks}">
                                        <p class="text-muted">Sem tarefas para este turno.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="task" items="${todayShift.tasks}">
                                            <div class="d-flex align-items-center gap-2 py-2 border-bottom">
                                                <form action="/volunteer/complete-task/${task.id}" method="POST">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <input type="checkbox"
                                                           onchange="this.form.submit()" ${task.completed ? 'checked' : ''}>
                                                </form>
                                                <div>
                                                    <strong>${task.title}</strong><br>
                                                    <small>${task.description}</small>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <%-- Modal de Finalização --%>
        <div id="modalNota"
             style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:999; align-items:center; justify-content:center;">
            <div style="background:white; border-radius:12px; padding:2rem; width:100%; max-width:500px;">
                <div style="font-weight:600; margin-bottom:1.5rem;">Terminar Turno — Notas</div>
                <form action="/volunteer/save-note/${todayShift.id}" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <label class="form-label">Resumo</label>
                    <textarea name="summary" class="form-control mb-3" required></textarea>

                    <label class="form-label">Observações</label>
                    <textarea name="importantObservations" class="form-control mb-3"></textarea>

                    <label class="form-label">Prioridade</label>
                    <select name="priority" class="form-control mb-3">
                        <option value="normal">Normal</option>
                        <option value="high">Alta</option>
                        <option value="urgent">Urgente</option>
                    </select>

                    <div class="d-flex gap-2 justify-content-end">
                        <button type="button" class="btn btn-secondary"
                                onclick="document.getElementById('modalNota').style.display='none'">Cancelar
                        </button>
                        <button type="submit" class="btn btn-primary">Guardar e Terminar</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<script>
    function handleReadPrevious() {
        document.getElementById('modalNoteAnterior').style.display = 'none';
        const modalSame = document.getElementById('modalSameTurno');
        if (modalSame) {
            modalSame.style.display = 'flex';
        } else {
            document.getElementById('formReadPrevious').submit();
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
