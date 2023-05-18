<%-- 
    Document   : form_inserir_perfil
    Created on : 18/05/2023, 01:11:05
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Perfl</title>
    </head>
    <body>
        <h1>Novo Perfl</h1>
        <form method="POST" action="inserir_perfil.do">
            Nome:<input type="text" name="nome" size="15" required> <br>
            Descrição <input type="text" name="descricao" size="15" requerid> <br>
            <input type="submit" value="Salvar">
            
        </form>        
        
        
    </body>
</html>
