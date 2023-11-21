/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CONTROLLER;

import DAL.PedidoDAL;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jr_ma
 */
@WebServlet("/pedido") 
public class PedidoController extends HttpServlet {
    
    //FUNÇÃO DE TESTE DO SERVLET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getServletPath().equals("/pedido")){
            try {
                boolean resultado = gerarPedido();
                if(resultado){
                    String pedido = pegarPedido();
                    HttpSession session = request.getSession(); // Obtém a sessão 
                    if(!pedido.equals("")){
                        session.setAttribute("pedido",pedido);
                        session.setAttribute("pedidoRealizado",true);
                    } else {
                        session.setAttribute("pedido","Ocorreu um erro, tente novamente.");
                        session.setAttribute("pedidoRealizado",false);
                    }
                }else{
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    protected boolean gerarPedido() throws SQLException, ClassNotFoundException {
        PedidoDAL objDAL = new PedidoDAL();
        return objDAL.gerarCadastro();
    }
    
    protected String pegarPedido() throws SQLException, ClassNotFoundException {
        PedidoDAL objDAL = new PedidoDAL();
        return objDAL.pegarCadastro();
    }
    
    
}
