<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><title>Login | Abrigo Felino</title>
    <!-- 1. Adicione isto para o estilo Tailwind do React funcionar no JSP -->
    <!--<script src="https://cdn.tailwindcss.com"></script>-->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->
    <!--<link rel="stylesheet" href="/src/main/resources/estilos.css"/></head>-->
<body style="min-height:100vh;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,#fff7ed,#fce7f3);padding:1rem">
<div style="width:100%;max-width:420px">
    <div class="text-center mb-6"><a href="" class="logo" style="justify-content:center;font-size:1.3rem"><div class="logo-icon" style="width:3rem;height:3rem;font-size:1.3rem">🐱</div>Abrigo Felino</a></div>
    <div class="card">
        <div class="card-header"><h2 style="margin:0">🔑 Iniciar Sessão</h2><p class="text-sm">Entre na sua conta para aceder à área reservada</p></div>
        <div class="card-body">
            <div class="alert alert-success"  text="..."></div>
            <div class="alert alert-error" text="...}"></div>
            <form action="..." method="post">
                <input type="hidden" name="..." value="..."/>
                <div class="form-group"><label>Email</label><input type="email" name="username" required placeholder="seu@email.com" autocomplete="email"/></div>
                <div class="form-group"><label>Password</label><input type="password" name="password" required placeholder="••••••••" autocomplete="current-password"/></div>
                <div class="form-group" style="display:flex;align-items:center;gap:.5rem"><input type="checkbox" name="remember-me" id="rememberMe" style="width:auto"/><label for="rememberMe" style="font-weight:normal;font-size:.875rem">Lembrar-me</label></div>
                <button type="submit" class="btn btn-primary btn-lg w-full">Entrar</button>
            </form>
            <div class="text-center mt-4"><a href="..." class="text-sm" style="color:#f97316">Esqueceu a password?</a></div>
            <div style="margin-top:1.5rem;padding-top:1.5rem;border-top:1px solid #f3f4f6">
                <p class="text-sm font-semibold mb-4">Contas de Demonstração:</p>
                <div style="display:flex;flex-direction:column;gap:.4rem">
                    <div class="alert alert-info" style="padding:.5rem .75rem"><p class="text-sm font-semibold">Admin:</p><p class="text-sm">admin@abrigofelino.pt / admin123</p></div>
                    <div class="alert alert-success" style="padding:.5rem .75rem"><p class="text-sm font-semibold">Voluntário:</p><p class="text-sm">voluntario@abrigofelino.pt / vol123</p></div>
                    <div style="background:#eff6ff;border:1px solid #bfdbfe;border-radius:.5rem;padding:.5rem .75rem"><p class="text-sm font-semibold" style="color:#1e40af">Veterinário:</p><p class="text-sm">veterinario@abrigofelino.pt / vet123</p></div>
                    <div style="background:#faf5ff;border:1px solid #e9d5ff;border-radius:.5rem;padding:.5rem .75rem"><p class="text-sm font-semibold" style="color:#6b21a8">Adotante:</p><p class="text-sm">adotante@email.com / adot123</p></div>
                </div>
            </div>
            <div class="text-center mt-4">
                <p class="text-sm">Não tem conta? <a href="..." style="color:#f97316;font-weight:600">Registar</a></p>
                <a href="..." class="text-sm text-gray" style="display:block;margin-top:.5rem">← Voltar ao site</a>
            </div>
        </div>
    </div>
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
    <title>Login</title>
    <link rel="stylesheet" href="/styles/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/auth.css">
</head>
<body>
<div class="container">
    <div class="card mt-4">
        <div class="card-header">
            <h2>Login</h2>
        </div>
        <div class="card-body">
            <form method="POST" action="/login">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="O seu username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="O seu username">
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary">
                        Login
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>