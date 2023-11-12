<%-- 
    Document   : home
    Created on : 07/10/2023, 02:42:16
    Author     : jr_ma
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.Usuario"%>
<%@page import="MODEL.Carrinho"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>


<%
    String pedido = "";
    boolean pedidoRealizado = false;
    List<Carrinho>  lista = new ArrayList<>();
    double total = 0;
    
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    
    
    if(session.getAttribute("pedido") != null)
    {
        pedido = session.getAttribute("pedido").toString();
    }
    if(session.getAttribute("pedidoRealizado") != null){
        pedidoRealizado = (boolean) session.getAttribute("pedidoRealizado");
    }
    
    if(session.getAttribute("carrinho") != null){
        lista = (List<Carrinho>) session.getAttribute("carrinho");
    }
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Horti-Fruit</title>
        <link rel="icon" type="image/png" href="./ASSETS/IMAGES/3082061.png" >
        <link rel="stylesheet" type="text/css" href="./STYLE/styleCarrinho.css" >
        <script defer src="./SCRIPT/script.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body  <%
        if(session.getAttribute("pedido") != null){
            out.print("onload='gerarCarrinho("+pedido+")'");
        }
        %> >
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
                <h1>Carrinho</h1>
            </div>
            <div class="header-div">
               <ul class="menu">
                <li>
                    <a href="#">Menu</a>
                    <ul class="submenu">
                        <li><a href="home.jsp">Pedido</a></li>
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
                <h3> .: CARRINHO :. </h3>
            </div>
           
            <div class="card-body">
                <table>
                    <thead>
                        <tr>
                            <th> REMOVER </th> 
                            <th> PRODUTO </th>
                            <th> QNTD  </th>
                            <th> VALOR </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (lista != null && !lista.isEmpty()) { %>
                            <% for (Carrinho item : lista) { %>
                            <% total += item.Valor(); %>
                            <tr>
                                <td>
                                    <button class="btn-remover" onclick="excluirItem(<%= item.Id() %>)">Remover</button>
                                </td> 
                                <td><%= item.Nm_produto() %></td>
                                <td><%= item.Quantidade() %></td>
                                <td>R$ <%= item.Valor() %></p>
                            </tr>
                            <% } %>
                        <% } %>   
                    </tbody>   
                </table>
                   
                <div class="card-footer">        
                        <div class="card-total">
                            <p><strong>Nome:</strong> <%if(session.getAttribute("usuario")!= null){out.print(usuario.Nome());}%> | <strong>Pedido:</strong> <%if(!pedido.isEmpty()){out.print(pedido);}%></p>
                            <h4>Valor total: R$ <%= total%></h4>
                        </div>                
                </div>
            </div>
            <% if(!pedido.isEmpty()){ %>
                <button class="btn-finalizar"<%if(!pedido.isEmpty()){out.print("onclick='finalizarCompra("+pedido+")'");}%> >Finalizar compra</button>       
            <%}%>
        </div> 
        
        
        
            <div id="popupOk">
                <div class="bg-black"></div>
                <div class="cardOk">
                    <p>Sucesso em criar conta</p>
                    <button onclick="sair()">OK</button>
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
            <p>Powered By HortiFruti</p>
        </footer>
    </div>
    </body>
</html>
