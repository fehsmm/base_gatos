<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Turno Atual</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="view-shift" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="/WEB-INF/views/fragments/adminSidebar.jsp" %>
    <main class="flex-1 page">
        <c:if test="${previousNote != null && !previousNote.read && (not empty previousNote.summary || not empty previousNote.importantObservations)}">
            <div id="modalNoteAnterior" style="display:flex; position:fixed; top:0; left:0; width:100%; height:100%;
             background:rgba(0,0,0,0.7); z-index:999; align-items:center; justify-content:center;">
                <div style="background:white; border-radius:12px; padding:2rem; width:100%; max-width:500px; margin:1rem; max-height:80vh; overflow-y:auto;">
                    <div style="font-weight:600; font-size:1.2rem; margin-bottom:0.25rem;"><img src="/icons/noteicon.svg" width="20px" height="20px"/> Nota do turno anterior
                    </div>
                    <div style="color:#9ca3af; font-size:0.8rem; margin-bottom:1.5rem;">Lê antes de iniciar o teu
                        turno
                    </div>
                    <c:if test="${not empty previousNote.summary}">
                        <div style="font-weight:600; font-size:0.85rem; margin-bottom:0.25rem;">Resumo do Turno:</div>
                        <div class="panel" style="margin-bottom:1rem; font-size:0.9rem;">${previousNote.summary}</div>
                    </c:if>
                    <c:if test="${not empty previousNote.importantObservations}">
                        <div style="font-weight:600; font-size:0.85rem; margin-bottom:0.25rem;">Observações
                            Importantes:
                        </div>
                        <div class="panel"
                             style="margin-bottom:1.5rem; font-size:0.9rem;">${previousNote.importantObservations}</div>
                    </c:if>
                    <form action="/volunteer/read-note/${previousNote.shift.id}" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary" style="width:100%;">
                            <img src="/icons/checkicon.svg" width="20px" height="20px"/> Li e compreendi — Iniciar turno
                        </button>
                    </form>
                </div>
            </div>
        </c:if>

        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title" style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">
                    Turno Atual
                </div>
                <div class="page-subtitle" style="margin-bottom: 1.5rem;">
                    Resumo do turno em curso.
                </div>

                <c:choose>
                    <c:when test="${todayShift == null}">
                        <div class="panel text-center">
                            <div style="font-size:2rem; margin-bottom:0.5rem;"><img src="/icons/calendar.svg" width="20px" height="20px"/></div>
                            <div style="font-weight:600; margin-bottom:0.25rem;">Sem turno hoje</div>
                            <div style="color:#9ca3af; font-size:0.9rem;">Não tens nenhum turno agendado para hoje.
                            </div>
                            <a href="/volunteer/view-schedule" class="btn btn-primary btn-sm" style="margin-top:1rem;">
                                Ver as minhas escalas
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>

                        <div class="panel" style="margin-bottom:1rem;">
                            <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:0.5rem;">
                                <div>
                                    <div style="font-weight:600; font-size:1.1rem; margin-bottom:0.25rem;">
                                        <img src="/icons/calendaricon.svg" width="20px" height="20px"/> ${todayShift.date}</div>
                                    <div style="color:#9ca3af; font-size:0.9rem;"><img src="/icons/clock.svg" width="20px" height="20px"/> ${todayShift.startTime}
                                        — ${todayShift.endTime}</div>
                                </div>
                                <c:choose>
                                    <c:when test="${todayShift.endedAt != null}">
                                        <span style="background:#f3f4f6; color:#6b7280; padding:0.25rem 0.75rem; border-radius:999px; font-size:0.8rem; font-weight:600;">Terminado</span>
                                    </c:when>
                                    <c:when test="${todayShift.startedAt != null}">
                                        <span style="background:#dcfce7; color:#16a34a; padding:0.25rem 0.75rem; border-radius:999px; font-size:0.8rem; font-weight:600;">Em curso</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="background:#fef9c3; color:#ca8a04; padding:0.25rem 0.75rem; border-radius:999px; font-size:0.8rem; font-weight:600;">Agendado</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:if test="${not empty todayShift.volunteers}">
                                <div style="margin-top:0.75rem; font-size:0.85rem; color:#9ca3af;">
                                    Voluntários:
                                    <c:forEach var="vol" items="${todayShift.volunteers}" varStatus="s">
                                        <strong style="color:#e5e7eb;">${vol.name}</strong><c:if
                                            test="${!s.last}">, </c:if>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>

                        <div style="display:flex; gap:0.75rem; margin-bottom:1.5rem;">
                            <c:choose>
                                <c:when test="${todayShift.startedAt == null}">
                                    <form action="/volunteer/start-shift/${todayShift.id}" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-primary">▶ Iniciar Turno</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <div style="color:#16a34a; font-size:0.85rem; display:flex; align-items:center; gap:0.5rem;">
                                        <img src="/icons/checkicon.svg" width="20px" height="20px"/> Turno iniciado às ${todayShift.startedAt}
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${todayShift.startedAt != null && todayShift.endedAt == null}">
                                <button type="button" class="btn btn-secondary"
                                        onclick="document.getElementById('modalNota').style.display='flex'">
                                    <img src="/icons/clock.svg" width="20px" height="20px"/> Terminar Turno
                                </button>
                            </c:if>

                            <c:if test="${todayShift.endedAt != null}">
                                <div style="color:#9ca3af; font-size:0.85rem; display:flex; align-items:center; gap:0.5rem;">
                                    <img src="/icons/clock.svg" width="20px" height="20px"/> Turno terminado às ${todayShift.endedAt}
                                </div>
                            </c:if>
                        </div>

                        <c:if test="${todayShift.startedAt != null && todayShift.endedAt == null}">
                            <c:if test="${not empty activeMedications}">
                                <div style="background:#fef2f2; border:1px solid #fca5a5; border-radius:8px;
                padding:1rem; margin-bottom:1.5rem;">
                                    <div style="font-weight:700; color:#dc2626; margin-bottom:0.75rem; font-size:1rem;">
                                        <img src="/icons/medicine.svg" width="20px" height="20px"/> Medicações para hoje
                                    </div>
                                    <c:forEach var="med" items="${activeMedications}">
                                        <div style="background:white; border-radius:6px; padding:0.75rem;
                        margin-bottom:0.5rem; border-left:3px solid #dc2626;">
                                            <div style="font-weight:600; margin-bottom:0.25rem;">
                                                <img src="/icons/cat.svg" width="20px" height="20px"/> ${med.cat.name} — ${med.medicationName}
                                            </div>
                                            <div style="font-size:0.85rem; color:#6b7280; margin-bottom:0.25rem;">
                                                Dose: <strong>${med.dose}</strong>
                                            </div>
                                            <c:if test="${not empty med.storageLocation}">
                                                <div style="font-size:0.85rem; color:#6b7280; margin-bottom:0.25rem;">
                                                    <img src="/icons/box.svg" width="20px" height="20px"/> Localização: <strong>${med.storageLocation}</strong>
                                                </div>
                                            </c:if>
                                            <div style="font-size:0.85rem; color:#6b7280;">
                                                Até: ${med.formattedEndDate}
                                            </div>
                                            <c:if test="${not empty med.notes}">
                                                <div style="font-size:0.85rem; color:#dc2626; margin-top:0.25rem;">
                                                    <img src="/icons/noteicon.svg" width="20px" height="20px"/> ${med.notes}
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <div class="section-title">Tarefas</div>
                            <c:choose>
                                <c:when test="${empty todayShift.tasks}">
                                    <div class="panel text-center" style="color:#9ca3af;">
                                        Não há tarefas registadas para este turno.
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="panel">
                                        <c:forEach var="task" items="${todayShift.tasks}" varStatus="s">
                                            <div style="display:flex; align-items:flex-start; gap:0.75rem;
                                                    padding:0.75rem 0;
                                                    ${!s.last ? 'border-bottom:1px solid #1f2937;' : ''}">
                                                <form action="/volunteer/complete-task/${task.id}" method="POST"
                                                      style="display:inline;">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <input type="checkbox"
                                                           style="margin-top:3px; accent-color:#f97316; width:16px; height:16px; cursor:pointer;"
                                                        ${task.completed ? 'checked' : ''}
                                                           onchange="this.form.submit()">
                                                </form>
                                                <div>
                                                    <div style="font-weight:600; font-size:0.95rem;">${task.title}</div>
                                                    <c:if test="${not empty task.description}">
                                                        <div style="color:#9ca3af; font-size:0.85rem;">${task.description}</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div id="modalNota" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%;
         background:rgba(0,0,0,0.5); z-index:999; align-items:center; justify-content:center;">
            <div style="background:white; border-radius:12px; padding:2rem; width:100%; max-width:500px; margin:1rem;">
                <div style="font-weight:600; font-size:1.2rem; margin-bottom:1.5rem;">
                    Terminar Turno — Preenche as notas
                </div>
                <form action="/volunteer/save-note/${todayShift.id}" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <label class="form-label">Resumo do turno</label>
                    <textarea name="summary" class="form-textarea-custom" style="margin-bottom:1rem;"
                              placeholder="Ex: O Thor comeu pouco...">${todayNote.summary}</textarea>
                    <label class="form-label">Observações Importantes</label>
                    <textarea name="importantObservations" class="form-textarea-custom" style="margin-bottom:1.5rem;"
                              placeholder="Ex: Gato isolado...">${todayNote.importantObservations}</textarea>
                    <div style="display:flex; gap:0.75rem; justify-content:flex-end;">
                        <button type="button" class="btn btn-secondary"
                                onclick="document.getElementById('modalNota').style.display='none'">
                            Cancelar
                        </button>
                        <button type="submit" class="btn btn-primary">Guardar e Terminar</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
