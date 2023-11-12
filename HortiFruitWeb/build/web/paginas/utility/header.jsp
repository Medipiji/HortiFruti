<%-- 
    Document   : header
    Created on : 11/11/2023, 15:14:54
    Author     : jr_ma
--%>
<%@page import="MODEL.Usuario"%>
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