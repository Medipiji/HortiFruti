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

<div class="container" 

     >
     <jsp:include page="../utility/header.jsp"/>
     <div class="card-holder">
         <div class="card-header">
             <h3> .: CARRINHO :. </h3>
         </div>

         <div class="card-body">
             <table style="width:100%;">
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
                                 <button class="btn-remover btn-sair" onclick="excluirItem(<%= item.Id() %>)">Remover</button>
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
             <button style="width: 100%;" class="btn-finalizar btn"<%if(!pedido.isEmpty()){out.print("onclick='finalizarCompra("+pedido+")'");}%> >Finalizar compra</button>       
         <%}%>
     </div> 
     <jsp:include page="../utility/popup.jsp"/>
     <jsp:include page="../utility/footer.jsp"/> 
 </div>

