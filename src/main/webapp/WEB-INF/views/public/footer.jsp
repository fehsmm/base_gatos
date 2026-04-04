<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Base de Gatos</title>
    <link rel="stylesheet" href="/styles/Public/footer.css">
</head>
<body>

<footer>
    <footer class="footer"><div class="container">
        <div class="grid grid-3" style="gap:2rem">
            <div><div class="logo" style="color:white;margin-bottom:1rem">
                <div class="logo-icon"><img src="/images/logo.svg" alt="Logo MEG" class="logo-icon"></div><span>Meg</span></div><p style="color:#9ca3af;font-size:.875rem">Dedicados a cuidar e encontrar lares amorosos para gatos abandonados.</p></div>
            <div><h3>Links Rápidos</h3><ul class="footer-links"><li><a href="/public/cat-list">Gatos para Adoção</a></li>
                <li><a href="/public/adoption">Processo de Adoção</a></li>
                <li><a href="/public/donate">Fazer Donativo</a></li>
                <li><a href="/public/contact">Contactar-nos</a></li>
                <li><a href="/public/home">Página inicial</a></li>
            </ul></div>

            <div><h3>Contacto</h3><ul class="footer-links"><li>info@abrigofelino.pt</li><li>+351 912 345 678</li><li>Lisboa, Portugal</li></ul></div>
        </div>
        <button class="top-btn" onclick="window.scrollTo({ top: 0, behavior: 'smooth' })">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M160-760v-80h640v80H160Zm280 640v-408L336-424l-56-56 200-200 200 200-56 56-104-104v408h-80Z"/></svg>
        </button>
        <div class="footer-bottom">© 2026 Meg. Todos os direitos reservados.</div>
    </div></footer>
</footer>

</body>
</html>