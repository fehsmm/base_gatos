<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <link rel="stylesheet" href="/styles/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/auth.css">
</head>
<body>
<div class="container">
    <div class="card mt-4">
        <div class="card-header">
            <h2>Erro ao criar Conta</h2>
            <p>Registe-se para adotar, voluntariar ou candidatar-se a veterinário.</p>
        </div>
        <div class="card-body">
            <form method="POST" action="/auth/signUpAction" class="row gx-5 gy-4">
                <div class="col-md-4">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nome" name="nome" placeholder="O seu nome completo">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="exemplo@email.com">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Telefone</label>
                    <input type="tel" class="form-control" id="telefone" name="telefone" placeholder="9XX XXX XXX">
                </div>


                <div class="col-12 mt-4">
                    <div class="form-group">
                        <label>Pretendo *</label>
                        <select name="role">
                            <option value="adopter">Adotar um gato</option>
                            <option value="volunteer">Ser voluntário</option>
                        </select>
                        <div class="bg-blue-50 mb-4">
                            <p class="text-sm" style="color:#4b5563">Contas de voluntário requerem aprovação do administrador antes de serem ativadas.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Password *</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Mínimo 10 caracteres">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Confirmar Password</label>
                        <input type="password" class="form-control" id="password2" name="password2" placeholder="Repita paswword">
                    </div>

                    <div class="col-12 mt-4">
                        <div class="form-group mb-2" style="display:flex;align-items:flex-start;gap:3px">
                            <input type="checkbox" style="width:auto;" required/>
                            <label >Aceito os <a href="#"> termos
                                e condições</a> e a <a href="#">política de privacidade</a></label>
                        </div>
                        <button type="submit" class="btn btn-primary">Criar Conta</button>
                    </div>
                    <div class="text-center mt-4">
                        <p class="text-sm">Já tem conta? <a href="auth/login">Iniciar Sessão</a></p>
                    </div>
                </div>
            </form>
            <div class="text-center mt-2"><a href="public/home">Voltar ao site</a></div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>