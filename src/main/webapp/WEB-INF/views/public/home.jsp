<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Meg</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/styles/Public/home.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1">
    <section class="hero"><div class="container">
        <h1>Juntos Salvamos Vidas Felinas 🐾</h1>
        <p>Dê um lar amoroso a um gato que precisa. Cada adoção é uma segunda chance para uma vida feliz.</p>
        <div class="hero-btns">
            <a href="/public/cat-list" class="btn btn-hero">Ver Gatinhos →</a>
            <a href="/public/donate" class="btn btn-hero">Fazer Donativo</a>
            <a href="/public/contact" class="btn btn-hero">Quero ser Voluntário!</a>
        </div>
    </div></section>
    <section class="about-section">
        <div class="about-container">
            <div class="about-grid">
                <div class="about-text">
                    <h2 class="about-title">Sobre a Meg</h2>
                    <p class="about-paragraph">
                        Desde 2018, a Meg - Movimento Esterilização de Gatos de Lisboa -  dedica-se ao resgate, cuidado e reabilitação de gatos abandonados e maltratados. A nossa missão é proporcionar um ambiente seguro e amoroso enquanto procuramos o lar perfeito para cada felino.
                    </p>
                    <p class="about-paragraph">
                        Com uma equipa dedicada de voluntários e apoio da comunidade, já ajudámos centenas de gatos a encontrar famílias que os amem incondicionalmente.
                    </p>
                    <a href="/public/adoption" class="btn-about">Saiba Mais Sobre Adoção →</a>
                </div>

                <div class="about-cards">
                    <div class="about-card card-orange">
                        <span class="card-icon">🩺</span>
                        <h3>Cuidado Veterinário</h3>
                        <p>Todos os gatos são vacinados, esterilizados e tratados.</p>
                    </div>
                    <div class="about-card card-blue">
                        <span class="card-icon">📋</span>
                        <h3>Controle e cuidado</h3>
                        <p>Cada gatinho fica identificado em nosso sistema.</p>
                    </div>
                    <div class="about-card card-green">
                        <span class="card-icon">🤝</span>
                        <h3>Acompanhamento</h3>
                        <p>Apoio contínuo após a adoção para garantir o sucesso.</p>
                    </div>
                    <div class="about-card card-purple">
                        <span class="card-icon">❤️</span>
                        <h3>Dedicação</h3>
                        <p>Voluntários comprometidos com respeito e amor pelos bichanos.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

   <%-- <section style="background:white;padding:3rem 1.5rem"><div class="container">
        <div class="grid grid-4" style="gap:1.5rem">
            <div class="stat-card"><div class="stat-icon" style="background:#fff7ed"></div><div class="stat-value">150+</div><div class="stat-label">Gatos Resgatados</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#f0fdf4"></div><div class="stat-value">98</div><div class="stat-label">Adoções Realizadas</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#eff6ff"></div><div class="stat-value">25</div><div class="stat-label">Voluntários Ativos</div></div>
            <div class="stat-card"><div class="stat-icon" style="background:#faf5ff"></div><div class="stat-value">8</div><div class="stat-label">Anos de Atividade</div></div>
        </div>
    </div></section>--%>

    <section style="padding:4rem 1.5rem;background:white"><div class="container">
        <div class="text-center mb-8"><h2 style="font-size:2rem">Conheça o seu próximo gatinho!</h2><p>Estes fofinhos estão à espera de um lar.</p></div>
        <img src="/images/cat-smile.gif" class="cat_gif" alt="cat gif">
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
        <div class="text-center mt-8"><a href="/public/cat-list" class="btn btn-outline btn-lg">Ver Todos os Gatos →</a></div>
    </div></section>

    <section style="padding:4rem 1.5rem;background: linear-gradient(135deg, #f97316, #ea580c);;color:white;text-align:center"><div class="container-sm">
        <h2 style="font-size:2rem;color:white">Como Pode Ajudar?</h2>
        <p style="color:#fde68a;font-size:1.1rem;margin-bottom:2rem">Há várias formas de apoiar o nosso trabalho</p>
        <div class="grid grid-3" style="gap:1rem"  >
            <a href="/public/adoption" class="btn btn-white btn-lg w-full">️ Adotar</a>
            <a href="/public/donate" class="btn btn-white btn-lg w-full"> Doar</a>
            <a href="/public/contact" class="btn btn-white btn-lg w-full"> Voluntariar</a>
        </div>
    </div></section>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
