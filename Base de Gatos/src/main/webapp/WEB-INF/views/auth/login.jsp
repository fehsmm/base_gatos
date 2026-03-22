
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MEG - Login</title>
    <link rel="stylesheet" href="/styles/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<style>
    body {
        background: navajowhite;
        font-family: Arial, Helvetica, sans-serif;
    }

    .title{
        color:black;
        text-decoration: dotted;
    }

    .balaoIniciarSessao{
        border-radius:8px;
    }



</style>
<body>
<div class="container d-flex flex-column align-items-center justify-content-center">

    <div class="containerTitle">
        <div class="align-items-center gap-3 mb-4">
            <h1 class="title mt-4">MEG</h1>
        </div>
    </div>


    <div class="card balaoIniciarSessao p-4">
        <div class="card-header text-center">
            <h2 class="mb-2">Iniciar Sessão</h2>
        </div>
        <div class="card-body text-center">

            <p class="mb-4 text-center">Entre na sua conta para aceder à área reservada</p>

            <form action="/auth/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-input" id="username" name="username" placeholder="O seu username"/>
                        </span>
                    </div>
                </div>


                <div class="mb-3">
                    <label class="form-label" for="paswword">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control custom-input" id="password" name="password" placeholder="••••••••"/>
                        <button class="input-group-text" type="button" id="rPassword"></button>
                    </div>
                </div>

                <div class="justify-content-center align-items-center mb-3">
                    <div class="form-check">
                        <input type="checkbox"/>
                        <label class="remember">Lembrar-me</label>
                    </div>

                    <a href="#" class="link-passwd">Esqueceu a password?</a>
                </div>


                <div class="d-flex justify-content-center">
                    <button class="btn btn-dark">Entrar</button>
                </div>
            </form>

            <hr/>

            <p class="mb-3 text-center">Contas de Demonstração:</p>

            <div class="badge text-bg-primary p-4">
                <strong>Administrador:</strong><br />
                admin@abrigofelino.pt / admin123
            </div>

            <div class="badge text-bg-success p-4">
                <strong>Voluntário:</strong><br />
                voluntario@abrigofelino.pt / vol123
            </div>

            <div class="badge text-bg-info p-4">
                <strong>Veterinário:</strong><br />
                veterinario@abrigofelino.pt / vet123
            </div>

            <div class="badge text-bg-secondary p-4">
                <strong>Adotante:</strong><br />
                adotante@email.com / adot123
            </div>


            <div class="text-center mt-4">
                <p class="mb-2">
                    Não tem conta?
                    <a href="#" class="register">Registar</a>
                </p>
                <a href="#">Voltar ao site</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</html>