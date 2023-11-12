/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CONTROLLER;

import DAL.UsuarioDAL;
import MODEL.Usuario;
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
@WebServlet(urlPatterns = {"/logar", "/cadastrar"})
public class InitialController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {   
        if(request.getServletPath().equals("/logar")){
            try {
                Usuario obj = getLogin(request.getParameter("email_input"), request.getParameter("senha_input"));
                HttpSession session = request.getSession(); // Obtém a sessão           
                if (obj.Nome() != null || obj.Email() != null || obj.Senha() != null) {
                    session.setAttribute("usuario", obj);
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Login falhou");
                }
                
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        if(request.getServletPath().equals("/cadastrar")){       
            try{
                String nome = request.getParameter("nome_registro");
                String email = request.getParameter("email_registro");
                String senha = request.getParameter("senha_registro");
                String confirm_senha = request.getParameter("confirm_registro");
                
                if(senha.equals(confirm_senha)){
                    boolean operacao = postCadastro(nome, email, senha, 0);
                    HttpSession session = request.getSession();
                    if(operacao){   
                        session.setAttribute("popupOK", true);
                        response.setStatus(HttpServletResponse.SC_CREATED);
                    } else {
                        session.setAttribute("popupERROR", true);
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException | ClassNotFoundException ex){
                Logger.getLogger(Function.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
        
        
        
    protected Usuario getLogin(String email, String senha) throws ServletException, IOException, SQLException, ClassNotFoundException {
        UsuarioDAL objDAL = new UsuarioDAL();
        Usuario obj = objDAL.login(email, senha);   
        return obj;
    } 
    
    protected boolean postCadastro(String nome, String email, String senha, int admin) throws SQLException, ClassNotFoundException {
        UsuarioDAL objDAL = new UsuarioDAL();
        return objDAL.cadastro(nome, email, senha, admin);
    }
        
        
    }
