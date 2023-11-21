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
            <table style="width:100%;">
                <tr>
                    <th> NOME </th>
                    <th> CATEGORIA </th>
                    <th> QNTD DISPONÍVEL </th>
                    <th> PREÇO </th>
                </tr>
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
    <jsp:include page="../utility/footer.jsp"/>
</div>
