<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Área do Adotante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="dashboard" />
        <c:set var="dashboardUrl" value="/adopter/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>
    <main class="admin-main">
    <div class="container">
        <div class="container-fluid p-4">


            <div class="mb-4">
                <h2 class="fw-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h320v-560H200v560Zm400 0h160v-240H600v240Zm0-320h160v-240H600v240Z"/></svg>
                    Bem-vindo(a), ${user.name}!
                </h2>
                <p class="text-muted">
                    Acompanhe os seus gatos adotados
                </p>
            </div>


            <div class="row g-4 mb-4">

                <div class="col-md-6">
                    <div class="card p-3 shadow-sm border-0 rounded-4">
                        <div class="d-flex align-items-center">

                            <div>
                                <h4 class="mb-0">${adoptions.size()}</h4>
                                <small class="text-muted">Gatos Adotados</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card p-3 shadow-sm border-0 rounded-4">
                        <div class="d-flex align-items-center">

                            <div>
                                <h4 class="mb-0">${reportCountByUser}</h4>
                                <small class="text-muted">Relatórios enviados</small>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

            </div>


            <div class="card border-warning bg-warning-subtle p-4 rounded-4 mb-4">
                <h5 class="fw-bold mb-2">
                    Relatório Mensal Pendente
                </h5>
                <p class="text-muted mb-3">
                    É hora de partilhar como estão os seus gatinhos!
                </p>

                <a href="/adopter/post-adoption" class="btn btn-primary">
                    Preencher Relatório
                </a>
            </div>


            <div class="card p-4 shadow-sm border-0 rounded-4 mb-4">

                <h5 class="fw-bold mb-3">Os Meus Gatos</h5>

                <div class="row g-3">

                    <c:forEach items="${adoptions}" var="adoption">

                        <div class="col-md-6">

                            <div class="d-flex align-items-center p-3 border rounded-4">

                                <c:choose>

                                    <c:when test="${not empty adoption.cat.image}">
                                        <img
                                                src="${pageContext.request.contextPath}/image/${adoption.cat.image}"
                                                style="width:80px; height:80px; object-fit:cover; border-radius:10px;"
                                                class="me-3">
                                    </c:when>

                                    <c:otherwise>
                                        <img
                                                src="${pageContext.request.contextPath}/images/default-cat.jpg"
                                                style="width:80px; height:80px; object-fit:cover; border-radius:10px;"
                                                class="me-3">
                                    </c:otherwise>

                                </c:choose>


                                <div>
                                    <h6 class="fw-bold mb-1">
                                            ${adoption.cat.name}
                                    </h6>

                                    <span class="badge bg-success-subtle text-success">
                                Adotado
                            </span>

                                    <p class="text-muted mb-0">
                                        Adotado em: ${adoption.adoptionDate}
                                    </p>

                                    <p class="text-muted mb-0">
                                        Próxima consulta: 01/06/2026
                                    </p>
                                </div>

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </div>


            <div class="card p-4 shadow-sm border-0 rounded-4">

                <h5 class="fw-bold mb-3">Ações Rápidas</h5>

                <div class="row">

                    <div class="col-md-6">
                        <a href="/adopter/adopted-cat-list" class="btn btn-primary w-100">
                            Ver Todos os Meus Gatos
                        </a>
                    </div>

                    <div class="col-md-6">
                        <a href="/adopter/post-adoption" class="btn btn-primary w-100">
                            Preencher Relatório
                        </a>
                    </div>

                </div>

            </div>

        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>