<%-- 
    Document   : modalAdd
    Created on : 29/11/2023, 20:48:51
    Author     : jr_ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
                        
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
