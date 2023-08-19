<%-- 
    Document   : index
    Created on : 11/05/2023, 19:33:52
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
            <%@include file="menu.jsp"%>
        </header>
        <div class="container" id="conteudo">
            <div class="row">
                <div class="col">
                    <!--CARD-->
                    <div class="card">
                        <img src="imgens/imagem_barbershop1.jfif" class="card-img-top" alt="...">
                        <div class="card-body">

                            <a href="form_login.jsp" id="botao" class="btn btn-primary">Fazer login</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <!--CARD-->
                    <div class="card" >
                        <img src="imgens/imagem_barbershop4.jpg" class="card-img-top" alt="New cliente">
                        <div class="card-body">

                            <a href="form_cliente.jsp" id="botao" class="btn btn-primary">Novo cliente</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <!--CARD-->
                    <div class="card">
                        <img src="imgens/imagem_barbershop3.jpg" class="card-img-top" alt="New cliente">
                        <div class="card-body">

                            <a href="form_agendamento.jsp" id="botao" class="btn btn-primary">Novo agendamento</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <!--CARD-->
                    <div class="card" >
                        <img src="imgens/imagem_barbershop2.jpg" class="card-img-top" alt="...">
                        <div class="card-body">

                            <a href="form_servico.jsp" id="botao" class="btn btn-primary">Novo Serviço</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" >
                        <img src="imgens/imagem_barbershop5.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <a href="lista_usuario.jsp" id="botao" class="btn btn-primary">Mostra Usuários</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <!--CARD-->
                </div>
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
