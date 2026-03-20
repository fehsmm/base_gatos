<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><title>Donativos | Meg</title><link rel="stylesheet" href="/styles/global.css"/></head>
<body class="flex flex-col min-h-screen">
<%@ include file="layout.jsp" %>

<main class="flex-1 page">
<div class="container-sm">
    <div class="text-center mb-8">
        <h1>Apoie o Nosso Trabalho </h1>
        <p>Os seus donativos ajudam-nos a continuar a salvar e cuidar de gatos necessitados</p>
    </div>

    <!-- IMPACT -->
    <h2 class="text-center mb-6">O Seu Impacto</h2>
    <div class="grid grid-2" style="gap:1rem;margin-bottom:2rem">
        <div class="card" style="background:#fff7ed;border-color:#fed7aa"><div class="card-body" style="display:flex;gap:1rem;align-items:center">
            <div style="font-size:1.5rem;font-weight:700;color:#f97316;min-width:3.5rem">10€</div>
            <p>Alimentação para 1 gato durante 1 semana</p>
        </div></div>
        <div class="card" style="background:#fff7ed;border-color:#fed7aa"><div class="card-body" style="display:flex;gap:1rem;align-items:center">
            <div style="font-size:1.5rem;font-weight:700;color:#f97316;min-width:3.5rem">25€</div>
            <p>Vacinas completas para 1 gato</p>
        </div></div>
        <div class="card" style="background:#fff7ed;border-color:#fed7aa"><div class="card-body" style="display:flex;gap:1rem;align-items:center">
            <div style="font-size:1.5rem;font-weight:700;color:#f97316;min-width:3.5rem">50€</div>
            <p>Esterilização de 1 gato</p>
        </div></div>
        <div class="card" style="background:#fff7ed;border-color:#fed7aa"><div class="card-body" style="display:flex;gap:1rem;align-items:center">
            <div style="font-size:1.5rem;font-weight:700;color:#f97316;min-width:3.5rem">100€</div>
            <p>Tratamento veterinário completo</p>
        </div></div>
    </div>

    <!-- DONATION FORM -->
    <div class="card mb-8">
        <div class="card-header"><strong> Fazer Donativo</strong></div>
        <div class="card-body">
            <form action="#" method="post" onsubmit="handleDonation(event)">
                <div class="form-group">
                    <label>Escolha um Valor</label>
                    <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:.75rem;margin-bottom:1rem">
                        <button type="button" onclick="selectAmount('10')" id="btn10" class="btn btn-outline" style="flex-direction:column;padding:1rem">
                            <span style="font-size:1.5rem;font-weight:700">€10</span>
                        </button>
                        <button type="button" onclick="selectAmount('25')" id="btn25" class="btn btn-outline" style="flex-direction:column;padding:1rem">
                            <span style="font-size:1.5rem;font-weight:700">€25</span>
                        </button>
                        <button type="button" onclick="selectAmount('50')" id="btn50" class="btn btn-outline" style="flex-direction:column;padding:1rem">
                            <span style="font-size:1.5rem;font-weight:700">€50</span>
                        </button>
                        <button type="button" onclick="selectAmount('100')" id="btn100" class="btn btn-outline" style="flex-direction:column;padding:1rem">
                            <span style="font-size:1.5rem;font-weight:700">€100</span>
                        </button>
                    </div>
                </div>
                <div class="form-group">
                    <label>Outro Valor</label>
                    <div style="position:relative">
                        <span style="position:absolute;left:.75rem;top:50%;transform:translateY(-50%);color:#6b7280">€</span>
                        <input type="number" id="customAmount" min="1" style="padding-left:2rem" placeholder="Digite um valor" oninput="clearPreset()"/>
                    </div>
                </div>
                <div class="form-group">
                    <label>Método de Pagamento</label>
                    <div style="display:flex;flex-direction:column;gap:.5rem">
                        <button type="button" class="btn btn-outline" style="justify-content:flex-start;gap:.75rem">💳 Cartão de Crédito/Débito</button>
                        <button type="button" class="btn btn-outline" style="justify-content:flex-start;gap:.75rem"> Transferência Bancária</button>
                    </div>
                </div>
                <button type="submit" id="donateBtn" class="btn btn-primary btn-lg w-full" disabled>Fazer Donativo</button>
            </form>
            <div id="donationSuccess" class="alert alert-success mt-4" style="display:none">Obrigado pelo seu donativo! Processando pagamento...</div>
        </div>
    </div>

    <!-- NEEDS -->
    <h2 class="text-center mb-6">Como Usamos os Donativos</h2>
    <div class="grid grid-2" style="gap:1rem;margin-bottom:2rem">
        <div class="card"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
            <div><h3>Alimentação</h3><p class="text-sm">Ração de qualidade para todos os gatos</p><p class="text-sm text-orange" style="font-weight:600">€500/mês</p></div>
        </div></div>
        <div class="card"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem">🩺</div>
            <div><h3>Cuidados Veterinários</h3><p class="text-sm">Consultas, vacinas e tratamentos</p><p class="text-sm text-orange" style="font-weight:600">€800/mês</p></div>
        </div></div>
        <div class="card"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
            <div><h3>Instalações</h3><p class="text-sm">Manutenção e limpeza do abrigo</p><p class="text-sm text-orange" style="font-weight:600">€300/mês</p></div>
        </div></div>
        <div class="card"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#fff7ed;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"></div>
            <div><h3>Equipamento</h3><p class="text-sm">Camas, brinquedos e acessórios</p><p class="text-sm text-orange" style="font-weight:600">€200/mês</p></div>
        </div></div>
    </div>

    <!-- BANK TRANSFER -->
    <div class="card">
        <div class="card-header"><strong>Outras Formas de Ajudar</strong></div>
        <div class="card-body">
            <h3>Transferência Bancária Direta</h3>
            <div class="bg-gray-50 mb-4">
                <p class="text-sm"><strong>IBAN:</strong> PT50 0000 0000 0000 0000 0000 0<br/>
                <strong>Titular:</strong> Meg<br/>
                <strong>NIF:</strong> 123456789</p>
            </div>
            <h3>Doações em Espécie</h3>
            <p class="text-sm mb-4">Também aceitamos doações de ração, areia para gatos, brinquedos, camas, mantas e outros itens essenciais. Contacte-nos para coordenar a entrega.</p>
            <h3>Voluntariado</h3>
            <p class="text-sm">O seu tempo também é valioso! Se prefere contribuir com o seu tempo e dedicação, considere tornar-se voluntário.</p>
        </div>
    </div>
