<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voluntários | Meg</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="dashboard" />
    <c:set var="dashboardUrl" value="/volunteer/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="flex-1 page">
        <div class="container-fluid px-3 py-3">
            <div class="mb-4">
                <div class="page-title"
                     style="font-size: 2rem; text-align: left; margin-bottom: 0.25rem; font-weight: bold;">
                    Área do Voluntário
                </div>
                <div style="font-weight:normal; margin-bottom: 1.5rem;">
                    Bem-vindo, <strong>${user.name}</strong>. Acesso rápido às tuas áreas.
                </div>

                <div class="row g-3">

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/view-schedule" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/calendaricon.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">As Minhas Escalas</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Consulta os teus turnos agendados e anteriores.
                                </div>
                                <div style="margin-top:0.75rem; color:#f97316; font-size:0.85rem; font-weight:600;">
                                    ${upcomingCount} turnos próximos
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/view-shift" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/checkicon.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">Turno Atual</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Vê as tarefas do turno em curso e marca as concluídas.
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/view-announcement" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/megaphone.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">Comunicados</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Acompanha os avisos e informações importantes do MEG.
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/request-stock" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/box.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">Pedido de Stock</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Regista materiais em falta para reposição.
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/shift-report" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/noteicon.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">Notas do Turno</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Deixa observações para o próximo voluntário.
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <a href="/volunteer/manage-cat" style="text-decoration:none;">
                            <div class="panel h-100" style="cursor:pointer;">
                                <div style="font-size:1.5rem; margin-bottom:0.5rem;"><img src="/icons/cat.svg" width="20px" height="20px"/></div>
                                <div style="font-weight:600; font-size:1rem; margin-bottom:0.25rem;">Gatos</div>
                                <div style="color:#9ca3af; font-size:0.85rem;">
                                    Consulta a lista de gatos.
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>
</html>
