<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Voluntários | Meg</title>
    <link rel="stylesheet" href="/styles/global.css"/>
</head>
<body>
<nav class="sidebar">
    <div class="sidebar-header">
        <span class="logo-icon"></span>
        <div class="header">

            <main class="main-content">
                <div class="page-title">Área do Voluntário</div>
                <div class="page-subtitle">Bem-vindo à tua área de trabalho.</div>

                <div class="panel">
                    <p>Nesta área podes consultar as tuas escalas, ver o teu turno atual, acompanhar comunicados, pedir
                        stock e deixar notas do turno.</p>
                </div>

                <div class="stats-row">
                    <div class="stat-card">
                        <div class="stat-number orange">1</div>
                        <div>Turno Hoje</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number green">2</div>
                        <div>Turnos Completos</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number blue">5</div>
                        <div>Tarefas Realizadas</div>
                    </div>
                </div>

                <div class="sidebar-footer">
                    <a href="/public/home.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                             fill="#adb5bd">
                            <path d="M838-65 720-183v89h-80v-226h226v80h-90l118 118-56 57ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 20-2 40t-6 40h-82q5-20 7.5-40t2.5-40q0-20-2.5-40t-7.5-40H654q3 20 4.5 40t1.5 40q0 20-1.5 40t-4.5 40h-80q3-20 4.5-40t1.5-40q0-20-1.5-40t-4.5-40H386q-3 20-4.5 40t-1.5 40q0 20 1.5 40t4.5 40h134v80H404q12 43 31 82.5t45 75.5q20 0 40-2.5t40-4.5v82q-20 2-40 4.5T480-80ZM170-400h136q-3-20-4.5-40t-1.5-40q0-20 1.5-40t4.5-40H170q-5 20-7.5 40t-2.5 40q0 20 2.5 40t7.5 40Zm34-240h118q9-37 22.5-72.5T376-782q-55 18-99 54.5T204-640Zm172 462q-18-34-31.5-69.5T322-320H204q29 51 73 87.5t99 54.5Zm28-462h152q-12-43-31-82.5T480-798q-26 36-45 75.5T404-640Zm234 0h118q-29-51-73-87.5T584-782q18 34 31.5 69.5T638-640Z"/>
                        </svg>
                        <span>Website</span>
                    </a>
                    <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                             fill="#adb5bd">
                            <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/>
                        </svg>
                        <span>Terminar Sessão</span>
                    </a>
                    <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                             fill="red">
                            <path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/>
                        </svg>
                        <span class="text-danger">Eliminar Conta</span>
                    </a>
                </div>
            </main>
        </div>
    </div>
</nav>
</body>
</html>
