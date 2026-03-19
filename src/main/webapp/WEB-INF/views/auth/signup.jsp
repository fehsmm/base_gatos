<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Registar | Abrigo Felino</title>
    <link rel="stylesheet" th:href="./estilos.css"/>
</head>
<body style="min-height:100vh;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,#fff7ed,#fce7f3);padding:1rem">
<div style="width:100%;max-width:480px">
    <div class="text-center mb-6"><a href="" class="logo" style="justify-content:center;font-size:1.3rem">
        <div class="logo-icon" style="width:3rem;height:3rem;font-size:1.3rem">🐱</div>
        Abrigo Felino</a></div>
    <div class="card">
        <div class="card-header"><h2 style="margin:0">👤 Criar Conta</h2>
            <p class="text-sm">Registe-se para adotar, voluntariar ou candidatar-se a veterinário</p></div>
        <div class="card-body">
            <div class="alert alert-success"></div>
            <form action="" method="post">
                <input type="hidden"/>
                <div class="form-group"><label>Nome Completo *</label><input type="text" name="name" required
                                                                             placeholder="O seu nome"
                                                                             autocomplete="name"/></div>
                <div class="form-group"><label>Email *</label><input type="email" name="email" required
                                                                     placeholder="seu@email.com" autocomplete="email"/>
                </div>
                <div class="form-group"><label>Telefone *</label><input type="tel" name="phone" required
                                                                        placeholder="912 345 678"/></div>
                <div class="form-group">
                    <label>Pretendo *</label>
                    <select name="role">
                        <option value="adopter">Adotar um gato</option>
                        <option value="volunteer">Ser voluntário</option>
                        <option value="veterinarian">Veterinário / Clínico</option>
                    </select>
                </div>
                <div class="bg-blue-50 mb-4"><p class="text-sm" style="color:#1e40af">ℹ️ Contas de voluntário e
                    veterinário requerem aprovação do administrador antes de serem ativadas.</p></div>
                <div class="form-group"><label>Password *</label><input type="password" id="pwd" name="password"
                                                                        required placeholder="Mínimo 6 caracteres"
                                                                        autocomplete="new-password"/></div>
                <div class="form-group"><label>Confirmar Password *</label><input type="password" id="pwd2"
                                                                                  name="confirmPassword" required
                                                                                  placeholder="Repita a password"
                                                                                  autocomplete="new-password"/></div>
                <div id="pwdError" class="alert alert-error" style="display:none;margin-bottom:1rem"></div>
                <div class="form-group" style="display:flex;align-items:flex-start;gap:.5rem">
                    <input type="checkbox" id="terms" style="width:auto;margin-top:.2rem" required/>
                    <label for="terms" style="font-weight:normal;font-size:.875rem">Aceito os <a href="#"
                                                                                                 style="color:#f97316">termos
                        e condições</a> e a <a href="#" style="color:#f97316">política de privacidade</a></label>
                </div>
                <button type="submit" class="btn btn-primary btn-lg w-full">Criar Conta</button>
            </form>
            <div class="text-center mt-4">
                <p class="text-sm">Já tem conta? <a href="" style="color:#f97316;font-weight:600">Iniciar Sessão</a></p>
            </div>
            <div class="text-center mt-2"><a href="" class="text-sm text-gray">← Voltar ao site</a></div>
        </div>
    </div>
    <div class="card mt-4" style="background:#eff6ff;border-color:#bfdbfe">
        <div class="card-body"><p class="text-sm" style="color:#1e40af"><strong>Nota:</strong> Esta é uma aplicação de
            demonstração. Use as contas de teste na página de login.</p></div>
    </div>
</div>
<script>

</script>
</body>
</html>
