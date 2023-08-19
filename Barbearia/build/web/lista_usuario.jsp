<%-- 
    Document   : lista_usuario
    Created on : 20/05/2023, 16:33:04
    Author     : Henrique
--%>

<%@page import="model.UsuarioDAO"%>
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
        <title>Lista Usuários</title>
        <script type="text/javascript">

                            function confirmarExclusao(idUsuario, nome) {
                                if (confirm('Deseja realmente inativar o usuario ' + nome + '?')) {
                                    location.href = 'gerenciar_usuario.do?acao=deletar&idUsuario=' + idUsuario;
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
            <h5 class="card-header">Perfis cadastrados no sistema</h5>
            <div class="card-body">
                <h5 class="card-title">Cadastre um Usuario abaixo</h5>
                <a href="form_usuario.jsp" class="btn btn-success">Criar novo Usuario</a>
            </div>
        </div>

        <table class="table" id="listarUsuario">
            <thead class="thead-dark">                  
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome Usuário</th>
                    <th scope="col">Login</th>
                    <th scope="col">Status</th>
                    <th scope="col">ID Perfil</th>
                    <th scope="col">Opções</th>
                </tr>
            </thead>
            <jsp:useBean class="model.UsuarioDAO" id="uDAO"/> 
            <tbody>
                <c:forEach var="u" items="${uDAO.lista}">                
                    <tr>
                        <td>${u.idUsuario}</td>
                        <td>${u.nome}</td>
                        <td>${u.login}</td>
                        <td>
                            <c:if test="${u.status==1}">
                                Ativo
                            </c:if>    
                            <c:if test="${u.status==2}">
                                Inativo
                            </c:if>                           
                        </td>
                        <td>${u.perfil.nome}</td>
                        <td>
                            <a class="btn btn-primary" href="gerenciar_usuario.do?acao=alterar&idUsuario=${u.idUsuario}"><img src="imgens/alterar.png" alt="alterar"/></a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${u.idUsuario}, '${u.nome}')"><img src="imgens/delete.png" href="" alt="delete"/></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#listarUsuario").dataTable({
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
