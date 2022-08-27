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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tri
 */
public class UserProfileController extends HttpServlet {

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
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equalsIgnoreCase("changePass")) {
                String userName = request.getParameter("userName");
                String oldPass = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                UserDAO dao = new UserDAO();
//                request.setAttribute("oldPass", oldPass);
//                request.setAttribute("newPass", newPassword);
                if (dao.changePass(userName, newPassword)) {
                    request.setAttribute("changePassMess", "Đổi mật khẩu thành công");
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    user.setPassword(newPassword);
                    session.setAttribute("user", user);
                } else {
                    request.setAttribute("changePassMess", "Có lỗi xảy ra khi đổi mật khẩu");
                }

            } else if (action.equalsIgnoreCase("changeInfor")) {
                String nickName = request.getParameter("nickName");
                String gender = request.getParameter("gender");
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                String userName = user.getUserName();
                UserDAO dao = new UserDAO();

                //truong hop nick name khong thay doi => chi update gender
                if (nickName == null || nickName.trim().equalsIgnoreCase("") || nickName.equalsIgnoreCase(user.getNickName())) {

                    if (dao.changeProfile(userName, gender)) {
                        request.setAttribute("changeInforMess", "Lưu thông tin thành công.");
                        user.setGender(gender);
                        session.setAttribute("user", user);
                    } else {
                        request.setAttribute("changeInforMess", "Có lỗi xảy ra.");
                    }
                } //truong hop doi nick name
                else {
                    
                    if (dao.changeProfile(userName, nickName, gender)) {
                        request.setAttribute("changeInforMess", "Lưu thông tin thành công.");
                        user.setNickName(nickName);
                        user.setGender(gender);
                        session.setAttribute("user", user);
                    } else {
                        request.setAttribute("changeInforMess", "Nick name đã tồn tại.");
                    }
                }
            }
        }

        request.getRequestDispatcher("user-profile.jsp").forward(request, response);
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
