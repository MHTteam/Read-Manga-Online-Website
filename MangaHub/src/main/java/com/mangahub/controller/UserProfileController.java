/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.controller;

import com.mangahub.User.UserDAO;
import com.mangahub.User.UserDTO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author tri
 */
@javax.servlet.annotation.MultipartConfig //fix bug multipart file when using Filter
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
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

//        if(user == null) {
//            response.sendRedirect("login");
//            return;
//        }
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

                    user.setPassword(newPassword);
                    session.setAttribute("user", user);
                } else {
                    request.setAttribute("changePassMess", "Có lỗi xảy ra khi đổi mật khẩu");
                }

            } else if (action.equalsIgnoreCase("changeInfor")) {
                String nickName = request.getParameter("nickName");
                String gender = request.getParameter("gender");
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
            } else if (action.equalsIgnoreCase("updateAvatar")) {

                //Lấy đường dẫn tương đối
                String dir;

                dir = request.getServletContext().getRealPath("index.jsp");
                String path[] = dir.split("MangaHub");
                dir = path[0];

//                dir += "src\\main\\webapp";
                dir += "\\images";
                File img = new File(dir);
                if (!img.exists()) {
                    img.mkdir();
                }
                dir += "\\avatar";
                File avatar = new File(dir);
                if (!avatar.exists()) {
                    avatar.mkdir();
                }
                dir += "\\" + user.getUserName();
                File image = new File(dir);
                if (!image.exists()) {
                    image.mkdir();
                }
                //Lấy đường dẫn tương đối

                String fileName = "avatar";
                File file = File.createTempFile(fileName, ".png", image);

                try {
                    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
                    try (InputStream input = filePart.getInputStream()) {
                        Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                Path source = Paths.get(file.getParentFile() + "\\" + file.getName());

                Files.move(source, source.resolveSibling("avatar.png"),
                        StandardCopyOption.REPLACE_EXISTING);

//                request.setAttribute("path", file.getAbsolutePath());

                String url = "images/avatar/" + user.getUserName() + "/avatar.png";
                UserDAO dao = new UserDAO();
                if (dao.changeAvatar(url, user.getUserName())) {
                    user.setAvatarURL(url);
                    session.setAttribute("user", user);
                }

            } else if (action.equalsIgnoreCase("logout")) {
                session.setAttribute("user", null);
                response.sendRedirect("login");
                return;
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
