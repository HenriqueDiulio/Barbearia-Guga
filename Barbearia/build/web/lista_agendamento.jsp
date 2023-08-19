<%-- 
    Document   : form_agendamento
    Created on : 11/06/2023, 23:56:31
    Author     : Henrique
--%>

<%@page import="model.UsuarioDAO"%>
<%@page import="model.Agendamento"%>
<%@page import="model.AgendamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--conexão com o bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>
        <title>Lista Agendamentos</title>
        <script type="text/javascript">

                            function confirmarExclusao(idAgendamento, hora) {
                                if (confirm('Deseja realmente inativar o agendamento ' + hora + '?')) {
                                    location.href = 'gerenciar_agendamento.do?acao=deletar&idAgendamento=' + idAgendamento;
                                }
                            }
        </script>    
    </head>
    <body>
        <header>
            <!-- MENU SUPERIOR -->
            <%@include file="menu.jsp"%>
        </header>   
        <div class="card">
            <h5 class="card-header">Agendamentos cadastrados no sistema</h5>
            <div class="card-body">
                <h5 class="card-title">Cadastre um Agendamento abaixo</h5>
                <a href="form_agendamento.jsp" class="btn btn-success">Criar novo agendamento</a>
            </div>
        </div>

        <table class="table" id="listaAgendamento">
            <thead class="thead-dark">                  
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Data</th>
                    <th scope="col">Hora</th>
                    <th scope="col">Barbeiro</th>
                    <th scope="col">Cliente</th>
                    <th scope="col">Serviço</th>
                    <th scope="col">Opções</th>
                </tr>
            </thead>
            <jsp:useBean class="model.AgendamentoDAO" id="aDAO"/> 
            <tbody>
                <c:forEach var="a" items="${aDAO.lista}">                
                    <tr>
                        <td>${a.idAgendamento}</td>
                        <td>${a.data}</td>
                        <td>${a.hora}</td>
                        <td>${a.usuario.nome}</td>
                        <td>${a.cliente.nome}</td>
                        <td>${a.servico.nome}</td>
                        <td>
                            <a class="btn btn-primary" href="gerenciar_agendamento.do?acao=alterar&idAgendamento=${a.idAgendamento}"><img src="imgens/alterar.png" alt="alterar"/></a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${a.idAgendamento}, '${a.data}')"><img src="imgens/delete.png" href="" alt="delete"/></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#listaAgendamento").dataTable({
                                    "bJQueryUI": true,
                                    "oLanguage": {
                                        "sProcessing": "Processando...",
                                        "sLengthMenu": "Mostrar _MENU_registros",
                                        "sZeroRecords": "Não foram encontrados resultados",
                                        "sInfo": "Mostrar de _START_ até _END_ de _TOTAL_ registros",
                                        "sInfoEmpty": "Mostrando de 0 até 0 até 0 registros",
                                        "sInfoFilterd": "",
                                        "sInfoPostFix": "",
                                        "sSearch": "Pesquisar",
                                        "aUri": "",
                                        "oPaginate": {
                                            "sFirst": "Primeiro",
                                            "sPrevious": "Anterior",
                                            "sNext": "Próximo",
                                            "sLast": "Último"
                                        }
                                    }
                                })
                            })
        </script>
    </body>
</html>
