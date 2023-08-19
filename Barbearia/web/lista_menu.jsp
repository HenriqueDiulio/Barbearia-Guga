<%-- 
    Document   : lista_menu.jsp
    Created on : 21/05/2023, 11:29
    Author     : Henrique
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--conexão com o bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Menus</title>

        <script type="text/javascript">
            function confirmarExclusao(id, titulo) {
                if (confirm('Deseja realmente excluir o menu ' + titulo + '?')) {
                    location.href = 'gerenciar_menu.do?acao=deletar&idMenu=' + id;
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
            <h5 class="card-header">Menus cadastrados no sistema</h5>
            <div class="card-body">
                <h5 class="card-title">Cadastre um menu abaixo</h5>
                <a href="form_menu.jsp" class="btn btn-success">Criar Menu</a>
            </div>
        </div>
        <table class="table" id="listarMenu">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Titulo</th>
                    <th scope="col" >Link</th>
                    <th scope="col" >Exibir</th>
                    <th scope="col">Opções</th>
                </tr>                
                <jsp:useBean class="model.MenuDAO" id="mDAO"/> 
            <tbody>
                <c:forEach var="m" items="${mDAO.lista}">                
                    <tr>
                        <td>${m.idMenu}</td>
                        <td>${m.titulo}</td>
                        <td>${m.link}</td>
                        <td>
                            <c:if test="${m.exibir==1}">
                                Sim
                            </c:if>
                            <c:if test="${m.exibir==2}">
                                Não
                            </c:if>                           
                        </td>
                        <td>
                            <a class="btn btn-primary" href="gerenciar_menu.do?acao=alterar&idMenu=${m.idMenu}"><img src="imgens/alterar.png" alt="alterar"/></a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${m.idMenu}, '${m.titulo}')"><img src="imgens/delete.png" href="" alt="delete"/></button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>


            <!-- JavaScript (Opcional) -->
            <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-8KL8Vf0hVrM0K9n6CXyRo/OV+PQF/mT4M7ADuc+MNl3Q9p1L2WzUwIyfzJghqjw8anB/ygb5egbTp5i8KTqZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script type="text/javascript" src="datatables/jquery.js"></script>
            <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
            <script type="text/javascript">
                                $(document).ready(function () {
                                    $("#listarMenu").dataTable({
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