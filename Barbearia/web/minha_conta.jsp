<%-- 
    Document   : minha_conta
    Created on : 31/05/2023, 00:04:46
    Author     : Henrique
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GUGA BARBER</title>
    </head>
    <body>
        <header>
            <!-- MENU SUPERIOR -->
            <nav class="navbar navbar-expand-lg nevbar-dark py-2" style="background-color: #333">
                <div class="container-fluid">
                    <!-- logo da empresa arrendonda -->
                    <img src="imgens/logo_guga.jpeg" class="rounded-circle" alt="Logo da empresa">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- BOTOES DE NAVEGAÇÃO SUPERIORES -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Página Inicial</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="lista_menu.jsp">Menus</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="lista_perfil.jsp">Perfis</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="lista_agendamento.jsp">Agendamentos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="lista_cliente.jsp">Clientes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="lista_servico.jsp">Serviços</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="card">
            <h5 class="card-header">Olá</h5>
            <div class="card-body">
                <h5 class="card-title">Dados da sua Conta</h5>
                <ul class="list-group">
                    <li class="list-group-item">ID</li>
                    <li class="list-group-item"> Nome</li>
                    <li class="list-group-item">Login</li>
                    <li class="list-group-item">Perfil</li>
                    <a href="index.jsp" style="color: black" class="list-group-item">Desconectar da conta</a>
                </ul>
            </div>
        </div>

        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-8KL8Vf0hVrM0K9n6CXyRo/OV+PQF/mT4M7ADuc+MNl3Q9p1L2WzUwIyfzJghqjw8anB/ygb5egbTp5i8KTqZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </body>
</html>
