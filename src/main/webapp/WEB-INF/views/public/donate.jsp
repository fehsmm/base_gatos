<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/> <title>Donativos | Meg</title><link rel="stylesheet" href="/styles/Public/donate.css"/></head>
<body class="flex flex-col min-h-screen">
<%@ include file="header.jsp" %>

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
            <form action="${pageContext.request.contextPath}/donate/checkout" method="post" onsubmit="return handleDonation(event)">
                <input type="hidden" name="amount" id="amountInCents" value=""/>
                <div class="form-group">
                    <label>Escolha um Valor</label>
                    <div class="grid donation-amounts" style="gap:.75rem;margin-bottom:1rem">
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
                <!--<div class="form-group">
                    <label>Método de Pagamento</label>
                    <div style="display:flex;flex-direction:column;gap:.5rem">
                        <button type="button" class="btn btn-outline" style="justify-content:flex-start;gap:.75rem">💳 Cartão de Crédito/Débito</button>
                        <button type="button" class="btn btn-outline" style="justify-content:flex-start;gap:.75rem">🏦 Transferência Bancária</button>
                    </div>
                </div>-->
                <button type="submit" id="donateBtn" class="btn btn-primary btn-lg w-full" disabled>Fazer Donativo</button>
            </form>
            <div id="donationSuccess" class="alert alert-success mt-4" style="display:none">Obrigado pelo seu donativo! Processando pagamento...</div>
        </div>
    </div>

    <!-- NEEDS -->
    <h2 class="text-center mb-6">Como Usamos os Donativos</h2>
    <div class="grid grid-2" style="gap:1rem;margin-bottom:2rem">
        <div class="card" style="background-color: #fff7ed; border-color: #fed7aa; "><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background: #fed7aa;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M168,76a12,12,0,1,1-12-12A12,12,0,0,1,168,76Zm48.72,67.64c-19.37,34.9-55.44,53.76-107.24,56.1l-22,51.41A8,8,0,0,1,80.1,256l-.51,0a8,8,0,0,1-7.19-5.78L57.6,198.39,5.8,183.56a8,8,0,0,1-1-15.05l51.41-22c2.35-51.78,21.21-87.84,56.09-107.22,24.75-13.74,52.74-15.84,71.88-15.18,18.64.64,36,4.27,38.86,6a8,8,0,0,1,2.83,2.83c1.69,2.85,5.33,20.21,6,38.85C232.55,90.89,230.46,118.89,216.72,143.64Zm-55.18,29a52.11,52.11,0,0,1-33.4-44.78A52.09,52.09,0,0,1,83.37,94.47q-10.45,23.79-11.3,57.59a8,8,0,0,1-4.85,7.17L31.83,174.37l34.45,9.86a8,8,0,0,1,5.49,5.5l9.84,34.44,15.16-35.4a8,8,0,0,1,7.17-4.84Q137.71,183.12,161.54,172.64ZM212.42,43.57c-14.15-3-64.1-11-100.3,14.75a81.21,81.21,0,0,0-16,15.07,36,36,0,0,0,39.35,38.44,8,8,0,0,1,8.73,8.73,36,36,0,0,0,38.47,39.34,80.81,80.81,0,0,0,15-16C223.42,107.73,215.42,57.74,212.42,43.57Z"></path></svg></div>
            <div><h3>Alimentação</h3><p class="text-sm">Ração de qualidade para todos os gatos</p><p class="text-sm text-orange" style="font-weight:600"></p></div>
        </div></div>
        <div class="card" style="background-color: #eff6ff; border-color: #bfdbfe;"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#bfdbfe;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#1f1f1f"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M20,6h-4V4c0-1.1-0.9-2-2-2h-4C8.9,2,8,2.9,8,4v2H4C2.9,6,2,6.9,2,8v12c0,1.1,0.9,2,2,2h16c1.1,0,2-0.9,2-2V8 C22,6.9,21.1,6,20,6z M10,4h4v2h-4V4z M20,20H4V8h16V20z"/><polygon points="13,10 11,10 11,13 8,13 8,15 11,15 11,18 13,18 13,15 16,15 16,13 13,13"/></g></g></svg></div>
            <div><h3>Cuidados Veterinários</h3><p class="text-sm">Consultas, vacinas e tratamentos</p><p class="text-sm text-orange" style="font-weight:600"></p></div>
        </div></div>
        <div class="card" style="background-color: #f0fdf4; border-color: #bbf7d0;"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#bbf7d0;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M440-520h80v-280q0-17-11.5-28.5T480-840q-17 0-28.5 11.5T440-800v280ZM200-360h560v-80H200v80Zm-58 240h98v-80q0-17 11.5-28.5T280-240q17 0 28.5 11.5T320-200v80h120v-80q0-17 11.5-28.5T480-240q17 0 28.5 11.5T520-200v80h120v-80q0-17 11.5-28.5T680-240q17 0 28.5 11.5T720-200v80h98l-40-160H182l-40 160Zm676 80H142q-39 0-63-31t-14-69l55-220v-80q0-33 23.5-56.5T200-520h160v-280q0-50 35-85t85-35q50 0 85 35t35 85v280h160q33 0 56.5 23.5T840-440v80l55 220q13 38-11.5 69T818-40Zm-58-400H200h560Zm-240-80h-80 80Z"/></svg></div>
            <div><h3>Instalações</h3><p class="text-sm">Manutenção e limpeza do abrigo</p><p class="text-sm text-orange" style="font-weight:600"></p></div>
        </div></div>
        <div class="card" style="background-color: #faf5ff; border-color: #e9d5ff;"><div class="card-body" style="display:flex;gap:1rem">
            <div style="width:3rem;height:3rem;background:#e9d5ff;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M201.57,54.46a104,104,0,1,0,0,147.08A103.4,103.4,0,0,0,201.57,54.46ZM65.75,65.77a87.63,87.63,0,0,1,53.66-25.31A87.31,87.31,0,0,1,94,94.06a87.42,87.42,0,0,1-53.62,25.35A87.58,87.58,0,0,1,65.75,65.77ZM40.33,135.48a103.29,103.29,0,0,0,65-30.11,103.24,103.24,0,0,0,30.13-65,87.78,87.78,0,0,1,80.18,80.14,104,104,0,0,0-95.16,95.1,87.78,87.78,0,0,1-80.18-80.14Zm149.92,54.75a87.69,87.69,0,0,1-53.66,25.31,88,88,0,0,1,79-78.95A87.58,87.58,0,0,1,190.25,190.23Z"></path></svg></div>
            <div><h3>Equipamento</h3><p class="text-sm">Camas, brinquedos e acessórios</p><p class="text-sm text-orange" style="font-weight:600"></p></div>
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
            <p class="text-sm mb-4">Também aceitamos doações de ração, areia para gatos, brinquedos, camas, mantas e outros itens essenciais. <a href="/public/contact">Contacte-nos</a> para coordenar a entrega.</p>
            <h3>Voluntariado</h3>
            <p class="text-sm">O seu tempo também é valioso! Se prefere contribuir com o seu tempo e dedicação, considere tornar-se voluntário!</p>
        </div>
    </div>
</div>
</main>

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
    var custom = document.getElementById('customAmount').value;
    var amount = selectedAmount || custom;
    if (!amount || parseFloat(amount) < 1) {
        e.preventDefault();
        alert('Por favor escolha um valor de pelo menos €1.');
        return false;
    }
    // Stripe expects the amount in cents (€10 = 1000)
    document.getElementById('amountInCents').value = Math.round(parseFloat(amount) * 100);
    return true; // let the form submit normally — browser redirects to /donate/checkout
}
</script>

<%@ include file="footer.jsp" %>

</body>
</html>
