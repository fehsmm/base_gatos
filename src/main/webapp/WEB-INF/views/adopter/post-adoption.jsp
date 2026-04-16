<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Monitoramento Pós-Adoção</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="post-adoption" />
    <c:set var="dashboardUrl" value="/adopter/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

    <main class="container p-4">
        <div class="content">

            <h2>Relatório Pós-Adoção</h2>
            <p class="text-muted">Partilhe o progresso do seu gato connosco</p>

            <div class="row">

                <div class="col-md-7">

                    <div class="card card-custom p-4">

                        <h5>Novo Relatório</h5>

                        <form action="/adopter/reports" method="post">

                            <div class="mb-3">
                                <label>Selecione o Gato</label>
                                <select class="form-control" name="catId" required>
                                    <option disabled value="">Selecione o Gato</option>
                                    <c:forEach items="${cats}" var="cat">
                                        <option value="${cat.id}">${cat.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label>Estado Geral</label>
                                <select class="form-control" name="status" required>
                                    <option disabled value=''>Selecione o estado do gato</option>
                                    <option value='Excelente'>Excelente</option>
                                    <option value='Bom'>Bom</option>
                                    <option value='Normal'>Normal</option>
                                    <option value='Preocupante'>Preocupante</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label>Observações</label>
                                <textarea class="form-control" name="notes" placeholder="Ex: Tem brincado muito, já não tem medo do cão,..."></textarea>
                            </div>

                           <!-- <div class="mb-3">
                                <label>Problemas de Saúde</label>
                                <textarea class="form-control" name="health"></textarea>
                            </div>-->

                            <button class="btn btn-primary w-100">Enviar Relatório</button>
                        </form>

                    </div>

                </div>

                <div class="col-md-5">

                    <div class="card card-custom p-4">

                        <h5>Relatórios Anteriores</h5>

                        <c:forEach items="${reports}" var="report">

                            <div class="border rounded p-3 mb-3">

                                <div class="d-flex justify-content-between">
                                    <b>${report.cat.name}</b>
                                    <span class="text-muted">${report.date}</span>
                                </div>

                                <p>
                                        ${report.status}
                                </p>

                                <p class="mt-2">${report.notes}</p>

                            </div>

                        </c:forEach>

                        <c:if test="${not empty success}">
                            <div class="custom-alert success">
                                    ${success}
                            </div>
                            <!--Mostra alerta, espera 4 segundos e esconde...-->
                            <script>
                                setTimeout(() => {
                                    document.querySelector('.custom-alert').style.display = 'none';
                                }, 4000);
                            </script>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="custom-alert error">
                                    ${error}
                            </div>
                        </c:if>

                    </div>

                </div>

            </div>

        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>