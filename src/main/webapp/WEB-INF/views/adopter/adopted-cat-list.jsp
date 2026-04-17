<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Os Meus Gatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="adopted-cat-list" />
    <c:set var="dashboardUrl" value="/adopter/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>
    <main class="admin-main">
    <div class="container">
    <div class="container-fluid p-4">


        <div class="d-flex align-items-center mb-4">
                        <div>
                <h2 class="fw-bold mb-0">
                    <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M180-475q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29Zm109-189q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm240 0q-29-29-29-71t29-71q29-29 71-29t71 29q29 29 29 71t-29 71q-29 29-71 29t-71-29Zm251 189q-42 0-71-29t-29-71q0-42 29-71t71-29q42 0 71 29t29 71q0 42-29 71t-71 29ZM266-75q-45 0-75.5-34.5T160-191q0-52 35.5-91t70.5-77q29-31 50-67.5t50-68.5q22-26 51-43t63-17q34 0 63 16t51 42q28 32 49.5 69t50.5 69q35 38 70.5 77t35.5 91q0 47-30.5 81.5T694-75q-54 0-107-9t-107-9q-54 0-107 9t-107 9Z"/></svg>
                    Os Meus Gatos</h2>
                <small class="text-muted">
                    ${adoptions.size()} gatos adotados
                </small>
            </div>
        </div>


        <div class="row g-4">

            <c:forEach items="${adoptions}" var="adoption">

                <div class="col-md-6 col-lg-5">

                    <div class="card shadow-sm border-0 rounded-4 h-100">


                        <img
                                src="${adoption.cat.image != null ? adoption.cat.image: '/images/default-cat.jpg'}"
                                class="card-img-top rounded-top-4"
                                style="height: 250px; object-fit: cover;"
                        >


                        <div class="card-body">


                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="fw-bold mb-0">
                                        ${adoption.cat.name}
                                </h5>

                                <span class="badge bg-success px-3 py-2">
                                Adotado
                            </span>
                            </div>


                            <p class="text-muted mt-2 mb-1">
                                    ${adoption.cat.estimatedAge} anos • ${adoption.cat.breed}
                            </p>

                            <p class="text-muted mb-1">
                                <strong>Adotado em:</strong> ${adoption.adoptionDate}
                            </p>

                            <p class="text-muted">
                                <strong>Última consulta:</strong> 01/03/2026
                            </p>


                        </div>
                    </div>

                </div>

            </c:forEach>

        </div>

        <c:if test="${empty adoptions}">
            <div class="text-center mt-5">
                <p class="text-muted">Ainda não tens gatos adotados 🐾</p>
            </div>
        </c:if>

    </div>
</div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>