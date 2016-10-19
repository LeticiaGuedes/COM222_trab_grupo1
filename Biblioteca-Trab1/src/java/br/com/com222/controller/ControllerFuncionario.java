/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.controller;

import br.com.com222.jdbc.dao.AssociadoDao;
import br.com.com222.model.Associado;
import br.com.com222.model.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wallace
 */

@WebServlet(name = "ControllerFuncionario", loadOnStartup = 1, urlPatterns = {"/cad_associado", "/cad_publicacao", "/cad_exemplar", "/ver_publicacao", "/cad_emprestimo", "/cad_devolucao", "/rel_atraso"})
public class ControllerFuncionario extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {

        Funcionario fc = (Funcionario) request.getSession().getAttribute("funcionario");

        //verifica login
        if (fc == null) {
            response.sendRedirect("");
        }

        String userPath = request.getServletPath();
        String acao = request.getParameter("acao");

        if (acao == null) {

            String url = "/WEB-INF/View/"+userPath+".jsp";
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            
        } else {
            switch (userPath) {
                case "/cad_associado":
                    
                    break;
                case "/cad_publicacao":
                        
                    break;
                case "/cad_exemplar":
                    
                    break;
                case "/ver_publicacao":
                    
                    break;
                case "/cad_emprestimo":
                    
                    break;
                case "/cad_devolucao":
                    
                    break;
                case "/rel_atraso":
                    
                    break;
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControllerFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControllerFuncionario.class.getName()).log(Level.SEVERE, null, ex);
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

    protected void cad_associado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int cod = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String senha = request.getParameter("senha");
        String status = request.getParameter("status");

        Associado assoc = new Associado(cod, nome, endereco, email, senha, status, null);

        AssociadoDao ad = new AssociadoDao();
        ad.cadastro(assoc);

        RequestDispatcher rd = request.getRequestDispatcher("/ok.jsp");
        rd.forward(request, response);
    }
}
