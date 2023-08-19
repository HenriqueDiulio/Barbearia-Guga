<%-- 
    Document   : Login
    Created on : 30/05/2023, 22:40:34
    Author     : Henrique
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">       
        <link href="css/estilo_login.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GUGA BARBER</title>
    </head>
    <body>
        <header><!-- MENU SUPERIOR -->
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

                    </div>
                </div>
            </nav>
        </header>
        <div class="container col-lg-3" id="login">
            <form action="gerenciar_login.do" method="POST">
                <% 
                    String mensagem = (String)request.getSession().getAttribute("mensagem");
                    if(mensagem!=null){
                            request.getSession().removeAttribute("mensagem");

                %>
                <div class="alert alert-info"><%=mensagem%></div>
                <%
                    }
                %>
                
                <div class="form-group">
                    <p><strong> Bem vindo a GUGA BARBER SHOP</strong> </p>
                </div>
                <div class="form-group">
                    <label for="inputEmail4"> Login</label>
                    <input  class="form-control" type="text" name="login" value="" placeholder="Digite seu login" required="">
                </div> 
                <div class="form-group">
                    <label for="inputEmail4"> Senha</label>
                    <input  class="form-control" type="text" name="senha" value="" placeholder="Digite sua senha" required="">
                </div>
                <button type="submit" class="btn btn-dark btn-block">Entrar</button>
        </div>
    </form>
</div>
</body>
</html>
