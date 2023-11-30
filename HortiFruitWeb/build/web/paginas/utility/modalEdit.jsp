<%-- 
    Document   : modalEdit]
    Created on : 29/11/2023, 20:48:08
    Author     : jr_ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="idEdit" class="container-edit-carrinho">
    <div class="modal-insert-carrinho" >
        <input type="hidden" id="idProdutoEdit" name="idProdutoEdit" value="">
        <label>Produto:</label>
        <input type="text" id="nmProdutoEdit" name="nmProdutoEdit" value="">
        <label>Categoria:</label>
        <input type="text" id="categoriaEdit" name="categoriaEdit" value="">
        <label>Estoque:</label>
        <input type="text" id="estoqueEdit" name="estoqueEdit" value="">
        <label>Valor:</label>
        <input type="text" id="valorEdit" name="valorEdit" value="">
        <button class="btn" onclick="enviarEditar()">Adicionar</button>
        <button class="btn-sair" onclick="mostrarModalEdit()">Sair</button>
    </div>
</div>
