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



@WebServlet(urlPatterns = {"/produtoLista", "/produtoCadastro", "/editarProduto", "/excluirProduto"})
public class ProdutoController extends HttpServlet {
    
    //FUNÇÃO DE TESTE DO SERVLET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
        if(request.getServletPath().equals("/produtoLista")){
            try{
                 List<Produto> objLista = getProdutos();
                 if(!objLista.isEmpty()){
                     HttpSession session = request.getSession();
                     session.setAttribute("produtos", objLista);
                     response.setStatus(HttpServletResponse.SC_OK);
                 } else {
                     response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                 }
            } catch (SQLException ex) {
                Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        if(request.getServletPath().equals("/produtoCadastro")){       
            try{
                String nome = request.getParameter("cadastro-produto-nome");
                String categoria = request.getParameter("cadastro-produto-categoria");
                String valor = request.getParameter("cadastro-produto-valor");
                int quantidade = Integer.parseInt(request.getParameter("cadastro-produto-quantidade"));
                
                if(!nome.equals("") && !categoria.equals("") && !valor.equals("") && quantidade >= 0){
                    boolean operacao = postEnviarProdutos(nome, categoria, valor, quantidade);
                    if(operacao){
                        response.setStatus(HttpServletResponse.SC_CREATED);
                    } else {
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex){
                Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex){
                Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if(request.getServletPath().equals("/excluirProduto")){       
            try{
                String idProduto = request.getParameter("idProduto");
                if(!idProduto.equals("")){
                    boolean operacao = excluirProduto(idProduto);
                    if(operacao){   
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex){
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex){
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if(request.getServletPath().equals("/editarProduto")){       
            try{
                String idProduto = request.getParameter("idProdutoEdit");
                String idNmProduto = request.getParameter("nmProdutoEdit");
                String idCategoria = request.getParameter("categoriaEdit");
                String idEstoque = request.getParameter("estoqueEdit");
                String idValor = decimalCorrect(request.getParameter("valorEdit"));
                
                if(!idCategoria.equals("") && !idProduto.equals("") && !idNmProduto.equals("")){
                    boolean operacao = postEditarProduto(idProduto, idNmProduto, idCategoria, idEstoque, idValor);
                    if(operacao){
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException ex){
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex){
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            }    
        }
        
        
        
    }
     

    protected List<Produto> getProdutos()  throws SQLException, ClassNotFoundException {
        ProdutosDAL objDAL = new ProdutosDAL();
        List<Produto> listaObj = objDAL.getProdutos();
        return listaObj ;
    }
    
    protected boolean postEnviarProdutos(String nome, String categoria, String preco, int quantidade) throws SQLException, ClassNotFoundException {
        ProdutosDAL objDAL = new ProdutosDAL();
        boolean resultado = objDAL.setProdutos(nome, categoria, preco, quantidade);
        return resultado;
    }
    
    protected boolean postEditarProduto(String idProduto, String idNmProduto,String idCategoria,String idEstoque, String idValor) throws SQLException, ClassNotFoundException{
        ProdutosDAL objDAL = new ProdutosDAL();
        return objDAL.editarProduto(idProduto, idNmProduto, idCategoria, idEstoque, idValor);
    }
    
    protected boolean excluirProduto(String idProduto)  throws SQLException, ClassNotFoundException {
        ProdutosDAL objDAL = new ProdutosDAL();
        return objDAL.excluirProduto(idProduto);
    }
    
    private String decimalCorrect(String num){
        return num.replace(",", ".");
    }
    
    
}
