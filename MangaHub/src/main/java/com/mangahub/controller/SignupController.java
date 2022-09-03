/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.controller;

import com.mangahub.User.UserDAO;
import com.mangahub.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tri
 */
public class SignupController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String nickName = request.getParameter("nickName");
        String gender = request.getParameter("gender");

        if (userName == null && email == null && password == null && nickName == null && gender == null) {
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.forward(request, response);
        } else {

            boolean matchEmail = email.matches("^[a-z][a-z0-9_\\.]{5,32}@gmail.com$");
            if (!matchEmail) {
                request.setAttribute("email", email);
                request.setAttribute("userName", userName);
                request.setAttribute("passWord", password);
                request.setAttribute("nickName", nickName);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {
                //khong nhap nick name thi mac dinh nick name la ten gmail
                if (nickName == null || nickName.trim().equals("")) {
                    String txt[] = email.split("@");
                    nickName = txt[0];
                }

                UserDAO registerDAO = new UserDAO();
                UserDTO user = registerDAO.signUp(email, userName, password, nickName, gender);
                //neu khong dang ki duoc thi gui loi ve trang dang ki
                if (user == null) {
                    request.setAttribute("email", email);
                    request.setAttribute("userName", userName);
                    request.setAttribute("nickName", nickName);
                    request.setAttribute("signupError", "Tên đăng nhập hoặc gmail đã tồn tại");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("home");

                }
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
