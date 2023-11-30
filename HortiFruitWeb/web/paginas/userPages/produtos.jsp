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
    
<div class="container">
    <div class="bg-black"></div>    
    <jsp:include page="../utility/header.jsp"/>

    <div class="card-holder">
        <form>
        <div class="card-header">
            <h3>INFORMAÇÕES</h3>

        </div>
        <div class="card-body">
            <button class="btn" onclick="gerarProdutos()">Recarregar</button>      
            <table class="table-style">
                <tr>
                    <th> NOME </th>
                    <th> CATEGORIA </th>
                    <th> QNTD DISPONÍVEL </th>
                    <th> PREÇO </th>
                    <%if(usuario.Admin()){
                        out.println("<th> ADD </th>");    
                        out.println("<th> EDITAR </th>");
                        out.println("<th> DELETAR </th>");
                    }%>
                </tr>
                <% if (lista != null && !lista.isEmpty()) { %>
                        <% for (Produto item : lista) { %>
                        <tr
                            <%if(!usuario.Admin()){%>
                                onclick="adicionarAoCarrinho(<%=pedido%>,<% out.print(item.Id()+",'"+item.Nome()+"',"+ item.Quantidade() +","+item.Preco()); %>)"
                            <%}%>
                        >
                            <td><%= item.Nome() %></td>
                            <td><%= item.Categoria() %></td>
                            <td><%= item.Quantidade()%></td>
                            <td>R$ <%= item.Preco() %></p>
                            <%if(usuario.Admin()){%>
                                <td><a class="btn-sair btn-add" onclick="adicionarAoCarrinho(<%=pedido%>,<% out.print(item.Id()+",'"+item.Nome()+"',"+ item.Quantidade() +","+item.Preco()); %>)">Add</a></td>
                                <td><a class="btn-sair btn-editar" onclick="editarProduto(<%out.print(item.Id()+",'"+item.Nome()+"','"+item.Categoria()+"',"+item.Quantidade()+","+item.Preco());%>)">Editar</a></td>
                                <td><a class="btn-sair" onclick="excluirProduto(<%=item.Id()%>)">Deletar</a></td>
                            <%}%>
                        </tr>
                        <% } %>
                <% } %>        
            </table>
        </div>
    </div>
    <jsp:include page="../utility/modalAdd.jsp"/>
    <jsp:include page="../utility/modalEdit.jsp"/>
    <jsp:include page="../utility/footer.jsp"/>
</div>
