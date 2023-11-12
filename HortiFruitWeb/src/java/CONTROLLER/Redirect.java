/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CONTROLLER;
/**
 *
 * @author jr_ma
 */

import MODEL.Path;


public class Redirect {
    
    public static Path checkPath(String path){
              
        Path obj = new Path();
        
        switch (path) {
            // ROTA VAZIA PADRÃO
             case "":
                obj.Path("../paginas/initial/homeExternal.jsp");
                obj.Dispatcher("paginasContainer/indexInitial.jsp");
                break;
            // LOGIN
            case "/login":
                obj.Path("../paginas/initial/login.jsp");
                obj.Dispatcher("paginasContainer/indexInitial.jsp");
                break;
            // LOGIN
            case "/cadastro":
                obj.Path("../paginas/initial/cadastro.jsp");
                obj.Dispatcher("paginasContainer/indexInitial.jsp");
                break;
            // AREAS DE DENTRO DA APLICAÇÃO
            // HOME
            case "/home":
                obj.Path("../paginas/userPages/home.jsp");
                obj.Dispatcher("paginasContainer/app.jsp");
                break;
            // AREA DE ERRO (NENHUMA ROTA RECONHECIDA)
            default:
                obj.Path("../paginas/initial/homeExternal.jsp");
                obj.Dispatcher("paginasContainer/indexInitial.jsp");
                break;
        }
        
        return obj;
    }
}
