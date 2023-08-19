
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Henrique
 */
public class ServicoDAO extends DataBaseDAO {
    
    public ServicoDAO() throws Exception{}
    
    public ArrayList<Servico> getLista() throws Exception{
        
        ArrayList<Servico> lista = new ArrayList<Servico>();
        String sql = "SELECT * FROM servico";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            Servico s = new Servico();
            s.setIdServico(rs.getInt("idServico"));
            s.setNome(rs.getString("nome"));
            s.setDescricao(rs.getString("descricao"));
            s.setValor(rs.getDouble("valor"));
            lista.add(s);
        }
        this.desconectar();
        return lista;
    }
    
    public boolean gravar(Servico s){
        
        try{
            this.conectar();
            String sql;
            if(s.getIdServico()==0){
                sql = "INSERT INTO servico(nome, descricao, valor) "
                        + "VALUES(?,?,?)";
            }else{
                sql = "UPDATE servico SET nome=?, descricao=?, valor=? "
                        + "WHERE idServico=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, s.getNome());
            pstm.setString(2, s.getDescricao());
            pstm.setDouble(3, s.getValor());
            if(s.getIdServico()>0){
                pstm.setInt(4, s.getIdServico());
            }
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public boolean deletar(Servico s){
        
        try{
            this.conectar();
            String sql = "DELETE FROM servico WHERE idServico=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, s.getIdServico());
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public Servico getCarregaPorId(int idServico) throws Exception{
        
        Servico s = new Servico();
        String sql = "SELECT * FROM servico WHERE idServico=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idServico);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            s.setIdServico(rs.getInt("idServico"));
            s.setNome(rs.getString("nome"));
            s.setDescricao(rs.getString("descricao"));
            s.setValor(rs.getDouble("valor"));
        }
        this.desconectar();
        return s;
    }
}
