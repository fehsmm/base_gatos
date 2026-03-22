<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>As Minhas Escalas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/volunteer.css">
</head>
<body>
<div class="layout">
    <jsp:include page="sidebar.jsp" />

    <main class="main-content">
        <jsp:include page="../header.jsp" />
        <div class="page-title">As Minhas Escalas</div>
        <div class="info-line">${user.username} &nbsp;•&nbsp; ${user.email}</div>

        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-number orange">0</div>
                <div>Turnos Próximos</div>
            </div>
            <div class="stat-card">
                <div class="stat-number green">2</div>
                <div>Turnos Completos</div>
            </div>
            <div class="stat-card">
                <div class="stat-number blue">2</div>
                <div>Tarefas Realizadas</div>
            </div>
        </div>

        <div class="panel text-center">
            Não tem turnos agendados proximamente.
        </div>

        <div class="section-title">Turnos Anteriores</div>

        <div class="shift-card">
            <div class="shift-header">
                <div>
                    <div class="shift-date">segunda-feira, 16 de março de 2026</div>
                    <div class="shift-time">09:00 - 13:00</div>
                </div>
                <div class="badge-box">2/3 Concluídas</div>
            </div>

            <div class="task-list">
                <div class="task-item">
                    <input type="checkbox" checked disabled>
                    <div>
                        <div class="task-title task-done">Alimentar os gatos</div>
                        <div class="task-description">Dar comida e água fresca</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox" checked disabled>
                    <div>
                        <div class="task-title task-done">Limpar caixas de areia</div>
                        <div class="task-description">Limpar todas as caixas</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox" disabled>
                    <div>
                        <div class="task-title">Brincar com os gatos</div>
                        <div class="task-description">Sessão de brincadeira de 30min</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="shift-card">
            <div class="shift-header">
                <div>
                    <div class="shift-date">terça-feira, 17 de março de 2026</div>
                    <div class="shift-time">14:00 - 18:00</div>
                </div>
                <div class="badge-box">0/3 Concluídas</div>
            </div>

            <div class="task-list">
                <div class="task-item">
                    <input type="checkbox" disabled>
                    <div>
                        <div class="task-title">Alimentar os gatos</div>
                        <div class="task-description">Refeição da tarde</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox" disabled>
                    <div>
                        <div class="task-title">Atualizar fotos para adoção</div>
                        <div class="task-description">Fotografar novos gatos</div>
                    </div>
                </div>

                <div class="task-item">
                    <input type="checkbox" disabled>
                    <div>
                        <div class="task-title">Lavar cobertores</div>
                        <div class="task-description">Lavar todas as mantas</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="alert-panel">
            <strong>Informação Importante</strong>
            <ul class="simple-list" style="margin-top:10px;">
                <li>Clique nas tarefas para marcá-las como concluídas</li>
                <li>Se não puder comparecer a um turno, avise com antecedência</li>
                <li>Em caso de emergência, contacte: +351 912 345 678</li>
                <li>Consulte o manual de procedimentos na área comum do abrigo</li>
            </ul>
        </div>
    </main>
</div>
</body>
</html>