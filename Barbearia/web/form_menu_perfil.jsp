<%-- 
    Document   : form_menu_perfil
    Created on : 14/06/2023, 20:57:21
    Author     : Henrique
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, inicial-scale=1, maximum-scale=1, user-scaleble=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <title>JSP Page</title>
        <script type="text/javascript">
            function confirmarExclusao(idMenu, titulo, idPerfil){
                if(confirm('Deseja realmente excluir o menu '+titulo+'?')){
                    location.href='gerenciar_menu_perfil.do?acao=desvincular&idMenu='+idMenu+'&idPerfil='+idPerfil;
                }
            }
        </script>
    </head>
    <body>
        <div class="conteiner-fluid">
            <%@include file="menu.jsp" %>
            <h1>Gerenciar Perfil</h1>
            
            <form action="gerenciar_menu_perfil.do" method="POST">
                <input type="hidden" name="idPerfil" value="${perfilv.idPerfil}"/>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="menu" class="control-label">Menus</label>
                        <select name="idMenu" requeired="" id="idMenu" class="form-control">
                            <option value="">Selecione o Menu</option>
                            <c:forEach var="m" items="${perfilv.naoMenus}">
                                <option value="${m.idMenu}">${m.titulo}</option>
                            </c:forEach>
                        </select>
                        </div>
                </div>
                <div class="row">
                    <button class="btn btn-success">Vincular</button>
                    <a href="lista_perfil.jsp" class="btn btn-warning">Voltar</a>
                </div>
            </form>
                
                <table class="table table-hover table-striped table-bordered display" id="listaMenu">
                <thead>                  
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Icone</th>
                    <th>Exibir</th>
                    <th>Desvincular</th>
                </tr>
                </thead>
                <tfoot>                  
                <tr>
                    <th>ID</th>
                    <th>Nome Menu</th>
                    <th>Link</th>
                    <th>Icone</th>
                    <th>Exibir</th>
                    <th>Desvincular</th>
                </tr>
                </tfoot>
                
                <jsp:useBean class="model.MenuDAO" id="mDAO"/> 
                <tbody>
                <c:forEach var="m" items="${perfilv.menus}">                
                <tr>
                    <td>${m.idMenu}</td>
                    <td>${m.titulo}</td>
                    <td>${m.link}</td>
                    <td>${m.icone}</td>
                    <td>
                        <c:if test=" ${m.exibir==1}">
                            Sim
                        </c:if>    
                        <c:if test=" ${m.exibir==2}">
                            Não
                        </c:if>                           
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="confirmarExclusao(${m.idMenu},'${m.titulo}', ${perfilv.idPerfil})">
                            <i class="glyphicon glyphicon-trash"></i>
                        </button>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
                
                <script type="text/javascript" src="datatables/jquery.js"></script>
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listaMenu").dataTable({
                            "bJQueryUI": true,
                            "oLanguage":{
                                "sProcessing":"Processando...",
                                "sLengthMenu":"Mostrar _MENU_registros",
                                "sZeroRecords":"Não foram encontrados resultados",
                                "sInfo":"Mostrar de _START_ até _END_ de _TOTAL_ registros",
                                "sInfoEmpty":"Mostrando de 0 até 0 até 0 registros",
                                "sInfoFilterd":"",
                                "sInfoPostFix":"",
                                "sSearch":"Pesquisar",
                                "aUri":"",
                                "oPaginate":{
                                    "sFirst":"Primeiro",
                                    "sPrevious":"Anterior",
                                    "sNext":"Próximo",
                                    "sLast":"Último"
                                }                       
                            }
                        })
                    })
                </script>
        </div>
    </body>
</html>
