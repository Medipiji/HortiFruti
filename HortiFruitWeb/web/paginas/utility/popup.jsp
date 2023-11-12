<%-- 
    Document   : popup
    Created on : 11/11/2023, 13:57:34
    Author     : jr_ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <div class="bg-black"></div>
    <div class="bg-colorfull"></div>
    <div id="popupOk">
        <div class="bg-black"></div>
        <div class="cardOk">
            <p>Sucesso em criar conta</p>
            <button onclick="showPopupOk()">OK</button>
        </div>
    </div>
    <div id="popupError">
        <div class="bg-black"></div>
        <div class="cardError">
            <p>Aconteceu um erro no procedimento</p>
            <button onclick="showPopupError()">OK</button>
        </div>
    </div>
