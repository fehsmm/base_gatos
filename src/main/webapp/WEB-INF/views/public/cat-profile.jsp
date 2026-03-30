<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${cat.name} | Detalhes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles//Public/cat-profile.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">

    <div class="container-sm">

        <a href="/public/cat-list" class="btn btn-ghost btn-sm mb-6">← Voltar à Lista</a>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:2rem;align-items:start">

            <div style="position:relative">
                <img src="${cat.image}" alt="${cat.name}"
                     style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:.75rem"/>

                <c:choose>
                    <c:when test="${cat.status == 'Disponível'}">
                        <span class="badge badge-green" style="position:absolute;top:1rem;right:1rem">${cat.status}</span>
                    </c:when>
                    <c:when test="${cat.status == 'Em Processo'}">
                        <span class="badge badge-yellow" style="position:absolute;top:1rem;right:1rem">${cat.status}</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge badge-gray" style="position:absolute;top:1rem;right:1rem">${cat.status}</span>
                    </c:otherwise>
                </c:choose>
            </div>

            <div>
                <h1>${cat.name}</h1>
                <div style="display:flex;flex-wrap:wrap;gap:.5rem;margin-bottom:1.5rem">
                    <c:forEach items="${cat.tags}" var="trait">
                        <span class="badge badge-outline">${trait}</span>
                    </c:forEach>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M440-280h80v-240h-80v240Zm68.5-331.5Q520-623 520-640t-11.5-28.5Q497-680 480-680t-28.5 11.5Q440-657 440-640t11.5 28.5Q463-600 480-600t28.5-11.5ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
                        <strong>Informação Básica</strong>
                    </div>
                    <div class="card-body">
                        <table style="width:100%">
                            <tr><td style="color:#6b7280;padding:.4rem 0">Idade:</td>
                                <td style="text-align:right;font-weight:500">${cat.estimatedAge}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Género:</td>
                                <td style="text-align:right;font-weight:500">${cat.gender ? "Macho" : "Fêmea"}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Raça:</td>
                                <td style="text-align:right;font-weight:500">${cat.breed}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Estado:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.status == 'Disponível'}">
                                            <span class="badge badge-green">${cat.status}</span></c:when>
                                        <c:when test="${cat.status == 'Em Processo'}">
                                            <span class="badge badge-yellow">${cat.status}</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">${cat.status}</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Data de Chegada:</td>
                                <td style="text-align:right;font-weight:500">${cat.arrivalDate}</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="m354-287 126-76 126 77-33-144 111-96-146-13-58-136-58 135-146 13 111 97-33 143ZM233-120l65-281L80-590l288-25 112-265 112 265 288 25-218 189 65 281-247-149-247 149Zm457-560 21-89-71-59 94-8 36-84 36 84 94 8-71 59 21 89-80-47-80 47ZM480-481Z"/></svg>
                        <strong>Sobre ${cat.name}</strong>
                    </div>
                    <div class="card-body">
                        <p>${cat.description}</p>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M300-840q52 0 99 22t81 62q34-40 81-62t99-22q94 0 157 63t63 157q0 5-.5 10t-.5 10h-80q1-5 1-10v-10q0-60-40-100t-100-40q-47 0-87 26.5T518-666h-76q-15-41-55-67.5T300-760q-60 0-100 40t-40 100v10q0 5 1 10H81q0-5-.5-10t-.5-10q0-94 63-157t157-63Zm-88 480h112q32 31 70 67t86 79q48-43 86-79t70-67h113q-38 42-90 91T538-158l-58 52-58-52q-69-62-120.5-111T212-360Zm230 40q13 0 22.5-7.5T478-347l54-163 35 52q5 8 14 13t19 5h320v-80H623l-69-102q-6-9-15.5-13.5T518-640q-13 0-22.5 7.5T482-613l-54 162-34-51q-5-8-14-13t-19-5H40v80h297l69 102q6 9 15.5 13.5T442-320Zm38-167Z"/></svg>
                        <strong> Saúde</strong>
                    </div>
                    <div class="card-body">
                        <table style="width:100%">
                            <tr><td style="color:#6b7280;padding:.4rem 0">Vacinação:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.vaccination == true}">
                                            <span class="badge badge-green">Vacinado.</span></c:when>
                                        <c:when test="${cat.vaccination == false}">
                                            <span class="badge badge-yellow">Não vacinado.</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">Sem informação.</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Esterilizado:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.sterilization == true} && ${cat.gender == 'Macho' }">
                                            <span class="badge badge-green">Castrado.</span></c:when>
                                        <c:when test="${cat.sterilization == true} && ${cat.gender == 'Fêmea' }">
                                            <span class="badge badge-green">Esterilizada.</span></c:when>
                                        <c:when test="${cat.vaccination == false} && ${cat.gender == 'Macho'}">
                                            <span class="badge badge-yellow">Não castrado.</span></c:when>
                                        <c:when test="${cat.sterilization == false} && ${cat.gender == 'Fêmea' }">
                                            <span class="badge badge-green">Não esterilizada.</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">Sem informação.</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Teste FIV:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.fiv == false}">
                                            <span class="badge badge-green">Negativo.</span></c:when>
                                        <c:when test="${cat.fiv == true}">
                                            <span class="badge badge-yellow">Positivo.</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">Não testado.</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Teste FELV:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.felv == false}">
                                            <span class="badge badge-green">Negativo.</span></c:when>
                                        <c:when test="${cat.felv == true}">
                                            <span class="badge badge-yellow">Positivo.</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">Não testado.</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/></svg>                        <strong>Histórico Clínico</strong>
                    </div>
                    <div class="card-body">
                        <p>Última vacina, próxima vacina, exames, observações</p>
                    </div>
                </div>

                <c:if test="${cat.status == 'Disponível'}">
                    <div class="bg-orange-50 mb-4">
                        <h3>Interessado em adotar ${cat.name}?</h3>
                        <p style="margin-bottom:1rem">Preencha o formulário de candidatura e a nossa equipa entrará em contacto consigo.</p>
                        <a href="/public/adoption" class="btn btn-primary">Candidatar-me à Adoção!</a>
                    </div>
                </c:if>

                <c:if test="${cat.status == 'Em Processo'}">
                    <div class="bg-yellow-50 mb-4">
                        <h3>Processo de Adoção em Curso</h3>
                        <p>${cat.name} está atualmente em processo de adoção.</p>
                        <a href="/public/cat-list" class="btn btn-primary">Explore outros gatos disponíveis.</a>
                    </div>
                </c:if>

                <c:if test="${cat.status == 'Adotado'}">
                    <div class="bg-gray-50 mb-4">
                        <h3>Adotado com Sucesso! 🎉</h3>
                        <p>${cat.name} já encontrou o seu lar para sempre. Estamos muito felizes!</p>
                        <a href="/public/cat-list" class="btn btn-primary">Explore outros gatos disponíveis.</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
