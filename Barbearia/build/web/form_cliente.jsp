<%-- 
    Document   : form_cliente
    Created on : 14/06/2023, 19:49:48
    Author     : Henrique
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>
        <!--conexão com o bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Inserir Cliente</title>
    </head>
    <body>
        <header><!-- MENU SUPERIOR -->
            <%@include file="menu.jsp"%>
        </header>
        <div class="card">
            <h5 class="card-header">Cadastre um Cliente abaixo</h5>
        </div>
        <form class="formulario" method="POST" action="gerenciar_cliente.do">
            <label for="inputEmail4">ID</label><br>
            <input type="hidden" class="form-control" name="idCliente" value="${cliente.idCliente}">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Nome</label>
                    <input type="text" class="form-control" name="nome" value="${cliente.nome}" required="">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Telefone</label>
                    <input type="text" class="form-control" name="telefone" value="${cliente.telefone}" required="">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Endereço</label>
                    <input type="text" class="form-control" name="endereco" value="${cliente.endereco}"  required="">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Email</label>
                    <input type="text" class="form-control" name="email" value="${cliente.email}"  required="">
                </div>
            </div>
            <div class="form-group col-sm-6">
                <button type="submit" class="btn btn-success">Criar</button>
                <a href="lista_cliente.jsp"class="btn btn-warning">Voltar</a>
            </div> 
        </form>
        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-8KL8Vf0hVrM0K9n6CXyRo/OV+PQF/mT4M7ADuc+MNl3Q9p1L2WzUwIyfzJghqjw8anB/ygb5egbTp5i8KTqZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </body>
</html>