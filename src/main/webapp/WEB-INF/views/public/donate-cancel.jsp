<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Donativo Cancelado | Meg</title>
    <link rel="stylesheet" href="/styles/Public/donate.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="card mb-8" style="background:#fff7ed;border-color:#fed7aa">
            <div class="card-body text-center" style="padding:3rem 1.5rem">
                <div style="font-size:4rem;margin-bottom:1rem">😿</div>
                <h1 style="color:#c2410c;margin-bottom:1rem">Donativo Cancelado</h1>
                <p style="font-size:1.1rem;margin-bottom:2rem">
                    Não foi efetuado nenhum pagamento. Se mudou de ideia,
                    pode tentar novamente quando quiser — cada contribuição conta!
                </p>
                <a href="${pageContext.request.contextPath}/public/donate" class="btn btn-primary btn-lg">
                    Voltar aos Donativos
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>