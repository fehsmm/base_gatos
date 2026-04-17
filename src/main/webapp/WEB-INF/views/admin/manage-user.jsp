<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gerir Utilizadores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>
<body>
<div class="admin-layout">

    <c:set var="activePage" value="manage-user" />
        <c:set var="dashboardUrl" value="/admin/" />
    <%@ include file="../fragments/adminSidebar.jsp" %>

<main class="admin-main">

    <div style="padding:1.5rem">
        <div class="mb-8">
            <h1 style="margin-bottom:.25rem">
                <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="black"><path d="M40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm720 0v-120q0-44-24.5-84.5T666-434q51 6 96 20.5t84 35.5q36 20 55 44.5t19 53.5v120H760ZM247-527q-47-47-47-113t47-113q47-47 113-47t113 47q47 47 47 113t-47 113q-47 47-113 47t-113-47Zm466 0q-47 47-113 47-11 0-28-2.5t-28-5.5q27-32 41.5-71t14.5-81q0-42-14.5-81T544-792q14-5 28-6.5t28-1.5q66 0 113 47t47 113q0 66-47 113ZM120-240h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm296.5-343.5Q440-607 440-640t-23.5-56.5Q393-720 360-720t-56.5 23.5Q280-673 280-640t23.5 56.5Q327-560 360-560t56.5-23.5ZM360-240Zm0-400Z"/></svg>
                Gestão de Utilizadores
            </h1>
            <p>Gestão de utilizadores e voluntários do abrigo</p>

        </div>

        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <c:if test="${pendingUsersCount > 0}">
            <div style="display:flex;gap:1rem;flex-wrap:wrap">

                <c:if test="${pendingUsersCount > 0}">
                    <c:choose>
                        <c:when test="${pendingUsersCount == 1}">
                            <div class="alert alert-warning" style="flex:1;min-width:200px">
                                <strong>${pendingUsersCount} conta pendente de aprovação</strong>
                            </div>
                        </c:when>
                        <c:when test="${pendingUsersCount > 1}">
                            <div class="alert alert-warning" style="flex:1;min-width:200px">
                                <strong>${pendingUsersCount} contas pendentes de aprovação</strong>
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>

            </div>
        </c:if>

        <div>
            <h3>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                Filtrar Candidaturas
            </h3>
        </div>

        <form method="GET" action="/admin/manage-user" style="display:flex; gap:1rem; margin-bottom:1rem; align-items:flex-end; width:100%;">

            <div style="display:flex; flex-direction:column; flex: 1">
                <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                    Nome do Utilizador
                </label>
                <input type="text" name="nameFilter" id="nameFilter" class="form-control" placeholder="Nome do utilizador"
                       value="${param.nameFilter}">
            </div>

            <div style="display:flex; flex-direction:column; flex: 1">
                <label style="font-size:0.75rem; color:#6b7280; margin-bottom:0.25rem;">
                    Tipo de Conta
                </label>
                <select name="roleFilter" id="roleFilter" class="form-control">
                    <option value="">Todas as contas</option>
                    <option value="admin">Administrador</option>
                    <option value="volunteer">Voluntário</option>
                    <option value="adopter">Adotante</option>
                </select>
            </div>

            <div style="display:flex; align-items:center; height:38px;">
                <label style="display:flex; align-items:center; gap:.5rem; margin:0; white-space:nowrap; font-size:0.95rem;">
                    <input type="checkbox" name="pendingFilter" id="pendingFilter" value="true"
                    ${param.pendingFilter == 'true' ? 'checked' : ''}>
                    Pendentes
                </label>
            </div>

            <button type="submit" class="btn btn-primary">Filtrar</button>
            <a href="/admin/manage-user" class="btn btn-secondary">Limpar</a>

        </form>

    </div>

</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>