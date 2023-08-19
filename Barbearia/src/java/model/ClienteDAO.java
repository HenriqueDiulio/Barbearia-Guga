package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Henrique
 */
public class ClienteDAO extends DataBaseDAO {

    public ClienteDAO() throws Exception {
    }

    public ArrayList<Cliente> getLista() throws Exception {

        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setIdCliente(rs.getInt("idCliente"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setEndereco(rs.getString("endereco"));
            c.setEmail(rs.getString("email"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public boolean gravar(Cliente c) {

        try {
            this.conectar();
            String sql;
            if (c.getIdCliente() == 0) {
                sql = "INSERT INTO cliente(nome, telefone, endereco, email) "
                        + "VALUES(?,?,?,?)";
            } else {
                sql = "UPDATE cliente SET nome=?, telefone=?, endereco=? email=? "
                        + "WHERE idCliente=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getNome());
            pstm.setString(2, c.getTelefone());
            pstm.setString(3, c.getEndereco());
            pstm.setString(4, c.getEmail());
            if (c.getIdCliente() > 0) {
                pstm.setInt(5, c.getIdCliente());
            }
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean deletar(Cliente c) {

        try {
            this.conectar();
            String sql = "DELETE FROM cliente WHERE idCliente=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, c.getIdCliente());
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public Cliente getCarregaPorId(int idCliente) throws Exception {

        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE idCliente=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idCliente);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setIdCliente(rs.getInt("idCliente"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setEndereco(rs.getString("endereco"));
            c.setEmail(rs.getString("email"));
        }
        this.desconectar();
        return c;
    }
}
