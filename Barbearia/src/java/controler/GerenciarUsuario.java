package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Henrique
 */
public class GerenciarUsuario extends HttpServlet {

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

        // out serve para imprimir as mensagens de sucesso e de erro
        PrintWriter out = response.getWriter();

        // RECEBENDO PARAMETROS
        String acao = request.getParameter("acao");
        String idUsuario = request.getParameter("idUsuario");

        String mensagem = "";

        try {
            Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            if (acao.equals("alterar")) {
                // vai verificar se o usuario tem permissao 
                //if (GerenciarLogin.verificarPermissao(request, response)) {
                    u = uDAO.getCarregaPorID(Integer.parseInt(idUsuario));
                    if (u.getIdUsuario() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_usuario.jsp");
                        request.setAttribute("usuario", u);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Usuário não encontrado";
                    }
                //} else {
                //    mensagem = "Acesso negado!";
                //}
            }
            if (acao.equals("deletar")) {
               // if (GerenciarLogin.verificarPermissao(request, response)) {
                    u.setIdUsuario(Integer.parseInt(idUsuario));
                    if (uDAO.deletar(u)) {
                        mensagem = "Inativado com sucesso!";
                    } else {
                        mensagem = "Erro ao inativar usuário";
                    }
               // } else {
               //     mensagem = "Acesso negado!";
                //}
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_usuario.jsp';");
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
        String idUsuario = request.getParameter("idUsuario");
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String status = request.getParameter("status");
        String idPerfil = request.getParameter("idPerfil");

        String mensagem = "";

        Usuario u = new Usuario();
        if (!idUsuario.isEmpty()) {
            u.setIdUsuario(Integer.parseInt(idUsuario));
        }
        if (nome.equals("") || login.equals("") || senha.equals("") || idPerfil.equals("")) {
            mensagem = "Campos obrigatórios devem ser preenchidos!";
        } else {
            u.setNome(nome);
            u.setLogin(login);
            u.setSenha(senha);
            u.setStatus(Integer.parseInt(status));
            Perfil p = new Perfil();
            p.setIdPerfil(Integer.parseInt(idPerfil));
            u.setPerfil(p);
            try {
                UsuarioDAO uDAO = new UsuarioDAO();
                if (uDAO.gravar(u)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados";
                }
            } catch (Exception e) {
                out.print(e);
                mensagem = "Erro ao executar";
            }
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "');");
        out.println("location.href='lista_usuario.jsp';");
        out.println("</script>");
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
