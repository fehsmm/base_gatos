<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Obrigado! | Meg</title>
    <link rel="stylesheet" href="/styles/Public/donate.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="card mb-8" style="background:#f0fdf4;border-color:#bbf7d0">
            <div class="card-body text-center" style="padding:3rem 1.5rem">
                <div style="font-size:4rem;margin-bottom:1rem">🐱</div>
                <h1 style="color:#15803d;margin-bottom:1rem">Obrigado pelo seu donativo!</h1>
                <p style="font-size:1.1rem;margin-bottom:2rem">
                    O seu apoio faz uma diferença enorme na vida dos nossos gatos.
                    Graças a si, continuamos a salvar, cuidar e encontrar lares para eles.
                </p>

                <a href="${pageContext.request.contextPath}/public/home" class="btn btn-primary btn-lg">
                    Voltar à Página Inicial
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>