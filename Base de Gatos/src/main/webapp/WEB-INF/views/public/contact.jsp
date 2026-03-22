<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contacto | Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/></head>
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

        <div style="display:grid;grid-template-columns:2fr 1fr;gap:2rem">
            <!-- FORM -->
            <div class="card">
                <div class="card-header"><strong> Envie-nos uma Mensagem</strong></div>
                <div class="card-body">
                    <form action="/contacto" method="post">
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
                    <div style="width:2.5rem;height:2.5rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0">📞</div>
                    <div><h3>Telefone</h3><a href="tel:+351912345678" style="color:#f97316;font-size:.875rem">+351 912 345 678</a></div>
                </div></div>
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0">️</div>
                    <div><h3>Email</h3><a href="mailto:info@abrigofelino.pt" style="color:#f97316;font-size:.875rem">info@abrigofelino.pt</a></div>
                </div></div>
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"></div>
                    <div><h3>Morada</h3><p class="text-sm">Rua dos Gatos, 123<br/>1000-001 Lisboa, Portugal</p></div>
                </div></div>
                <div class="card"><div class="card-body" style="display:flex;gap:.75rem">
                    <div style="width:2.5rem;height:2.5rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0"></div>
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

        <!-- Esta divisão é apenas para ficar como exemplo, o real será o que está abaixo,
        e deveremos colocar ainda as perguntas e respostas-->
        <div class="container-sm">
            <div class="text-center mb-8">
                <h1>Perguntas Frequentes</h1>
                <p>Encontre respostas às dúvidas mais comuns sobre o nosso abrigo, adoções e como pode ajudar.</p>
            </div>


            <!-- TODO!!!!-->

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
                <button onclick="window.scrollTo({ top: 0, behavior: 'smooth' })">
                    ⬆ Voltar ao topo
                </button>
            </div>
        </div>

    </div>
</main>
<%@ include file="footer.jsp" %>

</body>
</html>

