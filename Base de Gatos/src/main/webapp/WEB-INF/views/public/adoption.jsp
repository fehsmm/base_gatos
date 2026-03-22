<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Processo de Adoção | Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="text-center mb-8">
            <h1>Processo de Adoção</h1>
            <p>Dar um lar a um gato é um compromisso maravilhoso. Saiba como funciona o nosso processo.</p>
        </div>


        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>


        <h2 class="text-center mb-6">Como Funciona</h2>
        <div class="grid grid-2" style="gap:1rem;margin-bottom:2rem">
            <div class="card"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem">️</div>
                <div><h3>1. Escolha um Gato</h3><p class="text-sm">Navegue pelos nossos gatos disponíveis e encontre aquele que toca o seu coração.</p></div>
            </div></div>
            <div class="card"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
                <div><h3>2. Preencha o Formulário</h3><p class="text-sm">Complete o formulário de candidatura com as suas informações e motivações.</p></div>
            </div></div>
            <div class="card"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
                <div><h3>3. Entrevista e Visita</h3><p class="text-sm">A nossa equipa entrará em contacto para uma entrevista e visita ao abrigo.</p></div>
            </div></div>
            <div class="card"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
                <div><h3>4. Leve para Casa</h3><p class="text-sm">Após aprovação, pode levar o seu novo amigo felino para casa!</p></div>
            </div></div>
        </div>

        <!-- REQUIREMENTS -->
        <div class="card mb-6">
            <div class="card-header"><strong>✅ Requisitos para Adoção</strong></div>
            <div class="card-body">
                <div class="grid grid-2" style="gap:.5rem">
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Ser maior de 18 anos</span></div>
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Ter condições adequadas para acolher um gato</span></div>
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Disponibilidade para cuidar do animal</span></div>
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Compromisso de longo prazo</span></div>
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Aceitar visitas de acompanhamento</span></div>
                    <div style="display:flex;gap:.5rem;align-items:flex-start"><span style="color:#16a34a">✔</span><span>Consentir com esterilização (se aplicável)</span></div>
                </div>
            </div>
        </div>


        <div class="card mb-6">
            <div class="card-header"><strong> Formulário de Candidatura</strong></div>
            <div class="card-body">
                <form action="/adocao" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="form-group">
                        <label>Gato Pretendido *</label>
                        <select name="catId" required>
                            <option value="">Selecione um gato</option>
                            <option value="any">Qualquer gato disponível</option>
                            <c:forEach items="${availableCats}" var="cat">
                                <option value="${cat.id}">${cat.name} - ${cat.breed}, ${cat.formattedAge}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="grid grid-2" style="gap:1rem">
                        <div class="form-group">
                            <label>Nome Completo *</label>
                            <input type="text" name="applicantName" required placeholder="O seu nome"/>
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                            <input type="email" name="email" required placeholder="seu@email.com"/>
                        </div>
                    </div>

                    <div class="grid grid-2" style="gap:1rem">
                        <div class="form-group">
                            <label>Telefone *</label>
                            <input type="tel" name="phone" required placeholder="912 345 678"/>
                        </div>
                        <div class="form-group">
                            <label>Morada *</label>
                            <input type="text" name="address" required placeholder="Cidade, Concelho"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Porque quer adotar um gato? *</label>
                        <textarea name="reason" rows="4" required placeholder="Conte-nos sobre as suas motivações..."></textarea>
                    </div>

                    <div class="form-group">
                        <label>Experiência com Gatos</label>
                        <textarea name="experience" rows="3" placeholder="Já teve gatos antes? Fale-nos sobre a sua experiência..."></textarea>
                    </div>

                    <div class="bg-blue-50 mb-4">
                        <p class="text-sm">Ao enviar este formulário, você concorda que a nossa equipa entre em contacto consigo e que possamos realizar uma visita domiciliária como parte do processo de adoção.</p>
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg w-full">Enviar Candidatura</button>
                </form>
            </div>
        </div>

        <div class="bg-orange-50">
            <h3>Precisa de Ajuda?</h3>
            <p style="margin-bottom:.5rem">Se tiver dúvidas sobre o processo de adoção, não hesite em contactar-nos.</p>
            <p>Email: <a href="mailto:adocoes@abrigofelino.pt" style="color:#f97316">adocoes@abrigofelino.pt</a> &nbsp;|&nbsp;
                Telefone: <a href="tel:+351912345678" style="color:#f97316">+351 912 345 678</a></p>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>