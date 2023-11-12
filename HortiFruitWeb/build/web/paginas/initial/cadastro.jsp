
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<div class="container">
    <div class="card">
        <div class="input-pack">
            <img class="icon-login" src="./ASSETS/IMAGES/icon.png" alt="alt"/>
            <h2>Horti-Fruit</h2> 
        </div>
        <hr>
        <form id="form_registro" >
            <div class="input-pack">
                <label>Nome</label>
                <input type="text" name="nome_registro" required>
                <label>E-mail</label>
                <input type="text" name="email_registro" required>
                <label>Senha</label>
                <input type="password" name="senha_registro" required>
                <label>Confirmar Senha</label>
                <input type="password" name="confirm_registro" required>
            </div>
            <div class="input-pack">
                <button type="submit">CADASTRAR</button>
                <p>Ja possui uma conta? <a href="login">Logar</a></p>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../utility/popup.jsp"/>
