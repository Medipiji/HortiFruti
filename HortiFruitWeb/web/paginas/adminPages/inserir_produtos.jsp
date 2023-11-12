<%-- 
    Document   : home
    Created on : 07/10/2023, 02:42:16
    Author     : jr_ma
--%>

<%@page import="MODEL.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String pedido = "";
    boolean pedidoRealizado = false;
            
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    
    
    if(session.getAttribute("pedido") != null)
    {
        pedido = session.getAttribute("pedido").toString();
    }
    if(session.getAttribute("pedidoRealizado") != null){
        pedidoRealizado = (boolean) session.getAttribute("pedidoRealizado");
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horti-Fruit</title>
        <link rel="icon" type="image/png" href="./ASSETS/IMAGES/3082061.png" >
        <link rel="stylesheet" type="text/css" href="./STYLE/styleHome.css" >
        <script defer src="./SCRIPT/script.js"></script> 
    </head>
    <body>
        <div class="container">
            <div class="bg-black"></div>    
            <header>
                <div class="header-div">
                    <h3><%= usuario.Nome() %></h3>
                    <h3> 
                        <%
                            if(pedidoRealizado){ out.println("Pedido - "+pedido); }
                        %>
                    </h3>
                </div>
                <div class="header-div">
                    <h1>Hortifruit</h1>
                </div>
                <div class="header-div">
                    <ul class="menu">
                        <li>    
                            <a href="#">Menu</a>
                            <ul class="submenu">
                                <li><a href="home">Pedido</a></li>
                                <li><a href="produtos">Produtos</a></li>
                                <li><a href="carrinho">Carrinho</a></li>
                                <%if(usuario.Admin()){ out.println("<li><a href='inserirProdutos'>Inserir Produtos</a></li>");}%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </header>

            <div class="card-holder">
                <div class="card-header">
                    <p> .:Estoque:. </p>
                </div>
                <form id="form-cadastra-produto">
                    <div class="input-pack">
                        <label>Nome</label>
                        <input type="text" name="cadastro-produto-nome" required="true">
                        <label>Categoria</label>
                        <input type="text" name="cadastro-produto-categoria" required="true">
                        <label>Valor</label>
                        <input type="text" name="cadastro-produto-valor" required="true">
                        <label>Quantidade</label>
                        <input type="text" name="cadastro-produto-quantidade" required="true"><br>
                        <div class="text-box">
                            <a onclick="enviarProduto()" href="#" class="btn btn-white btn-animate">Cadastrar</a>
                        </div>
                    </div>
                </form>
            </div>

            <div id="popupOk">
                <div class="bg-black"></div>
                <div class="cardOk">
                    <p>Sucesso em criar conta</p>
                    <button onclick="showPopupOk()">OK</button>
                </div>
            </div>
            <div id="popupError">
                <div class="bg-black"></div>
                <div class="cardError">
                    <p>Aconteceu um erro no procedimento</p>
                    <button onclick="showPopupError()">OK</button>
                </div>
            </div>
                            
                            
            <footer>
                <p>Powered by Healtec &trade;</p>
            </footer>
        </div>
    </body>
</html>
