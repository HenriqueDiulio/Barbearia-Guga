<%-- 
    Document   : lista_perfil
    Created on : 22/05/2023, 23:53:46
    Author     : Henrique
--%>

<%@page import="model.Perfil"%>
<%@page import="model.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--conexão com o bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Perfil</title>

        <script type="text/javascript">
            function confirmarExclusao(id, nome) {
                if (confirm('Deseja realmente excluir o perfil ' + nome + '?')) {
                    location.href = 'gerenciar_perfil.do?acao=deletar&idPerfil=' + id;
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
            <h5 class="card-header">Perfis da Barbearia</h5>
            <div class="card-body">
                <h5 class="card-title">Cadastre um novo Perfil</h5>
                <a href="form_perfil.jsp" class="btn btn-success">Criar novo Perfil</a>
            </div>
        </div>
        <table class="table" id="listaPerfil">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Opções</th>
                    <th scope="col">Acessos</th>
                </tr>
            </thead>
            <jsp:useBean class="model.PerfilDAO" id="pDAO"/> 
            <tbody>
                <c:forEach var="p" items="${pDAO.lista}">                
                    <tr>
                        <th scope="row">${p.idPerfil}</th>
                        <td>${p.nome}</td>
                        <td>
                            <a class="btn btn-primary" href="gerenciar_perfil.do?acao=alterar&idPerfil=${p.idPerfil}"><img src="imgens/alterar.png" alt="alterar"/></a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${p.idPerfil},'${p.nome}')"><img src="imgens/delete.png" href="" alt="delete"/></button>
                        </td>
                        <td>
                            <a class="btn btn-default" href="gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=${p.idPerfil}"><i class="btn btn-success">Acessos</i></a>    
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
                                    $("#listaPerfil").dataTable({
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
