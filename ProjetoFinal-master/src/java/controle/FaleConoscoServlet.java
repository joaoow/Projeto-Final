/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.FaleConosco;
import modelo.Servico;

/**
 *
 * @author sala303b
 */
@WebServlet(name = "FaleConoscoServlet", urlPatterns = {"/FaleConoscoServlet"})
public class FaleConoscoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("acao").equals("Atualizar")) {
           long idfalec = Long.parseLong(request.getParameter("idfalec"));
            String nome = (request.getParameter("nome"));
            String email = (request.getParameter("email"));
            String dddtelefone = (request.getParameter("dddtelefone"));      
            String uf = (request.getParameter("uf"));
            String cidade = (request.getParameter("cidade"));
            String descricao = (request.getParameter("descricao"));
         
           
            FaleConosco fc = new FaleConosco();
            fc.setId(idfalec);
            fc.setNome(nome);
            fc.setEmail(email);
            fc.setUf(uf);
            fc.setCidade(cidade);
            fc.setDescricao(descricao);
            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);
            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }
            fc.setDdd(ddd);
            fc.setTelefone(telefone);

            boolean atualizou = fc.Atualizar();

            if (atualizou) {
//            idproduto = 1,ou 2,ou 3, etc.
//            request.setAttribute("idproduto", novoId);
//            request.getRequestDispatcher("listar.jsp")
//                    .forward(request, response);
                response.sendRedirect("admin/listarservico.jsp");
            } else {
                String mensagem
                        = "<h1>Atualização não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }

        } else if (request.getParameter("acao").equals("deletar")) {

            Servico ser = new Servico();
            ser.setId(Long.parseLong(request.getParameter("idservico")));

            boolean apagou = ser.Excluir();

            if (apagou) {
                response.sendRedirect("admin/listarservico.jsp");
            } else {
                String mensagem
                        = "<h1>Exclusão não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        } else {
            String nome = (request.getParameter("nome"));
            String email = (request.getParameter("email"));
            String dddtelefone = (request.getParameter("dddtelefone"));      
            String uf = (request.getParameter("uf"));
            String cidade = (request.getParameter("cidade"));
            String descricao = (request.getParameter("descricao"));
         
           
            FaleConosco fc = new FaleConosco();
            
            fc.setNome(nome);
            fc.setEmail(email);
            fc.setUf(uf);
            fc.setCidade(cidade);
            fc.setDescricao(descricao);
            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);
            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }
            fc.setDdd(ddd);
            fc.setTelefone(telefone);

            long novoId = fc.Cadastrar();
            //cadastrou == true 

            if (novoId > 0) {
                request.setAttribute("idfalec", fc.getId());
                response.sendRedirect("tela/index.jsp");
                

            } else {
                request.setAttribute("idfalec", fc.getId());
//                request.getRequestDispatcher("admin/index.jsp")//"tela/cadastrar.jsp"
//                        .forward(request, response);
                 response.sendRedirect("tela/faleconosco.jsp?auth=false");
            }

        }

    }


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
        processRequest(request, response);
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
        processRequest(request, response);
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
