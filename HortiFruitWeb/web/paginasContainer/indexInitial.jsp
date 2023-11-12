<%

    String paginaAtual = "";
    if(session.getAttribute("paginaAtual") != null){
        paginaAtual = session.getAttribute("paginaAtual").toString();
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Horti-Fruit</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="./ASSETS/IMAGES/icon.png" >
        <link rel="stylesheet" type="text/css" href="./STYLE/style.css" >
        <link rel="stylesheet" type="text/css" href="./STYLE/styleHomeExternal.css" >
    </head>
    <body>
        <jsp:include page="<%=paginaAtual%>"/>
        <script src="./SCRIPT/scriptInitial.js"></script> 
    </body>
</html>
