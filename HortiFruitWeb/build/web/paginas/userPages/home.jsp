<%@page import="MODEL.Usuario"%>
<%
    String pedido = "";
    boolean pedidoRealizado = false;
    
    if(session.getAttribute("pedido") != null)
    {
        pedido = session.getAttribute("pedido").toString();
    }
    if(session.getAttribute("pedidoRealizado") != null){
        pedidoRealizado = (boolean) session.getAttribute("pedidoRealizado");
    }
%>

<div class="container">    
    <div class="bg-black"></div>    
    <jsp:include page="../utility/header.jsp"/>
    <div class="card-holder">
        <div class="card-header">
            <p>Pedido</p>
        </div>
        <div class="input-pack">
            <%    
           if(!pedidoRealizado){
                out.print("<p>Por gentileza, gerar seu pedido.</p>");
                out.println(pedido);
                out.println("<button onclick='gerarPedido()'>Gerar</button>");
           } else {
                out.println("Pedido já gerado!");
           }
            %>
            <br>
            <p>É necessário gerar um pedido para que você possa adicionar items ao seu "carrinho".</p>
            <p>Após gerar, você encontrará o número do seu pedido na parte superior esquerda.</p>
        </div>
    </div>
    <jsp:include page="../utility/footer.jsp"/>
</div>
