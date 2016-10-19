/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.controller;

import br.com.com222.jdbc.dao.AssociadoDao;
import br.com.com222.jdbc.dao.ExemplarDao;
import br.com.com222.jdbc.dao.PublicacaoDao;
import br.com.com222.model.Associado;
import br.com.com222.model.Exemplar;
import br.com.com222.model.Funcionario;
import br.com.com222.model.Publicacao;
import java.io.IOException;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wallace
 */
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

        
        
        Funcionario fc = (Funcionario) request.getSession().getAttribute("userFuncionario");
        String userPath = request.getServletPath();

        //verifica login
        if (fc == null) {
            response.sendRedirect("");
        }

        String acao = request.getParameter("acao");

        if (acao == null) {

            String url = "/WEB-INF/View/" + userPath + ".jsp";

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

        } else {
            switch (userPath) {
                case "/cad_associado":
                    cad_associado(request, response);
                    break;
                case "/cad_publicacao":
                    cad_publicacao(request, response);
                    break;
                case "/cad_exemplar":
                    cad_exemplar(request, response);
                    break;
                case "/ver_publicacao":
                    ver_publicacao(request, response);
                    break;
                case "/cad_emprestimo":
                    cad_emprestimo(request, response);
                    break;
                case "/cad_devolucao":
                    cad_devolucao(request, response);
                    break;
                case "/rel_atraso":
                    rel_atraso(request, response);
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

    //<editor-fold>  Métodos de controle
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

        request.setAttribute("resposta", "Cadastro realizado com sucesso!");
        String url = "/WEB-INF/View/resposta.jsp";

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void cad_publicacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int isbn = Integer.parseInt(request.getParameter("isbn"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String editora = request.getParameter("editora");
        int ano = Integer.parseInt(request.getParameter("ano"));

        Publicacao pub = new Publicacao(isbn, titulo, autor, editora, ano);

        PublicacaoDao pd = new PublicacaoDao();
        pd.cadastro(pub);

        request.setAttribute("resposta", "Cadastro realizado com sucesso!");
        String url = "/WEB-INF/View/resposta.jsp";

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void cad_exemplar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String msg;
        int isbn = Integer.parseInt(request.getParameter("isbn"));
        int numero = Integer.parseInt(request.getParameter("numero"));
        float preco = Float.parseFloat(request.getParameter("preco"));

        PublicacaoDao pubDao = new PublicacaoDao();
        Publicacao pub = pubDao.consulta(isbn);

        if (pub == null) {
            msg = "Ops! Parece que a publicação do exemplar que você está tentando cadastrar não existe no nosso banco. "
                    + "Cadastre a publicação primeiro.";
        } else {

            ExemplarDao exDao = new ExemplarDao();
            int total = exDao.count(isbn);

            if (numero <= total) {
                total ++;
                msg = "Sinto muito, mas parece que o número do exemplar que você está tentando cadastrar já existe."
                        + "Por favor, siga a sequencia, o próximo número é "+total;
            } else {
                Exemplar ex = new Exemplar(numero, preco, 0, pub);
                
                exDao.cadastro(ex);

                msg = "Cadastro realizado com sucesso!";
            }

        }
        
        request.setAttribute("resposta", msg);
        String url = "/WEB-INF/View/resposta.jsp";

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void cad_emprestimo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO: implementação do cadastro de emprestimo <Letícia>

        request.setAttribute("resposta", "Cadastro realizado com sucesso!");
        String url = "/WEB-INF/View/resposta.jsp";

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void cad_devolucao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO: implementação do cadastro de devolução <Letícia>

        request.setAttribute("resposta", "Cadastro realizado com sucesso!");
        String url = "/WEB-INF/View/resposta.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void ver_publicacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("query");
        PublicacaoDao pd = new PublicacaoDao();
        List<Exemplar> listaExemp = pd.consulta(query);
        
        request.setAttribute("lista", listaExemp);
        
        String url = "/WEB-INF/View/ver_publicacao.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void rel_atraso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO: implementação relatório de devolução atrasada
        
        String url = "/WEB-INF/View/rel_atraso.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
    //</editor-fold>
}
