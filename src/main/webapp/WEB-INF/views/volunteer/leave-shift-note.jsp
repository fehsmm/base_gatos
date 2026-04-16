<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Notas do Turno</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="/styles/dashboard.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="admin-layout">--%>

<%--    <c:set var="activePage" value="leave-shift-note" />--%>
<%--<c:set var="dashboardUrl" value="/volunteer/" />--%>
<%--@ include file="../fragments/adminSidebar.jsp" %>--%>

<%--    <main class="flex-1 page">--%>
<%--        <div class="container-fluid px-3 py-3">--%>
<%--            <div class="mb-4">--%>
<%--                <div class="page-title"--%>
<%--                     style="font-size: 2rem; font-weight: bold; margin-bottom: 0.25rem;">--%>
<%--                    Notas Entre Turnos--%>
<%--                </div>--%>
<%--                <div class="page-subtitle" style="margin-bottom: 1.5rem;">--%>
<%--                    Comunicação e observações importantes entre voluntários.--%>
<%--                </div>--%>

<%--                <c:choose>--%>
<%--                    <c:when test="${shift == null}">--%>
<%--                        <div class="panel text-center" style="color:#9ca3af;">--%>
<%--                            Não tens nenhum turno hoje para deixar notas.--%>
<%--                        </div>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <div class="panel">--%>
<%--                            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem;">--%>
<%--                                <div style="font-weight:600;">--%>
<%--                                    Turno de hoje — ${shift.startTime} - ${shift.endTime}--%>
<%--                                </div>--%>
<%--                                <c:if test="${not empty note.updatedAt}">--%>
<%--                                <span style="background:#dcfce7; color:#16a34a; padding:0.25rem 0.75rem;--%>
<%--                                     border-radius:999px; font-size:0.8rem; font-weight:600;">--%>
<%--                                    ✅ Guardado--%>
<%--                                </span>--%>
<%--                                </c:if>--%>
<%--                            </div>--%>

<%--                            <div id="modoLeitura">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${empty note.resumo && empty note.ocorrencias}">--%>
<%--                                        <div style="color:#9ca3af; font-size:0.9rem; margin-bottom:1rem;">--%>
<%--                                            Ainda não há notas para este turno.--%>
<%--                                        </div>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <c:if test="${not empty note.resumo}">--%>
<%--                                            <div style="font-weight:600; font-size:0.85rem; margin-bottom:0.25rem;">--%>
<%--                                                Resumo:--%>
<%--                                            </div>--%>
<%--                                            <div class="panel"--%>
<%--                                                 style="margin-bottom:1rem; font-size:0.9rem; background:#f9fafb;">--%>
<%--                                                    ${note.resumo}--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${not empty note.ocorrencias}">--%>
<%--                                            <div style="font-weight:600; font-size:0.85rem; margin-bottom:0.25rem;">--%>
<%--                                                Ocorrências:--%>
<%--                                            </div>--%>
<%--                                            <div class="panel"--%>
<%--                                                 style="margin-bottom:1rem; font-size:0.9rem; background:#f9fafb;">--%>
<%--                                                    ${note.ocorrencias}--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>

<%--                                <button type="button" class="btn btn-secondary"--%>
<%--                                        onclick="document.getElementById('modoLeitura').style.display='none';--%>
<%--                                             document.getElementById('modoEdicao').style.display='block';">--%>
<%--                                    ✏️ Editar Nota--%>
<%--                                </button>--%>
<%--                            </div>--%>

<%--                            <div id="modoEdicao" style="display:none;">--%>
<%--                                <form action="/volunteer/update-note/${shift.id}" method="POST">--%>
<%--                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

<%--                                    <label class="form-label">Resumo do turno</label>--%>
<%--                                    <textarea name="resumo" class="form-textarea-custom"--%>
<%--                                              style="margin-bottom:1rem;"--%>
<%--                                              placeholder="Ex: O Thor comeu pouco, a Luna estava mais ativa...">${note.resumo}</textarea>--%>

<%--                                    <label class="form-label">Ocorrências importantes</label>--%>
<%--                                    <textarea name="ocorrencias" class="form-textarea-custom"--%>
<%--                                              style="margin-bottom:1rem;"--%>
<%--                                              placeholder="Ex: Gato isolado, medicação administrada...">${note.ocorrencias}</textarea>--%>

<%--                                    <div style="display:flex; gap:0.75rem;">--%>
<%--                                        <button type="submit" class="btn btn-primary">Guardar</button>--%>
<%--                                        <button type="button" class="btn btn-secondary"--%>
<%--                                                onclick="document.getElementById('modoEdicao').style.display='none';--%>
<%--                                                     document.getElementById('modoLeitura').style.display='block';">--%>
<%--                                            Cancelar--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>

<%--                            <c:if test="${not empty note.updatedAt}">--%>
<%--                                <div style="color:#9ca3af; font-size:0.75rem; margin-top:1rem;">--%>
<%--                                    Última atualização: ${note.updatedAt}--%>
<%--                                </div>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </main>--%>

<%--    <script>--%>
<%--        document.querySelector('.btn-primary').addEventListener('click', function () {--%>
<%--            const form = document.getElementById('formNovaNota');--%>
<%--            form.style.display = form.style.display === 'none' ? 'block' : 'none';--%>
<%--        });--%>
<%--    </script>--%>
<%--    </main>--%>
<%--</div>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--</body>--%>
<%--</html>--%>