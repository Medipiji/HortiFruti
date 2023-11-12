/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author jr_ma
 */
public class Usuario {
    
    String nome, email, senha;
    boolean admin;
    
    public Usuario(){
        this.admin = false;
    }
    
    public Usuario(String nome, String email, String senha, boolean admin){
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.admin = admin;
    }
    
    public String Nome(){ return this.nome; } public void Nome(String param){ this.nome = param; }
    public String Email(){ return this.email; } public void Email(String param){ this.email = param; }
    public String Senha(){ return this.senha; } public void Senha(String param){ this.senha = param; }
    public boolean Admin(){ return this.admin; } public void Admin(boolean param){ this.admin = param; }
    
}
