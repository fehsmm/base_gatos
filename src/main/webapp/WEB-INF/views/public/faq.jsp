<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Perguntas Frequentes | Abrigo Felino</title>
    <link rel="stylesheet" href="/styles/global.css"/></head>
<body class="flex flex-col min-h-screen">
<header class="navbar"><div class="navbar-inner">
    <a href="/" class="logo"><div class="logo-icon"></div><span>Abrigo Felino</span></a>
    <nav class="nav-links hide-mobile">
        <a href="/" class="nav-link"> Início</a>
        <a href="/gatos" class="nav-link"> Gatos</a>
        <a href="/adocao" class="nav-link">❤ Adoção</a>
        <a href="/donativos" class="nav-link"> Donativos</a>
        <a href="/contacto" class="nav-link"> Contacto</a>
    </nav>
    <div class="nav-auth hide-mobile">
        <sec:authorize access="!isAuthenticated()">
            <a href="/login" class="btn btn-ghost btn-sm">Entrar</a>
            <a href="/register" class="btn btn-primary btn-sm">Registar</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <form action="/logout" method="post" style="display:inline">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-ghost btn-sm">Sair</button>
            </form>
        </sec:authorize>
    </div>
</div></header>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="text-center mb-8">
            <h1>Perguntas Frequentes</h1>
            <p>Encontre respostas às dúvidas mais comuns sobre o nosso abrigo, adoções e como pode ajudar.</p>
        </div>

        <!-- SECTION: Adoção -->
        <h2 class="mb-6">🐾 Adoção</h2>
        <div class="grid grid-1" style="gap:1rem;margin-bottom:2.5rem">
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 1 sobre adoção --></h3>
                <p class="text-sm"><!-- Resposta 1 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 2 sobre adoção --></h3>
                <p class="text-sm"><!-- Resposta 2 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 3 sobre adoção --></h3>
                <p class="text-sm"><!-- Resposta 3 --></p>
            </div></div>
        </div>

        <!-- SECTION: Abrigo -->
        <h2 class="mb-6"> O Abrigo</h2>
        <div class="grid grid-1" style="gap:1rem;margin-bottom:2.5rem">
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 1 sobre o abrigo --></h3>
                <p class="text-sm"><!-- Resposta 1 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 2 sobre o abrigo --></h3>
                <p class="text-sm"><!-- Resposta 2 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 3 sobre o abrigo --></h3>
                <p class="text-sm"><!-- Resposta 3 --></p>
            </div></div>
        </div>

        <!-- SECTION: Donativos e Voluntariado -->
        <h2 class="mb-6"> Donativos e Voluntariado</h2>
        <div class="grid grid-1" style="gap:1rem;margin-bottom:2.5rem">
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 1 sobre donativos/voluntariado --></h3>
                <p class="text-sm"><!-- Resposta 1 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 2 sobre donativos/voluntariado --></h3>
                <p class="text-sm"><!-- Resposta 2 --></p>
            </div></div>
            <div class="card"><div class="card-body">
                <h3><!-- Pergunta 3 sobre donativos/voluntariado --></h3>
                <p class="text-sm"><!-- Resposta 3 --></p>
            </div></div>
        </div>

        <!-- CTA -->
        <div class="bg-orange-50 text-center">
            <h3>Não encontrou a sua resposta?</h3>
            <p style="margin-bottom:1rem">Entre em contacto connosco e teremos todo o gosto em ajudar.</p>
            <a href="/contacto" class="btn btn-primary"> Contactar-nos</a>
        </div>
    </div>
</main>

<footer class="footer"><div class="container"><div class="footer-bottom">© 2026 Abrigo Felino. Todos os direitos reservados.</div></div></footer>
</body>
</html>
