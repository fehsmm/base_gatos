<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gatos Disponíveis | Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="layout.jsp" %>

<main class="flex-1 page">
    <div class="container">
        <div class="mb-8">
            <h1>Gatos Disponíveis para Adoção</h1>
            <p>Conheça os nossos adoráveis gatos que estão à procura de um lar amoroso</p>
        </div>

        <!-- FILTERS -->
        <form action="/gatos" method="get" style="display:flex;gap:1rem;margin-bottom:2rem;flex-wrap:wrap">
            <div style="flex:1;min-width:200px">
                <label>Estado de Adoção</label>
                <select name="status" onchange="this.form.submit()">
                    <option value="all" ${selectedStatus == 'all' ? 'selected' : ''}>Todos</option>
                    <option value="Disponível" ${selectedStatus == 'Disponível' ? 'selected' : ''}>Disponível</option>
                    <option value="Em Processo" ${selectedStatus == 'Em Processo' ? 'selected' : ''}>Em Processo</option>
                    <option value="Adotado" ${selectedStatus == 'Adotado' ? 'selected' : ''}>Adotado</option>
                </select>
            </div>
            <div style="flex:1;min-width:200px">
                <label>Género</label>
                <select name="gender" onchange="this.form.submit()">
                    <option value="all" ${selectedGender == 'all' ? 'selected' : ''}>Todos</option>
                    <option value="Macho" ${selectedGender == 'Macho' ? 'selected' : ''}>Macho</option>
                    <option value="Fêmea" ${selectedGender == 'Fêmea' ? 'selected' : ''}>Fêmea</option>
                </select>
            </div>
        </form>

        <p class="mb-6 text-gray">
            ${totalResults}
            <c:choose>
                <c:when test="${totalResults == 1}"> gato encontrado</c:when>
                <c:otherwise> gatos encontrados</c:otherwise>
            </c:choose>
        </p>

        <!-- CATS GRID -->
        <c:if test="${not empty cats}">
            <div class="grid grid-3" style="gap:1.5rem">
                <c:forEach items="${cats}" var="cat">
                    <div class="card cat-card">
                        <div class="cat-card-img-wrapper" style="position:relative;overflow:hidden">
                            <img src="${cat.imageUrl}" alt="${cat.name}" style="width:100%;aspect-ratio:1;object-fit:cover;transition:transform .3s"/>
                            <div class="cat-card-badge">
                                <c:choose>
                                    <c:when test="${cat.adoptionStatus == 'Disponível'}"><span class="badge badge-green">${cat.adoptionStatus}</span></c:when>
                                    <c:when test="${cat.adoptionStatus == 'Em Processo'}"><span class="badge badge-yellow">${cat.adoptionStatus}</span></c:when>
                                    <c:otherwise><span class="badge badge-gray">${cat.adoptionStatus}</span></c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="card-body">
                            <h3>${cat.name}</h3>
                            <p class="text-sm mb-4">
                                ${cat.formattedAge}
                                • ${cat.gender}
                                <br/>${cat.breed}
                            </p>
                            <p class="mb-4 text-sm">
                                <c:choose>
                                    <c:when test="${fn:length(cat.description) > 100}">${fn:substring(cat.description, 0, 97)}...</c:when>
                                    <c:otherwise>${cat.description}</c:otherwise>
                                </c:choose>
                            </p>
                            <div style="display:flex;flex-wrap:wrap;gap:.5rem;margin-bottom:1rem">
                                <c:forEach items="${cat.personality}" var="trait">
                                    <span class="badge badge-outline">${trait}</span>
                                </c:forEach>
                            </div>
                            <a href="/gatos/${cat.id}" class="btn btn-primary w-full">Ver Perfil Completo</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty cats}">
            <div class="text-center" style="padding:3rem 0">
                <p style="font-size:1.1rem; color:#9ca3af">Nenhum gato encontrado com os filtros selecionados.</p>
            </div>
        </c:if>
    </div>
</main>

<footer class="footer">
    <div class="container">
        <div class="grid grid-3" style="gap:2rem">
            <div>
                <div class="logo" style="color:white;margin-bottom:1rem"><div class="logo-icon">🐱</div><span>Meg</span></div>
                <p style="color:#9ca3af;font-size:.875rem">Dedicados a cuidar e encontrar lares amorosos para gatos abandonados.</p>
            </div>
            <div><h3>Links Rápidos</h3><ul class="footer-links"><li><a href="/gatos">Gatos para Adoção</a></li><li><a href="/adocao">Processo de Adoção</a></li><li><a href="/donativos">Fazer Donativo</a></li><li><a href="/contacto">Contactar-nos</a></li></ul></div>
            <div><h3>Contacto</h3><ul class="footer-links"><li>info@abrigofelino.pt</li><li>+351 912 345 678</li><li>Lisboa, Portugal</li></ul></div>
        </div>
        <div class="footer-bottom">© 2026 Meg. Todos os direitos reservados.</div>
    </div>
</footer>
</body>
</html>
