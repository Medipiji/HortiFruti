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
        <form id="frm_login" >
            <div class="input-pack">
                <label>E-mail</label>
                <input type="text" name="email_input">
            </div>
            <div class="input-pack">
                <label>Senha</label>
                <input type="password" name="senha_input">
            </div>

            <div class="input-pack">
                <button type="submit">LOGAR</button>
                <p>Não tem uma conta? <a href="cadastro">Cadastre-se</a></p>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../utility/popup.jsp"/>
