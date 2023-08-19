/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Agendamento;
import model.AgendamentoDAO;
import model.Cliente;
import model.Servico;
import model.Usuario;

/**
 *
 * @author Henrique
 */
public class GerenciarAgendamento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        
        String idAgendamento = request.getParameter("idAgendamento");
        String mensagem = "";
        try{
            Agendamento a = new Agendamento();
            AgendamentoDAO aDAO = new AgendamentoDAO();
            if(acao.equals("alterar")){
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    a = aDAO.getCarregaPorID(Integer.parseInt(idAgendamento));
                    if(a.getIdAgendamento()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_agendamento.jsp");
                        request.setAttribute("agendamento", a);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Serviço não encontrado!";
                    }
                //}else{
                 //   mensagem = "Acesso negado!";
                //}
            }
            if(acao.equals("deletar")){
                //if (GerenciarLogin.verificarPermissao(request, response)) {
                    a.setIdAgendamento(Integer.parseInt(idAgendamento));
                    if (aDAO.deletar(a)) {
                        mensagem = "Serviço excluído com sucesso!";
                    } else {
                        mensagem = "Erro ao excluir o Serviço do Banco de Dados";
                    }
               // }else{
                //    mensagem = "Acesso negado!";
               // }
            }
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_agendamento.jsp';");
        out.println("</script>");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String idAgendamento = request.getParameter("idAgendamento");
        String data = request.getParameter("data");
        String hora = request.getParameter("hora");
        String idUsuario = request.getParameter("idUsuario");
        String idCliente = request.getParameter("idCliente");
        String idServico = request.getParameter("idServico");
        String mensagem = "";
        
        Agendamento a = new Agendamento();
        if(!idAgendamento.isEmpty()){
            a.setIdAgendamento(Integer.parseInt(idAgendamento));
        }
        if(data.equals("")||hora.equals("")||idUsuario.equals("")||idCliente.equals("")||idServico.equals("")){
            mensagem = "Campos obrigatórios devem ser preenchidos!";
        }else{
            a.setData(data);
            a.setHora(hora);
            Usuario u = new Usuario();
            u.setIdUsuario(Integer.parseInt(idUsuario));
            a.setUsuario(u);
            Cliente c = new Cliente();
            c.setIdCliente(Integer.parseInt(idCliente));
            a.setCliente(c);
            Servico s = new Servico();
            s.setIdServico(Integer.parseInt(idServico));
            a.setServico(s);
            try{
                AgendamentoDAO aDAO = new AgendamentoDAO();
                if(aDAO.gravar(a)){
                    mensagem = "Gravado com sucesso!";
                }else{
                    mensagem = "Erro ao gravar o Agendamento no Banco de Dados!";
                }
            }catch(Exception e){
                out.print(e);
                mensagem = "Erro ao executar";
            }
            out.println("<script type='text/javascript'>");
            out.println("alert('" + mensagem + "');");
            out.println("location.href='lista_agendamento.jsp';");
            out.println("</script>");
        } 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
