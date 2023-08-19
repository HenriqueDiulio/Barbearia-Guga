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
import model.Cliente;
import model.ClienteDAO;


/**
 *
 * @author Henrique
 */
public class GerenciarCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        
        String idCliente = request.getParameter("idCliente");
        String mensagem = "";
        try{
            Cliente c = new Cliente();
            ClienteDAO cDAO = new ClienteDAO();
            if(acao.equals("alterar")){
                //if(GerenciarLogin.verificarPermissao(request, response)){
                    c = cDAO.getCarregaPorId(Integer.parseInt(idCliente));
                    if(c.getIdCliente()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_cliente.jsp");
                        request.setAttribute("cliente", c);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Cliente não encontrado!";
                    }
                //}else{
                 //   mensagem = "Acesso negado!";
                //}
            }
            if(acao.equals("deletar")){
                //if (GerenciarLogin.verificarPermissao(request, response)) {
                    c.setIdCliente(Integer.parseInt(idCliente));
                    if (cDAO.deletar(c)) {
                        mensagem = "Cliente excluído com sucesso!";
                    } else {
                        mensagem = "Erro ao excluir o Cliente do Banco de Dados";
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
        out.println("location.href='lista_cliente.jsp';");
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
        String idCliente = request.getParameter("idCliente");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        
        String mensagem = "";
        
        Cliente c = new Cliente();
        if(!idCliente.isEmpty()){
            c.setIdCliente(Integer.parseInt(idCliente));
        }
        if(nome.equals("")||telefone.equals("")||endereco.equals("")||email.equals("")){
            mensagem = "Campos obrigatórios devem ser preenchidos!";
        }else{
            System.out.println("ENTROU AQUI");
            c.setNome(nome);
            c.setTelefone(telefone);
            c.setEndereco(endereco);
            c.setEmail(email);
            System.out.println("PASSOU AQUI AQUI");
            try{
                
                ClienteDAO cDAO = new ClienteDAO();
                if(cDAO.gravar(c)){
                    System.out.println("GRAVOU AQUI");
                    mensagem = "Gravado com sucesso!";
                }else{
                    System.out.println("ERROU AQUI");
                    mensagem = "Erro ao gravar o Cliente no Banco de Dados!";
                    
                }
            }catch(Exception e){
                out.print(e);
                mensagem = "Erro ao executar";
            }
            out.println("<script type='text/javascript'>");
            out.println("alert('" + mensagem + "');");
            out.println("location.href='lista_cliente.jsp';");
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
