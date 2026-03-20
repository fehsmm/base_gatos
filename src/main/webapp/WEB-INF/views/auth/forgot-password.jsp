
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><title>Recuperar Password | </title>
    <!-- 1. Adicione isto para o estilo Tailwind do React funcionar no JSP -->
    <!--<script src="https://cdn.tailwindcss.com"></script>-->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->
    <!--<link rel="stylesheet" href="/src/main/resources/estilos.css"/></head>-->
<body style="min-height:100vh;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,#fff7ed,#fce7f3);padding:1rem">
<div style="width:100%;max-width:420px">
    <div class="text-center mb-6"><a class="logo" style="justify-content:center;font-size:1.3rem"><div class="logo-icon" style="width:3rem;height:3rem;font-size:1.3rem">🐱</div>Meg</a></div>
    <div class="card">
        <div class="card-header"><h2 style="margin:0">🔑 Recuperar Password</h2><p class="text-sm">Introduza o seu email para receber instruções</p></div>
        <div class="card-body">
            <div class="alert alert-success" ></div>
            <form method="post">
                <input type="hidden" name=".." value=".."/>
                <div class="form-group"><label>Email</label><input type="email" name="email" required placeholder="seu@email.com" autocomplete="email"/></div>
                <button type="submit" class="btn btn-primary btn-lg w-full">Enviar Email de Recuperação</button>
            </form>
            <div class="text-center mt-4"><a href="" class="text-sm" style="color:#6b7280">← Voltar ao Login</a></div>
        </div>
    </div>
    <div class="card mt-4" style="background:#eff6ff;border-color:#bfdbfe"><div class="card-body"><p class="text-sm" style="color:#1e40af"><strong>Nota:</strong> Aplicação de demonstração. Na versão real, receberá um email com link seguro.</p></div></div>
</div>
<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>-->
</body></html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Base de Gatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/estilos.css">
</head>
<body>
<h1>Bem-vindo à !</h1>
<p>Ajude-nos a ajudar os gatinhos da comunidade.</p>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>