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

        <title>Inserir Menu</title>
    </head>
    <body>
        <header>
            <!-- MENU SUPERIOR -->
            <%@include file="menu.jsp"%>
        </header>
        <div class="card">
            <h5 class="card-header">Cadastre um menu abaixo</h5>
        </div>
        <form class="formulario" action="gerenciar_menu.do" method="POST">
            <input type="hidden" name="idMenu" value="${menu.idMenu}"/>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label for="nome" class="control-label">Nome Menu</label>
                    <input type="text" class="form-control" id="nome" name = "titulo" required="" value="${menu.titulo}" maxlength="45"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="link" class="control-label">Link</label>
                    <input type="text" class="form-control" id="link" name = "link" required="" value="${menu.link}" maxlength="60"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="icone" class="control-label">Icone</label>
                    <input type="text" class="form-control" id="icone" name = "icone" value="${menu.icone}" maxlength="45"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="exibir" class="control-label">Exibir</label>
                    <select type="text" class="form-control" id="exibir" name = "exibir">
                        <option value="1" 
                                <c:if test="${menu.exibir==1}">
                                    selected=""
                                </c:if>
                                >Sim</option>
                        <option value="2"
                                <c:if test="${menu.exibir==2}">
                                    selected=""
                                </c:if>
                                >Não</option>
                    </select>    
                </div>
            </div>
            <div class="form-group col-sm-6">
                <button type="submit" class="btn btn-success">Criar</button>
                <a href="lista_menu.jsp"class="btn btn-warning">Voltar</a>
            </div> 

        </form>        
    </form>
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-8KL8Vf0hVrM0K9n6CXyRo/OV+PQF/mT4M7ADuc+MNl3Q9p1L2WzUwIyfzJghqjw8anB/ygb5egbTp5i8KTqZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</body>
</html>