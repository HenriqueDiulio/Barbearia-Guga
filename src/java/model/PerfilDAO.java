/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;

/**
 *
 * @author Henrique
 */
public class PerfilDAO extends DataBaseDAO{
    
    // METODO INSERIR
    public  void inserir(Perfil p) throws Exception{
        String sql = "INSERT INTO perfil (nome, descricao) VALUES(?,?)";// aqui ele vai inserir o nome & descricao no banco de dados
        this.conectar(); // abrindo a conexão com o banco de dados
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        // ao executar ele vai subtituir o paremeto VALUES(1,2) pelo nome e descricao 
        pstm.setString(1, p.getNome()); 
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        
        this.desconectar(); // fechando a conexão com o banco de dados
    }
    // MÉTODO LISTA
    
    // MÉTODO ALTERAR
    
    // MÉTODO DELETAR
    
}
