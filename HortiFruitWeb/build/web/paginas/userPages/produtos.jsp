<%-- 
    Document   : home
    Created on : 07/10/2023, 02:42:16
    Author     : jr_ma
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.Usuario"%>
<%@page import="MODEL.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String pedido = "";
    boolean pedidoRealizado = false;
    List<Produto> lista = new ArrayList<>();
            
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    
    
    if(session.getAttribute("pedido") != null)
    {
        pedido = session.getAttribute("pedido").toString();
    }
    if(session.getAttribute("pedidoRealizado") != null){
        pedidoRealizado = (boolean) session.getAttribute("pedidoRealizado");
    }
    
    if(session.getAttribute("produtos") != null){
        lista = (List<Produto>) session.getAttribute("produtos");
    }
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horti Fruti - PEDIDOS</title>
        <link rel="icon" type="image/png" href="./ASSETS/IMAGES/3082061.png" >
        <link rel="stylesheet" type="text/css" href="./STYLE/stylePedido.css" >
        <script src="./SCRIPT/script.js"></script> 
    </head>
    <body onload="gerarProdutosPrimeiro()">
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
                <form>
                <div class="card-header">
                    <h3> .: INFORMAÇÕES :. </h3>
                    
                </div>
                <div class="card-body">
                    <button class="btn" onclick="gerarProdutos()">Recarregar</button>      
                    <table style="width:100%;">
                        <thead>
                            <tr>
                                <th> NOME </th>
                                <th> CATEGORIA </th>
                                <th> QNTD DISPONÍVEL </th>
                                <th> PREÇO </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (lista != null && !lista.isEmpty()) { %>
                                    <% for (Produto item : lista) { %>
                                    <tr onclick="adicionarAoCarrinho(<%=pedido%>,<% out.print(item.Id()+",'"+item.Nome()+"',"+ item.Quantidade() +","+item.Preco()); %>)">
                                        <td><%= item.Nome() %></td>
                                        <td><%= item.Categoria() %></td>
                                        <td><%= item.Quantidade()%></td>
                                        <td>R$ <%= item.Preco() %></p>
                                    </tr>
                                    <% } %>
                            <% } %>        
                        </tbody>   
                    </table>
                </div>
                        
            </div>
                        
            <div id="idInsert" class="container-insert-carrinho">
                <div class="modal-insert-carrinho" >
                    <form id="form_inserir_carrinho_teste" method="POST">
                        <input type="hidden" id="idCarrinho" name="idCarrinhoNameCarrinho" value="">
                        <input type="hidden" id="idProduto" name="idProdutoNameCarrinho" value="">
                        <input type="hidden" id="idNmProduto" name="idNmProdutoNameCarrinho" value="">
                        <input type="hidden" id="idValor" name="idValorNameCarrinho" value="">
                        <input type="hidden" id="idEstoque" name="idEstoque" value="">
                        <p>Quantidade</p>
                        <input type="text" id="idQuantidade" name="quantidadeCarrinho" autocomplete="false">
                        <button class="btn" onclick="adicionarProdutoCarrinho()">Adicionar</button>
                        <button class="btn-sair" onclick="mostrarModalInsert()">Sair</button>
                    </form>
          
                </div>
            </div>

            <footer>
                <p>Powered by Healtec &trade;</p>
            </footer>
                        

                        
        </div>
       
    </body>
</html>
