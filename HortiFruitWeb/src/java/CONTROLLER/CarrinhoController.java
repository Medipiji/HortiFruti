/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CONTROLLER;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;

import MODEL.Produto;
import MODEL.Carrinho;

import DAL.PedidoDAL;
import DAL.ProdutosDAL;
import DAL.CarrinhoDAL;



@WebServlet(urlPatterns = {"/carrinhoLoad", "/carrinhoInsert", "/deleteProduto"})
public class CarrinhoController extends HttpServlet {
    
    //FUNÇÃO DE TESTE DO SERVLET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
  
        if(request.getServletPath().equals("/carrinhoLoad")){
            try{  
                int pedido = Integer.parseInt(request.getParameter("carrinho_id"));
                
                List<Carrinho> objLista = getCarrinho(pedido);
                if(!objLista.isEmpty()){
                     HttpSession session = request.getSession();
                     session.setAttribute("carrinho", objLista);
                     response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if(request.getServletPath().equals("/deleteProduto")){
            try{
                String idCarrinho = request.getParameter("idCarrinho");
                 if(deleteProduto(idCarrinho)){
                     response.setStatus(HttpServletResponse.SC_OK);
                 } else {
                     response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                 }
            } catch (SQLException ex) {
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }       
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        
        
        if(request.getServletPath().equals("/carrinhoInsert")){       
            try{
                String idCarrinho = request.getParameter("idCarrinho");
                String idProduto = request.getParameter("idProduto");
                String idNmProduto = request.getParameter("idNmProduto");
                String idEstoque = request.getParameter("idEstoque");
                String idValor = request.getParameter("idValor");
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                
                if(!idCarrinho.equals("") && !idProduto.equals("") && !idNmProduto.equals("") && quantidade >= 0){
                    boolean operacao = postInsertCarrinho(idCarrinho, idProduto, idNmProduto, idEstoque, idValor, quantidade);
                    if(operacao){
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex){
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex){
                Logger.getLogger(CarrinhoController.class.getName()).log(Level.SEVERE, null, ex);
            }    
        }
    }
    
    protected List<Carrinho> getCarrinho(int id)  throws SQLException, ClassNotFoundException {
        CarrinhoDAL objDAL = new CarrinhoDAL();
        List<Carrinho> listaObj = objDAL.getCarrinho(id);
        return listaObj;
    }
    
    protected boolean postInsertCarrinho(String idCarrinho, String idProduto, String idNmProduto, String idEstoque, String idValor, int quantidade)  throws SQLException, ClassNotFoundException{
        CarrinhoDAL objDAL = new CarrinhoDAL();
        boolean retorno = objDAL.insertCarrinho(idCarrinho, idProduto, idNmProduto,idEstoque, idValor, quantidade);
        return retorno;
    }
    
    protected boolean deleteProduto(String idCarrinho)  throws SQLException, ClassNotFoundException {
        CarrinhoDAL objDAL = new CarrinhoDAL();
        return objDAL.excluirProduto(idCarrinho);
    }
    
    
}
