<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/styles/dashboard.css">
</head>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        background-color: #f6f7f8;
        min-height: 100vh;
        min-height: 100dvh;
        display: grid;
        grid-template-columns: auto 1fr;
    }

    .sidebar {
        box-sizing: border-box;
        height: 100vh;
        width: 250px;
        background-color: #101828;
        color: white;
        padding: 10px 15px;
        border-right: 1px solid #d7dcdf;
        position: sticky;
        top: 0;
        align-self: start;
        transition: 300ms ease-in-out;
        overflow: hidden;
        text-wrap: nowrap;
    }

    .sidebar-header {
        margin: 10px;
        padding: 10px;
    }

    .sidebar-header .header {
        margin-top: 10px;
        padding: 0px;
    }

    .sidebar a {
        color: #adb5bd;
        text-decoration: none;
        padding: 10px 15px;
        display: block;
        border-radius: 8px;
    }

    .sidebar a:hover {
        background-color: #343a40;
        color: #adb5bd;
    }

    .sidebar .active {
        background-color: #fd7e14;
        color: white;
    }

    .sidebar-footer {
        margin-top: 30px;
        padding: 0px;
    }

    .container {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 15px;
        background-color: white;
    }

    .logo-icon {
        width: 40px;
        height: 40px;
        background-color: #fd7e14;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    main{
        padding: min(30px, 7%);
    }

    main p{
        color: black;
        margin-top: 5px;
        margin-bottom: 15px;
    }

    .container{
        border: 1px solid #d7dcdf;
        border-radius: 1em;
        margin-bottom: 20px;
        padding: min(3em, 15%);

        h2, p { margin-top: 1em }
    }

</style>
<body>

<nav class="sidebar">
    <div class="sidebar-header">
        <span class="logo-icon"></span>
        <div class="header">
            <strong>Nome do Utilizador</strong><br>
            <small></small>
            <hr>
        </div>
    </div>
    <a href="/admin" class="active">
        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="white"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Zm0-80h320v-560H200v560Zm400 0h160v-240H600v240Zm0-320h160v-240H600v240Z"/></svg>
        <span>Dashboard</span>
    </a>
    <a href="#">
        <span>Os meus gatos</span>
    </a>
    <a href="#">
        <span>Relatórios</span>
    </a>

    <div class="sidebar-footer">
        <a href="/public/home.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M838-65 720-183v89h-80v-226h226v80h-90l118 118-56 57ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 20-2 40t-6 40h-82q5-20 7.5-40t2.5-40q0-20-2.5-40t-7.5-40H654q3 20 4.5 40t1.5 40q0 20-1.5 40t-4.5 40h-80q3-20 4.5-40t1.5-40q0-20-1.5-40t-4.5-40H386q-3 20-4.5 40t-1.5 40q0 20 1.5 40t4.5 40h134v80H404q12 43 31 82.5t45 75.5q20 0 40-2.5t40-4.5v82q-20 2-40 4.5T480-80ZM170-400h136q-3-20-4.5-40t-1.5-40q0-20 1.5-40t4.5-40H170q-5 20-7.5 40t-2.5 40q0 20 2.5 40t7.5 40Zm34-240h118q9-37 22.5-72.5T376-782q-55 18-99 54.5T204-640Zm172 462q-18-34-31.5-69.5T322-320H204q29 51 73 87.5t99 54.5Zm28-462h152q-12-43-31-82.5T480-798q-26 36-45 75.5T404-640Zm234 0h118q-29-51-73-87.5T584-782q18 34 31.5 69.5T638-640Z"/></svg>
            <span>Website</span>
        </a>
        <a href="">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#adb5bd"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg>
            <span>Terminar Sessão</span>
        </a>
        <a href="">
            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="red"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg>
            <span class="text-danger">Eliminar Conta</span>
        </a>
    </div>
</nav>
<div>
    <main class="main-content">
        <div class="topbar d-flex justify-content-between align-items-center">
            <div>
                <h4 class="mb-1 fw-bold">Área do Adotante</h4>
            </div>
        </div>


        <div class="content-area">
            <div class="mb-4">
                <p class="">Acompanhe os seus gatos adotados</p>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <div class="stats-card">

                        <div>
                            <div class="">Gatos Adotados</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="stats-card">
                        <div>
                            <div class="">Relatório Pendente</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="stats-card">
                        <div>
                            <div class="">Taxa de Felicidade</div>
                        </div>
                    </div>
                </div>
            </div>


            <section class="section-card mb-4">
                <h3 class="bold mb-4">
                    Os Meus Gatos
                </h3>

                <div class="row g-3">
                    <div class="col-lg-6">
                        <div class="cat-card">
                            <img src="#"alt=""/>
                            <div>
                                <h4 class="mb-2">Gato 1</h4>
                                <span class="badge-soft-success">Adotado</span>
                                <p class="mt-3 mb-1 text-muted">Adotado em: xx/xx/xxxx</p>
                                <p class="mb-0 text-muted">Próxima consulta: xx/xx/xxxx</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="cat-card">
                            <img src="#"alt=""/>
                            <div>
                                <div>
                                    <h4 class="mb-2">Gato 2</h4>
                                    <span class="badge-soft-success">Adotado</span>
                                    <p class="mt-3 mb-1 text-muted">Adotado em: xx/xx/xxxx</p>
                                    <p class="mb-0 text-muted">Próxima consulta: xx/xx/xxxx</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section-card">
                <h3 class="fw-bold mb-4">Ações Rápidas</h3>
                <div class="row g-3">
                    <div class="col-md-4">
                        <button class="btn btn-primary p-4">
                            Ver Todos os Meus Gatos
                        </button>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary p-4">
                            Preencher Relatório
                        </button>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary p-4">
                            Agendar Consulta
                        </button>
                    </div>
                </div>
            </section>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>