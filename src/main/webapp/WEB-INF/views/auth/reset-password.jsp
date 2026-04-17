<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"/><title>Recuperar Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<body>
<%@ include file="../public/header.jsp" %>
<div class="container mt-5 d-flex flex-column align-items-center justify-content-center ">
    <div class="card p-4">
        <div class="card-header text-center">
            <h2>Alterar Passsword</h2>
        </div>

        <div class="card-body text-center">
        <p class="mb-4 text-center">Introduza a nova password</p>
        <form action="/auth/reset-password" method="post">
            <div class="mb-3">
                <input type="hidden" name="token" value="${token}" />
                <div class="input-group">
                    <input type="password" class="form-control custom-input"  name="newPassword"/>
                </div>
            </div>
            <button type="submit" class="btn btn-dark btn-lg">Alterar</button>
        </form>
        <div class="text-center mt-4"><a href="/auth/login" >Voltar ao Login</a></div>
    </div>
    </div>

</div>
<%@ include file="../public/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body></html>