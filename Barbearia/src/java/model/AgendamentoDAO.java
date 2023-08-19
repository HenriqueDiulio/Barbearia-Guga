/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Henrique
 */
public class AgendamentoDAO extends DataBaseDAO {

    // construtor da classe
    public AgendamentoDAO() throws Exception {
    }

    public ArrayList<Agendamento> getLista() throws Exception {

        ArrayList<Agendamento> lista = new ArrayList<Agendamento>();
        String sql = "SELECT * FROM agendamento ";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Agendamento a = new Agendamento();
            a.setIdAgendamento(rs.getInt("idAgendamento"));
            a.setData(rs.getString("data"));
            a.setHora(rs.getString("hora"));
            UsuarioDAO uDAO = new UsuarioDAO();
            a.setUsuario(uDAO.getCarregaPorID(rs.getInt("idAgendamento")));
            ClienteDAO cDAO = new ClienteDAO();
            a.setCliente(cDAO.getCarregaPorId(rs.getInt("idCliente")));
            ServicoDAO sDAO = new ServicoDAO();
            a.setServico(sDAO.getCarregaPorId(rs.getInt("idServico")));

            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public boolean gravar(Agendamento a) {

        try {
            String sql;
            this.conectar();
            if (a.getIdAgendamento() == 0) {
                sql = "INSERT INTO agendamento (data, hora, idAgendamento, idCliente, idServico)"
                        + " VALUES(?,?,?,?,?)";
            } else {
                sql = "UPDATE agendamento SET data=?, hora=?, idAgendamento=?, idCliente=?, idServico=?"
                        + " WHERE idAgendamento=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getData());
            pstm.setString(2, a.getHora());
            pstm.setInt(3, a.getUsuario().getIdUsuario());
            pstm.setInt(4, a.getCliente().getIdCliente());
            pstm.setInt(5, a.getServico().getIdServico());

            if (a.getIdAgendamento() > 0) {
                pstm.setInt(6, a.getIdAgendamento());
            }
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public Agendamento getCarregaPorID(int idAgendamento) throws Exception {

        Agendamento a = new Agendamento();
        String sql = "SELECT * FROM agendamento WHERE idAgendamento=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idAgendamento);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            a.setIdAgendamento(rs.getInt("idAgendamento"));
            a.setData(rs.getString("data"));
            a.setHora(rs.getString("hora"));
            UsuarioDAO uDAO = new UsuarioDAO();
            a.setUsuario(uDAO.getCarregaPorID(rs.getInt("idAgendamento")));
            ClienteDAO cDAO = new ClienteDAO();
            a.setCliente(cDAO.getCarregaPorId(rs.getInt("idCliente")));
            ServicoDAO sDAO = new ServicoDAO();
            a.setServico(sDAO.getCarregaPorId(rs.getInt("idServico")));
        }
        this.desconectar();
        return a;
    }

    public boolean deletar(Agendamento a) {

        try {
            String sql = "UPDATE agendamento WHERE idAgendamento=?";
            this.conectar();
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, a.getIdAgendamento());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}
