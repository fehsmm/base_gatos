<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contacto | Meg</title>
    <link rel="stylesheet" href="/styles/Public/contact.css"/></head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

<main class="flex-1 page">
    <div class="container-sm">
        <div class="text-center mb-8">
            <h1>Entre em Contacto</h1>
            <p>Tem alguma questão ou quer saber mais sobre o nosso trabalho? Adoramos ouvir de si!</p>
        </div>

        <c:if test="${success != null}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <div class="grid contact-grid" style="gap:2rem">
            <!-- FORM -->
            <div class="card">
                <div class="card-header"><strong> Envie-nos uma Mensagem</strong></div>
                <div class="card-body">
                    <form action="/public/contact" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="grid grid-2" style="gap:1rem">
                            <div class="form-group"><label>Nome *</label><input type="text" name="name" required placeholder="O seu nome"/></div>
                            <div class="form-group"><label>Email *</label><input type="email" name="email" required placeholder="seu@email.com"/></div>
                        </div>
                        <div class="form-group"><label>Assunto *</label><input type="text" name="subject" required placeholder="Sobre o que quer falar?"/></div>
                        <div class="form-group"><label>Mensagem *</label><textarea name="message" rows="6" required placeholder="Escreva a sua mensagem aqui..."></textarea></div>
                        <button type="submit" class="btn btn-primary btn-lg w-full"> Enviar Mensagem</button>
                    </form>
                </div>
            </div>

            <!-- INFO -->
            <div style="display:flex;flex-direction:column;gap:1rem">
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M16 1H8C6.34 1 5 2.34 5 4v16c0 1.66 1.34 3 3 3h8c1.66 0 3-1.34 3-3V4c0-1.66-1.34-3-3-3zm1 17H7V4h10v14zm-3 3h-4v-1h4v1z"/></svg></div>
                    <div><h3>Telefone</h3><a href="tel:+351912345678" style="color:#f97316;font-size:.875rem">+351 912 345 678</a></div>
                </div></div>
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#eff6ff;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg></div>
                    <div><h3>Email</h3><a href="mailto:info@abrigofelino.pt" style="color:#f97316;font-size:.875rem">info@abrigofelino.pt</a></div>
                </div></div>
                <div class="card">
                    <div class="card-body" style="display:flex;gap:.75rem">
                        <div style="width:2.5rem;height:2.5rem;background:#f0fdf4;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 12c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm6-1.8C18 6.57 15.35 4 12 4s-6 2.57-6 6.2c0 2.34 1.95 5.44 6 9.14 4.05-3.7 6-6.8 6-9.14zM12 2c4.2 0 8 3.22 8 8.2 0 3.32-2.67 7.25-8 11.8-5.33-4.55-8-8.48-8-11.8C4 5.22 7.8 2 12 2z"/></svg></div>
                    <div><h3>Morada</h3><p class="text-sm">Rua dos Gatos, 123<br/>1000-001 Lisboa, Portugal</p></div>
                </div></div>
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#faf5ff;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/></svg></div>
                    <div><h3>Horário</h3><p class="text-sm">Ter-Dom: 10h00 - 18h00<br/>Segunda: Encerrado</p></div>
                </div></div>
            </div>
        </div>

        <!-- FAQ -->
        <div class="mt-8">
            <h2 class="text-center mb-6">Perguntas Frequentes</h2>
            <div class="grid grid-2" style="gap:1rem">
                <div class="card"><div class="card-body"><h3>Posso visitar os gatos sem compromisso?</h3><p class="text-sm">Sim! Encorajamos visitas para conhecer os nossos gatos. Não há qualquer obrigação de adoção.</p></div></div>
                <div class="card"><div class="card-body"><h3>Como posso tornar-me voluntário?</h3><p class="text-sm">Entre em contacto connosco através do formulário ou email. Teremos todo o gosto em explicar o processo.</p></div></div>
                <div class="card"><div class="card-body"><h3>Aceitam gatos para o abrigo?</h3><p class="text-sm">Dependendo da nossa capacidade atual. Contacte-nos para discutir a situação e encontrarmos a melhor solução.</p></div></div>
                <div class="card"><div class="card-body"><h3>Quanto custa adotar um gato?</h3><p class="text-sm">Pedimos um contributo simbólico de €50 que cobre parte dos custos veterinários. O gato é entregue vacinado, desparasitado e esterilizado.</p></div></div>
            </div>
        </div>

            <!-- CTA -->
            <div class="bg-orange-50 text-center">
                <h3>Não encontrou a sua resposta?</h3>
                <p style="margin-bottom:1rem">Entre em contacto connosco e teremos todo o gosto em ajudar.</p>
                <button class="contact-btn" onclick="window.scrollTo({ top: 0, behavior: 'smooth' })">
                    ⬆ Contactar
                </button>
            </div>
        </div>

    </div>
</main>
<%@ include file="footer.jsp" %>

</body>
</html>
