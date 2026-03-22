<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><title>Recuperar Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            background: navajowhite;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>

<body>
<div class="container d-flex flex-column align-items-center justify-content-center">
    <div class="title text-center mb-6"><h2>Meg</h2></div>
    <div class="card text-center">
        <div class="card-header"><h3>Recuperar Password</h3>
            <p>Introduza o seu email para receber instruções</p></div>
        <div class="card-body mt-2">
            <form action="" method="post">
                <div class="form-group"><label>Email</label>
                    <input class="mb-4" type="email" name="email" placeholder="seu@email.com"/></div>
                <button type="submit" class="btn btn-primary btn-lg">Enviar Email de Recuperação</button>
            </form>
            <div class="text-center mt-4"><a href="#" >Voltar ao Login</a></div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body></html>