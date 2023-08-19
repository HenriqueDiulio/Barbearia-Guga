<%-- 
    Document   : menu
    Created on : 13/06/2023, 23:06:08
    Author     : Henrique
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/estilo.css" rel="stylesheet" type="text/css"/>
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
                    <a class="nav-link" href="index.jsp">Página Principal</a>
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