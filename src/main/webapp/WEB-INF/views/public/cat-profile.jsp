<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${cat.name} | Detalhes</title>
    <link rel="stylesheet" href="/styles/Public/cat-profile.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">

        <a href="/public/cat-list" class="btn btn-ghost btn-sm mb-6">← Voltar à Lista</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <c:choose>
            <c:when test="${prevId != null}">
                <a href="/public/cat-profile/${prevId}" class="btn btn-ghost btn-sm mb-6">← Anterior</a>
            </c:when>
            <c:otherwise>
                <span class="btn btn-ghost btn-sm mb-6" style="opacity:0.4;cursor:not-allowed">← Anterior</span>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${nextId != null}">
                <a href="/public/cat-profile/${nextId}" class="btn btn-ghost btn-sm mb-6">Próximo →</a>
            </c:when>
            <c:otherwise>
                <span class="btn btn-ghost btn-sm mb-6" style="opacity:0.4;cursor:not-allowed">Próximo →</span>
            </c:otherwise>
        </c:choose>

        <div class="profile-grid">

            <!-- RIGHT COLUMN -->
            <div class="profile-right">

                <div style="position:relative;margin-bottom:1.5rem">
                    <c:choose>
                        <c:when test="${not empty cat.image}">
                            <img src="/image/${cat.image}" alt="${cat.name}"
                                 style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:.75rem"/>
                        </c:when>
                        <c:otherwise>
                            <div style="width:100%;aspect-ratio:1;background:#e5e7eb;border-radius:.75rem;
                    display:flex;align-items:center;justify-content:center;">
                                <span style="font-size:4rem;">🐱</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
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



                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M300-840q52 0 99 22t81 62q34-40 81-62t99-22q94 0 157 63t63 157q0 5-.5 10t-.5 10h-80q1-5 1-10v-10q0-60-40-100t-100-40q-47 0-87 26.5T518-666h-76q-15-41-55-67.5T300-760q-60 0-100 40t-40 100v10q0 5 1 10H81q0-5-.5-10t-.5-10q0-94 63-157t157-63Zm-88 480h112q32 31 70 67t86 79q48-43 86-79t70-67h113q-38 42-90 91T538-158l-58 52-58-52q-69-62-120.5-111T212-360Zm230 40q13 0 22.5-7.5T478-347l54-163 35 52q5 8 14 13t19 5h320v-80H623l-69-102q-6-9-15.5-13.5T518-640q-13 0-22.5 7.5T482-613l-54 162-34-51q-5-8-14-13t-19-5H40v80h297l69 102q6 9 15.5 13.5T442-320Zm38-167Z"/></svg>
                        <strong>Saúde</strong>
                    </div>
                    <div class="card-body">
                        <div class="info-row">
                            <span class="info-label">Vacinação:</span>
                            <c:choose>
                                <c:when test="${cat.vaccination == true}"><span class="badge badge-green">Vacinado.</span></c:when>
                                <c:when test="${cat.vaccination == false}"><span class="badge badge-yellow">Não vacinado.</span></c:when>
                                <c:otherwise><span class="badge badge-gray">Sem informação.</span></c:otherwise>
                            </c:choose>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Esterilizado:</span>
                            <c:choose>
                                <c:when test="${cat.sterilization == true && cat.gender == true}"><span class="badge badge-green">Castrado.</span></c:when>
                                <c:when test="${cat.sterilization == true && cat.gender == false}"><span class="badge badge-green">Esterilizada.</span></c:when>
                                <c:when test="${cat.sterilization == false && cat.gender == true}"><span class="badge badge-yellow">Não castrado.</span></c:when>
                                <c:when test="${cat.sterilization == false && cat.gender == false}"><span class="badge badge-yellow">Não esterilizada.</span></c:when>
                                <c:otherwise><span class="badge badge-gray">Sem informação.</span></c:otherwise>
                            </c:choose>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Desparasitação:</span>
                            <c:choose>
                                <c:when test="${cat.parasiteControl == true}"><span class="badge badge-green">Desparasitado.</span></c:when>
                                <c:when test="${cat.parasiteControl == false}"><span class="badge badge-yellow">Não desparasitado.</span></c:when>
                                <c:otherwise><span class="badge badge-gray">Sem informação.</span></c:otherwise>
                            </c:choose>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Teste FIV:</span>
                            <c:choose>
                                <c:when test="${cat.fiv == false}"><span class="badge badge-green">Negativo.</span></c:when>
                                <c:when test="${cat.fiv == true}"><span class="badge badge-yellow">Positivo.</span></c:when>
                                <c:otherwise><span class="badge badge-gray">Não testado.</span></c:otherwise>
                            </c:choose>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Teste FELV:</span>
                            <c:choose>
                                <c:when test="${cat.felv == false}"><span class="badge badge-green">Negativo.</span></c:when>
                                <c:when test="${cat.felv == true}"><span class="badge badge-yellow">Positivo.</span></c:when>
                                <c:otherwise><span class="badge badge-gray">Não testado.</span></c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <div class="profile-left">

                <h1>${cat.name}</h1>
                    <div style="display:flex;flex-wrap:wrap;gap:.5rem;margin-bottom:1.5rem">
                        <c:if test="${not empty cat.tags}">
                            <c:forEach var="tag" items="${cat.tags}">
                                <span class="badge badge-outline">${tag}</span>
                            </c:forEach>
                        </c:if>
                    </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M440-280h80v-240h-80v240Zm68.5-331.5Q520-623 520-640t-11.5-28.5Q497-680 480-680t-28.5 11.5Q440-657 440-640t11.5 28.5Q463-600 480-600t28.5-11.5ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
                        <strong>Informação Básica</strong>
                    </div>
                    <div class="card-body">
                        <div class="info-row">
                            <span class="info-label">Idade:</span>
                            <span style="font-weight:500">${cat.estimatedAge}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Género:</span>
                            <span style="font-weight:500">${cat.gender ? 'Macho' : 'Fêmea'}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Raça:</span>
                            <span style="font-weight:500">${cat.breed}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Estado:</span>
                            <c:choose>
                                <c:when test="${cat.status == 'Disponível'}"><span class="badge badge-green">${cat.status}</span></c:when>
                                <c:when test="${cat.status == 'Em Processo'}"><span class="badge badge-yellow">${cat.status}</span></c:when>
                                <c:otherwise><span class="badge badge-gray">${cat.status}</span></c:otherwise>
                            </c:choose>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Data de Chegada:</span>
                            <span style="font-weight:500">${cat.formattedArrivalDate}</span>
                        </div>
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

            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
