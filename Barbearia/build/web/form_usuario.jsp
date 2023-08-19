<%-- 
    Document   : form_usuario
    Alteration : 19/05/2023, 19:51:47
    Author     : Henrique
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>
        <!--conexão com o bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Inserir Usuario</title>
    </head>
    <body>
        <header>
            <!-- MENU SUPERIOR -->
            <%@include file="menu.jsp"%>
        </header>
        <div class="card">
            <h5 class="card-header">Cadastre um Usuario abaixo</h5>
        </div>
        <form class="formulario" method="POST" action="gerenciar_usuario.do">
            <label for="inputEmail4">ID</label><br>
            <input type="hidden" class="form-control" name="idUsuario" value="${usuario.idUsuario}">
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="inputEmail4">Nome</label>
                    <input type="text" class="form-control" name="nome" value="${usuario.nome}" placeholder="nome do usuário" required="" >
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">login</label>
                    <input type="text" class="form-control" name="login" value="${usuario.login}" placeholder="login do usuario" required="">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">senha</label>
                    <input type="password" class="form-control" name="senha" value="${usuario.senha}" placeholder="Senha do usuario" required="">
                </div>
                <div class="form-group col-sm-6">
                    <label for="perfil" class="control-label">Perfil</label>
                    <select type="text" class="form-control" name="idPerfil" required="">
                        <option value="">Selecione o Perfil</option>
                        <jsp:useBean class="model.PerfilDAO" id="perfil"/>
                        <c:forEach var="p" items="${perfil.listar()}">
                            <option value="${p.idPerfil}"
                                        <c:if test="${p.idPerfil==usuario.perfil.idPerfil}">selected=""</c:if>
                                        >   ${p.nome}</option>
                        </c:forEach>
                    </select>    
                </div> 
                <div class="form-group col-sm-6">
                    <label for="disabledSelect" class="control-label">Status</label>
                    <select id="disabledSelect" name="status" class="form-control">
                        <option value="1"
                                <c:if test="${usuario.status==1}">
                                    selected=""
                                </c:if>
                                >Ativo</option>
                        <option value="2"
                                <c:if test="${usuario.status==2}">
                                    selected=""
                                </c:if>
                                >Inativo</option>
                    </select>
                </div>
            </div>
            <div class="form-group col-sm-6">
                <button type="submit" class="btn btn-success">Criar</button>
                <a href="lista_usuario.jsp"class="btn btn-warning">Voltar</a>
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