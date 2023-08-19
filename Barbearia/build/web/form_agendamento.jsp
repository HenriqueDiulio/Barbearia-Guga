<%-- 
    Document   : form_agendamento
    Created on : 11/06/2023, 23:56:31
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

        <title>Inserir Agendamento</title>
    </head>
    <body>
        <header>
            <!-- MENU SUPERIOR -->
            <%@include file="menu.jsp"%>
        </header>
        <div class="card">
            <h5 class="card-header">Cadastre um Agendamento abaixo</h5>
        </div>
        <form class="formulario" method="POST" action="gerenciar_agendamento.do">
            <label for="inputEmail4">ID</label><br>
            <input type="hidden" class="form-control" name="idAgendamento" value="${agendamento.idAgendamento}">
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="inputEmail4">Data</label>
                    <input type="text" class="form-control" name="data" value="${agendamento.data}" placeholder="dia/mes/ano" required="" >
                </div>
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Hora</label>
                    <input type="text" class="form-control" name="login" value="${agendamento.hora}" placeholder="00:00" required="Digite o horario do agendamento">
                </div>
                <div class="form-group col-sm-6">
                    <label for="usuario" class="control-label">Barbeiro</label>
                    <select type="text" class="form-control" name="idUsuario" required="">
                        <option value="">Selecione Barbeiro</option>
                        <jsp:useBean class="model.UsuarioDAO" id="usuario"/>
                        <c:forEach var="u" items="${usuario.lista}">
                            <option value="${u.idUsuario}"
                                    <c:if test="${u.idUsuario==agendamento.usuario.idUsuario}">selected=""</c:if>
                                    >   ${u.nome}</option>
                        </c:forEach>
                    </select>    
                </div>
                <div class="form-group col-sm-6">
                    <label for="cliente" class="control-label">Cliente</label>
                    <select type="text" class="form-control" name="idCliente" required="">
                        <option value="">Selecione Cliente</option>
                        <jsp:useBean class="model.ClienteDAO" id="cliente"/>
                        <c:forEach var="c" items="${cliente.lista}">
                            <option value="${c.idCliente}"
                                    <c:if test="${c.idCliente==agendamento.cliente.idCliente}">selected=""</c:if>
                                    >   ${c.nome}</option>
                        </c:forEach>
                    </select>    
                </div>
                <div class="form-group col-sm-6">
                    <label for="servico" class="control-label">Serviço</label>
                    <select type="text" class="form-control" name="idServico" required="">
                        <option value="">Selecione Cliente</option>
                        <jsp:useBean class="model.ServicoDAO" id="servico"/>
                        <c:forEach var="s" items="${servico.lista}">
                            <option value="${s.idServico}"
                                    <c:if test="${s.idServico==agendamento.servico.idServico}">selected=""</c:if>
                                    >   ${s.nome}</option>
                        </c:forEach>
                    </select>    
                </div>
                
            </div>
            <div class="form-group col-sm-6">
                <button type="submit" class="btn btn-success">Criar</button>
                <a href="lista_agendamento.jsp"class="btn btn-warning">Voltar</a>
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