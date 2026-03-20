<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="layout.jsp" %>

<main class="flex-1">
    <section class="hero"><div class="container">
        <h1>Juntos Salvamos Vidas Felinas 🐾</h1>
        <p>Dê um lar amoroso a um gato que precisa. Cada adoção é uma segunda chance para uma vida feliz.</p>
        <div class="hero-btns">
            <a href="/gatos" class="btn btn-white btn-lg">Ver Gatos Disponíveis →</a>
            <a href="/donativos" class="btn btn-outline btn-lg" style="border-color:white;color:white">Fazer Donativo</a>
        </div>
    </div></section>

    <section style="background:white;padding:3rem 1.5rem"><div class="container">
        <div class="grid grid-4" style="gap:1.5rem">
            <div class="stat-card"><div class="stat-icon" style="background:#fff7ed"></div><div class="stat-value">150+</div><div class="stat-label">Gatos Resgatados</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#f0fdf4"></div><div class="stat-value">98</div><div class="stat-label">Adoções Realizadas</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#eff6ff"></div><div class="stat-value">25</div><div class="stat-label">Voluntários Ativos</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#faf5ff"></div><div class="stat-value">8</div><div class="stat-label">Anos de Atividade</div></div>
        </div>
    </div></section>

    <section style="padding:4rem 1.5rem;background:white"><div class="container">
        <div class="text-center mb-8"><h2 style="font-size:2rem">Conheça Alguns dos Nossos Gatos</h2><p>Estes adoráveis felinos estão à espera do seu lar para sempre</p></div>
        <div class="grid grid-3" style="gap:1.5rem">
            <c:forEach items="${featuredCats}" var="cat">
                <div class="card cat-card">
                    <div class="cat-card-img-wrapper"><img src="${cat.imageUrl}" alt="${cat.name}" style="width:100%;aspect-ratio:1;object-fit:cover"/></div>
                    <div class="card-body">
                        <h3>${cat.name}</h3>
                        <p class="text-sm mb-4">${cat.formattedAge} • ${cat.gender} • ${cat.breed}</p>
                        <p class="mb-4 text-sm">${cat.description}</p>
                        <a href="/gatos/${cat.id}" class="btn btn-primary w-full">Ver Perfil</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-8"><a href="/gatos" class="btn btn-outline btn-lg">Ver Todos os Gatos →</a></div>
    </div></section>

    <section style="padding:4rem 1.5rem;background:linear-gradient(135deg,#f97316,#ec4899);color:white;text-align:center"><div class="container-sm">
        <h2 style="font-size:2rem;color:white">Como Pode Ajudar?</h2>
        <p style="color:#fde68a;font-size:1.1rem;margin-bottom:2rem">Há várias formas de apoiar o nosso trabalho</p>
        <div class="grid grid-3" style="gap:1rem">
            <a href="/adocao" class="btn btn-white btn-lg">️ Adotar</a>
            <a href="/donativos" class="btn btn-white btn-lg"> Doar</a>
            <a href="/contacto" class="btn btn-white btn-lg"> Voluntariar</a>
        </div>
    </div></section>
</main>

<footer class="footer"><div class="container">
    <div class="grid grid-3" style="gap:2rem">
        <div><div class="logo" style="color:white;margin-bottom:1rem"><div class="logo-icon"></div><span>Meg</span></div><p style="color:#9ca3af;font-size:.875rem">Dedicados a cuidar e encontrar lares amorosos para gatos abandonados.</p></div>
        <div><h3>Links Rápidos</h3><ul class="footer-links"><li><a href="/gatos">Gatos para Adoção</a></li><li><a href="/adocao">Processo de Adoção</a></li><li><a href="/donativos">Fazer Donativo</a></li><li><a href="/contacto">Contactar-nos</a></li></ul></div>
        <div><h3>Contacto</h3><ul class="footer-links"><li>info@abrigofelino.pt</li><li>+351 912 345 678</li><li>Lisboa, Portugal</li></ul></div>
    </div>
    <div class="footer-bottom">© 2026 Meg. Todos os direitos reservados.</div>
</div></footer>
</body>
</html>
