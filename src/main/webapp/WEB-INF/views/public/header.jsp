<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Base de Gatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/Public/header.css">
</head>
<body>

<header class="top-header">
    <div class="top-header-left">
        <img src="/images/logo.svg" alt="Logo MEG" class="top-logo">
        <div>
            <div class="top-title">Meg</div>
            <div class="top-subtitle">Movimento Esterilização de Gatos de Lisboa</div>
        </div>
    </div>

    <div class="top-header-right">
        <span>${user.username}</span>


    </div>
    <div><ul class="header-links"><li><a href="/public/home">Página Inicial</a></li>
        <li><a href="/public/adoption">Processo de Adoção</a></li>
        <li><a href="/public/donate">Fazer Donativo</a></li>
        <li><a href="/public/contact">Contactar-nos</a></li>
    </ul>
    </div>

</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>