<%-- 
    Document   : app
    Created on : 11/11/2023, 15:13:37
    Author     : jr_ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String paginaAtual = "";
    if(session.getAttribute("paginaAtual") != null){
        paginaAtual = session.getAttribute("paginaAtual").toString();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horti-Fruit</title>
        <link rel="icon" type="image/png" href="./ASSETS/IMAGES/icon.png" >
        <link rel="stylesheet" type="text/css" href="./STYLE/styleHome.css" >
        
    </head>
    <body>
        <jsp:include page="<%=paginaAtual%>"/>
        <script src="./SCRIPT/script.js"></script> 
    </body>
</html>
