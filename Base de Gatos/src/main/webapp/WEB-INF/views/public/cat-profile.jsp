<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${cat.name} | Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="layout.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <a href="/gatos" class="btn btn-ghost btn-sm mb-6">← Voltar à Lista</a>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:2rem;align-items:start">
            <!-- IMAGE -->
            <div style="position:relative">
                <img src="${cat.imageUrl}" alt="${cat.name}"
                     style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:.75rem"/>
                <c:choose>
                    <c:when test="${cat.adoptionStatus == 'Disponível'}"><span class="badge badge-green" style="position:absolute;top:1rem;right:1rem">${cat.adoptionStatus}</span></c:when>
                    <c:when test="${cat.adoptionStatus == 'Em Processo'}"><span class="badge badge-yellow" style="position:absolute;top:1rem;right:1rem">${cat.adoptionStatus}</span></c:when>
                    <c:otherwise><span class="badge badge-gray" style="position:absolute;top:1rem;right:1rem">${cat.adoptionStatus}</span></c:otherwise>
                </c:choose>
            </div>

            <!-- DETAILS -->
            <div>
                <h1>${cat.name}</h1>
                <div style="display:flex;flex-wrap:wrap;gap:.5rem;margin-bottom:1.5rem">
                    <c:forEach items="${cat.personality}" var="trait">
                        <span class="badge badge-outline">${trait}</span>
                    </c:forEach>
                </div>

                <!-- Basic Info -->
                <div class="card mb-4">
                    <div class="card-header"><strong> Informação Básica</strong></div>
                    <div class="card-body">
                        <table style="width:100%">
                            <tr><td style="color:#6b7280;padding:.4rem 0">Idade:</td><td style="text-align:right;font-weight:500">${formattedAge}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Género:</td><td style="text-align:right;font-weight:500">${cat.gender}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Raça:</td><td style="text-align:right;font-weight:500">${cat.breed}</td></tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Estado:</td>
                                <td style="text-align:right">
                                    <c:choose>
                                        <c:when test="${cat.adoptionStatus == 'Disponível'}"><span class="badge badge-green">${cat.adoptionStatus}</span></c:when>
                                        <c:when test="${cat.adoptionStatus == 'Em Processo'}"><span class="badge badge-yellow">${cat.adoptionStatus}</span></c:when>
                                        <c:otherwise><span class="badge badge-gray">${cat.adoptionStatus}</span></c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr><td style="color:#6b7280;padding:.4rem 0">Data de Chegada:</td><td style="text-align:right;font-weight:500">${cat.arrivalDate}</td></tr>
                        </table>
                    </div>
                </div>

                <!-- About -->
                <div class="card mb-4">
                    <div class="card-header"><strong>✨ Sobre ${cat.name}</strong></div>
                    <div class="card-body"><p>${cat.description}</p></div>
                </div>

                <!-- Health -->
                <div class="card mb-4">
                    <div class="card-header"><strong> Saúde</strong></div>
                    <div class="card-body"><p>${cat.healthInfo}</p></div>
                </div>

                <!-- CTA based on status -->
                <c:if test="${cat.adoptionStatus == 'Disponível'}">
                    <div class="bg-orange-50 mb-4">
                        <h3>Interessado em adotar ${cat.name}?</h3>
                        <p style="margin-bottom:1rem">Preencha o formulário de candidatura e a nossa equipa entrará em contacto consigo.</p>
                        <a href="/adocao" class="btn btn-primary">Candidatar-me à Adoção</a>
                    </div>
                </c:if>
                <c:if test="${cat.adoptionStatus == 'Em Processo'}">
                    <div class="bg-yellow-50 mb-4">
                        <h3>Processo de Adoção em Curso</h3>
                        <p>${cat.name} está atualmente em processo de adoção. Explore outros gatos disponíveis.</p>
                    </div>
                </c:if>
                <c:if test="${cat.adoptionStatus == 'Adotado'}">
                    <div class="bg-gray-50 mb-4">
                        <h3>Adotado com Sucesso! 🎉</h3>
                        <p>${cat.name} já encontrou o seu lar para sempre. Estamos muito felizes!</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="container"><div class="footer-bottom">© 2026 Meg. Todos os direitos reservados.</div></div>
</footer>
</body>
</html>
