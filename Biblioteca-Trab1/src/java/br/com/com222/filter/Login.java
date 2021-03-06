/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.filter;

import br.com.com222.jdbc.dao.AssociadoDao;
import br.com.com222.jdbc.dao.FuncionarioDao;
import br.com.com222.model.Associado;
import br.com.com222.model.Funcionario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author wallace
 */
@WebServlet(name = "Login", loadOnStartup = 1, urlPatterns = {"/funcionario", "/associado"})

public class Login extends HttpServlet {

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

        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String pass = request.getParameter("senha");
        String userPath = request.getServletPath();
        String url = null;
        

        if (userPath.equals("/loginFuncionario")) {

            FuncionarioDao fd = new FuncionarioDao();
            Funcionario funcionario = fd.login(codigo, pass);

            if (funcionario != null) {

                //cria uma nova sesssão
                request.getSession().invalidate();
                HttpSession sessao = request.getSession();
                sessao.setAttribute("userFuncionario", funcionario);
                

                url = "index_funcionario";

            } else {
                url = "login_funcionario.jsp?login=falha";
            }

        } else if (userPath.equals("/loginAssociado")) {
            AssociadoDao ad = new AssociadoDao();
            Associado associado = ad.login(codigo, pass);
            if (associado != null) {
                //cria nova sessão
                request.getSession().invalidate();
                HttpSession sessao = request.getSession();
                sessao.setAttribute("userAssociado", associado);
                
                url = "index_associado";

            } else {
                url = "login.jsp?login=falha";
            }
        }
        
        try {
            response.sendRedirect(url);
        } catch (Exception ex) {
            ex.printStackTrace();
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
