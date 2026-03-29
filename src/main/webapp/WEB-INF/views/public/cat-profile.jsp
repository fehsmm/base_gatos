<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${cat.name} | Detalhes</title>

    <!--<link rel="stylesheet" href="/styles/Public/cat-profile.css"/>-->
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page" style="padding: 2rem 0;">
    <div class="container-sm" style="max-width: 900px; margin: 0 auto; padding: 0 1rem;">
        <a href="/public/cat-list" class="btn btn-ghost btn-sm mb-6" style="text-decoration: none; color: #6b7280;">Voltar à Lista</a>

        <div style="display:grid; grid-template-columns: 1fr 1fr; gap:2rem; align-items:start; margin-top: 1rem;">

            <div style="position:relative">
                <img src="${not empty cat.image ? cat.image : '/images/default-cat.png'}"
                     alt="${cat.name}"
                     style="width:100%; aspect-ratio:1; object-fit:cover; border-radius:.75rem; box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);"/>

                <div style="position:absolute; top:1rem; right:1rem">
                    <c:choose>
                        <c:when test="${cat.status == 'Disponível'}"><span class="badge badge-green">${cat.status}</span></c:when>
                        <c:when test="${cat.status == 'Em Processo'}"><span class="badge badge-yellow">${cat.status}</span></c:when>
                        <c:otherwise><span class="badge badge-gray">${cat.status}</span></c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div>
                <h1 style="font-size: 2.5rem; margin-bottom: 0.5rem;">${cat.name}</h1>

                <div style="display:flex; flex-wrap:wrap; gap:.5rem; margin-bottom:1.5rem">
                    <c:if test="${not empty cat.tags}">
                        <span class="badge badge-outline">${cat.tags}</span>
                    </c:if>
                </div>

                <!-- Informação Básica -->
                <div class="card mb-4" style="border: 1px solid #e5e7eb; border-radius: 0.5rem; overflow: hidden; margin-bottom: 1.5rem;">
                    <div class="card-header" style="background: #f9fafb; padding: 0.75rem 1rem; border-bottom: 1px solid #e5e7eb;">
                        <strong>Informação Básica</strong>
                    </div>
                    <div class="card-body" style="padding: 1rem;">
                        <table style="width:100%; border-collapse: collapse;">
                            <tr><td style="color:#6b7280; padding:.4rem 0">Idade:</td><td style="text-align:right; font-weight:500">${cat.estimatedAge}</td></tr>
                            <tr><td style="color:#6b7280; padding:.4rem 0">Género:</td><td style="text-align:right; font-weight:500">${cat.gender ? 'Macho' : 'Fêmea'}</td></tr>
                            <tr><td style="color:#6b7280; padding:.4rem 0">Raça/Pelagem:</td><td style="text-align:right; font-weight:500">${cat.breed}</td></tr>
                            <tr><td style="color:#6b7280; padding:.4rem 0">Data de Chegada:</td>
                                <td style="text-align:right; font-weight:500">
                                    <fmt:formatDate value="${cat.arrivalDate}" pattern="dd/MM/yyyy"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>


                <div class="card mb-4" style="border: 1px solid #e5e7eb; border-radius: 0.5rem; overflow: hidden; margin-bottom: 1.5rem;">
                    <div class="card-header" style="background: #f9fafb; padding: 0.75rem 1rem; border-bottom: 1px solid #e5e7eb;">
                        <strong>Saúde e Cuidados</strong>
                    </div>
                    <div class="card-body" style="padding: 1rem; display: grid; grid-template-columns: 1fr 1fr; gap: 0.5rem;">
                        <div style="font-size: 0.9rem;">FIV: <strong>${cat.fiv ? 'Positivo' : 'Negativo'}</strong></div>
                        <div style="font-size: 0.9rem;">FeLV: <strong>${cat.felv ? 'Positivo' : 'Negativo'}</strong></div>
                        <div style="font-size: 0.9rem;">Vacinação: <strong>${cat.vaccination ? 'Sim' : 'Não'}</strong></div>
                        <div style="font-size: 0.9rem;">Esterilizado: <strong>${cat.sterilization ? 'Sim' : 'Não'}</strong></div>
                    </div>
                </div>

                <div class="card mb-4" style="border: 1px solid #e5e7eb; border-radius: 0.5rem; overflow: hidden; margin-bottom: 1.5rem;">
                    <div class="card-header" style="background: #f9fafb; padding: 0.75rem 1rem; border-bottom: 1px solid #e5e7eb;">
                        <strong>✨ Sobre ${cat.name}</strong>
                    </div>
                    <div class="card-body" style="padding: 1rem;">
                        <p style="line-height: 1.6; color: #374151;">${cat.description}</p>
                    </div>
                </div>


                <c:if test="${cat.status == 'Disponível'}">
                    <div style="background: #fff7ed; padding: 1.5rem; border-radius: 0.75rem; border: 1px solid #fed7aa; text-align: center;">
                        <h3 style="margin-top: 0;">Interessado em adotar?</h3>
                        <p style="margin-bottom: 1rem; font-size: 0.9rem;">Preencha o formulário e a nossa equipa entrará em contacto.</p>
                        <a href="/public/adoption" class="btn btn-primary" style="display: block; text-decoration: none; padding: 0.75rem; border-radius: 0.5rem;">Candidatar-me à Adoção</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>
