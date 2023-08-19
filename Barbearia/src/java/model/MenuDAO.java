 package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Henrique 19/05/23 19:32
 */
public class MenuDAO extends DataBaseDAO {
    
    public MenuDAO() throws Exception{}
    
    public boolean gravar(Menu m){
        
        try{
            String sql;
            this.conectar();
            if(m.getIdMenu()==0){
                sql = "INSERT INTO menu (titulo, link, icone, exibir) VALUES (?,?,?,?)";
            }else{
                sql = "UPDATE menu SET titulo=?, link=?, icone=?, exibir=? WHERE idMenu=?";
            }
            
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, m.getTitulo());
            pstm.setString(2,m.getLink());
            pstm.setString(3,m.getIcone());
            pstm.setInt(4,m.getExibir());
            if(m.getIdMenu()>0){
                pstm.setInt(5, m.getIdMenu());
            }
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public ArrayList<Menu> getLista()throws Exception{
        
        ArrayList<Menu> lista = new ArrayList<Menu>(0);
        String sql = "SELECT * FROM menu";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            m.setExibir(rs.getInt("exibir"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
    public Menu getCarregaPorId(int idMenu) throws Exception{
        
        Menu m = new Menu();
        String sql = "SELECT * FROM menu WHERE idMenu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idMenu);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            m.setIdMenu(idMenu);
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            m.setExibir(rs.getInt("exibir"));
        }
        this.desconectar();
        return m;
    }
    
    public boolean deletar(Menu m){
        
        try{
            String sql = "DELETE FROM menu WHERE idMenu=?";
            this.conectar();
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, m.getIdMenu());
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
}