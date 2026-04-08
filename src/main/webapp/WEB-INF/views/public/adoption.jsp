<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Processo de Adoção | Meg</title>
    <link rel="stylesheet" href="/styles/Public/adoption.css"/>
</head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="text-center mb-8">
            <h1>Processo de Adoção</h1>
            <p>Dar um lar a um gato é um compromisso maravilhoso. Saiba como funciona o nosso processo.</p>
        </div>


        <c:if test="${not empty error}">
            <script>
                alert("${error}");
            </script>
        </c:if>
        <c:if test="${not empty success}">
            <script>
                alert("${success}");
            </script>
        </c:if>


        <h2 class="text-center mb-6">Como Funciona</h2>
        <div class="steps-grid">
            <div class="card step-1"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background: #fed7aa;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem">️<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M96,140a12,12,0,1,1-12-12A12,12,0,0,1,96,140Zm76-12a12,12,0,1,0,12,12A12,12,0,0,0,172,128Zm60-80v88c0,52.93-46.65,96-104,96S24,188.93,24,136V48A16,16,0,0,1,51.31,36.69c.14.14.26.27.38.41L69,57a111.22,111.22,0,0,1,118.1,0L204.31,37.1c.12-.14.24-.27.38-.41A16,16,0,0,1,232,48Zm-16,0-21.56,24.8A8,8,0,0,1,183.63,74,88.86,88.86,0,0,0,168,64.75V88a8,8,0,1,1-16,0V59.05a97.43,97.43,0,0,0-16-2.72V88a8,8,0,1,1-16,0V56.33a97.43,97.43,0,0,0-16,2.72V88a8,8,0,1,1-16,0V64.75A88.86,88.86,0,0,0,72.37,74a8,8,0,0,1-10.81-1.17L40,48v88c0,41.66,35.21,76,80,79.67V195.31l-13.66-13.66a8,8,0,0,1,11.32-11.31L128,180.68l10.34-10.34a8,8,0,0,1,11.32,11.31L136,195.31v20.36c44.79-3.69,80-38,80-79.67Z"></path></svg></div>
                <div><h3>1. Escolha um Gato</h3><p class="text-sm">Navegue pelos nossos gatos disponíveis e encontre aquele que toca o seu coração.</p></div>
            </div></div>
            <div class="card step-2"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#bfdbfe;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M227.32,73.37,182.63,28.69a16,16,0,0,0-22.63,0L36.69,152A15.86,15.86,0,0,0,32,163.31V208a16,16,0,0,0,16,16H216a8,8,0,0,0,0-16H115.32l112-112A16,16,0,0,0,227.32,73.37ZM136,75.31,152.69,92,68,176.69,51.31,160ZM48,208V179.31L76.69,208Zm48-3.31L79.32,188,164,103.31,180.69,120Zm96-96L147.32,64l24-24L216,84.69Z"></path></svg></div>
                <div><h3>2. Preencha o Formulário</h3><p class="text-sm">Complete o formulário de candidatura com as suas informações e motivações.</p></div>
            </div></div>
            <div class="card step-3"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#bbf7d0;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><g><rect fill="none" height="24" width="24"/></g><g><g/><g><circle cx="12" cy="4" r="2"/><path d="M15.89,8.11C15.5,7.72,14.83,7,13.53,7c-0.21,0-1.42,0-2.54,0C8.24,6.99,6,4.75,6,2H4c0,3.16,2.11,5.84,5,6.71V22h2v-6h2 v6h2V10.05L18.95,14l1.41-1.41L15.89,8.11z"/></g></g></svg></div>
                <div><h3>3. Entrevista e Visita</h3><p class="text-sm">A nossa equipa entrará em contacto para uma entrevista e visita ao abrigo.</p></div>
            </div></div>
            <div class="card step-4"><div class="card-body" style="display:flex;gap:1rem;align-items:flex-start">
                <div style="width:3rem;height:3rem;background:#e9d5ff;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
                <div><h3>4. Leve para Casa</h3><p class="text-sm">Após aprovação, pode levar o seu novo amigo felino para casa!</p></div>
            </div></div>
        </div>

        <c:if test="${empty pageContext.request.userPrincipal}">
            <div class="alert alert-warning text-center mb-4">
                ⚠️ Para submeter uma candidatura de adoção,
                precisa de ter uma conta.

                <div style="margin-top:10px;">
                    <a href="/auth/login" class="btn btn-primary btn-sm">Iniciar Sessão</a>
                    <a href="/auth/signup" class="btn btn-outline-secondary btn-sm">Criar Conta</a>
                </div>
            </div>
        </c:if>

        <!-- REQUIREMENTS -->
        <div class="card mb-6">
            <div class="card-header"><strong>✅ Requisitos para Adoção</strong></div>
            <div class="card-body">
                <div class="requirements-grid">
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
                <form action="/public/adoptions" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="form-group">
                        <label>Gato Pretendido *</label>
                        <select name="catId" required>
                            <option value="">Selecione um gato</option>
                            <option value="any">Qualquer gato disponível</option>
                            <c:forEach items="${availableCats}" var="cat">
                                <option value="${cat.id}">${cat.name} - ${cat.breed}, ${cat.estimatedAge}</option>
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
                        <label>Por que quer adotar um gato? *</label>
                        <textarea name="reason" rows="4" required placeholder="Conte-nos sobre as suas motivações..."></textarea>
                    </div>

                    <div class="form-group">
                        <label>Experiência com Gatos</label>
                        <textarea name="experience" rows="3" placeholder="Já teve gatos antes? Fale-nos sobre a sua experiência..."></textarea>
                    </div>

                    <div class="bg-blue-50 mb-4">
                        <p class="text-sm">Ao enviar este formulário, você concorda que a nossa equipa entre em contacto consigo e que possamos realizar uma visita domiciliária como parte do processo de adoção.</p>
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg w-full" onsubmit="return checkLogin()">Enviar Candidatura</button>
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

<script>
    function checkLogin() {

        var isLoggedIn = ${pageContext.request.userPrincipal != null ? 'true' : 'false'};

        if (!isLoggedIn) {
            alert("⚠️ Tem de iniciar sessão antes de submeter.");
            window.location.href = "/auth/login";
            return false;
        }

        return true;
    }
</script>

<%@ include file="footer.jsp" %>

</body>
</html>