</div>
</main>

<footer class="footer"><div class="container"><div class="footer-bottom">© 2026 Meg. Todos os direitos reservados.</div></div></footer>

<script>
let selectedAmount = '';
function selectAmount(val) {
    selectedAmount = val;
    document.getElementById('customAmount').value = '';
    ['10','25','50','100'].forEach(function(v) {
        var btn = document.getElementById('btn'+v);
        btn.style.borderColor = v === val ? '#f97316' : '';
        btn.style.background = v === val ? '#fff7ed' : '';
        btn.style.color = v === val ? '#c2410c' : '';
    });
    updateDonateBtn();
}
function clearPreset() {
    selectedAmount = '';
    ['10','25','50','100'].forEach(function(v) {
        var btn = document.getElementById('btn'+v);
        btn.style.borderColor = '';
        btn.style.background = '';
        btn.style.color = '';
    });
    updateDonateBtn();
}
function updateDonateBtn() {
    var custom = document.getElementById('customAmount').value;
    var amount = selectedAmount || custom;
    var btn = document.getElementById('donateBtn');
    btn.disabled = !amount;
    btn.textContent = amount ? 'Doar \u20AC' + amount : 'Fazer Donativo';
}
document.getElementById('customAmount').addEventListener('input', updateDonateBtn);
function handleDonation(e) {
    e.preventDefault();
    var custom = document.getElementById('customAmount').value;
    var amount = selectedAmount || custom;
    if (!amount) return;
    document.getElementById('donationSuccess').style.display = 'block';
    document.getElementById('donationSuccess').textContent = 'Obrigado pelo seu donativo de \u20AC' + amount + '! Processando pagamento...';
    selectedAmount = '';
    document.getElementById('customAmount').value = '';
    updateDonateBtn();
}
</script>
</body>
</html>
