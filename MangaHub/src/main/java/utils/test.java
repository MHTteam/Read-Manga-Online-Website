/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author MINH TRI
 */
@WebServlet(name = "test", urlPatterns = {"/test"})
@javax.servlet.annotation.MultipartConfig
public class test extends HttpServlet {

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
        
        
        String dir;
        dir  = request.getServletContext().getRealPath("test");
        
        String path[] = dir.split("target");
                dir = path[0];

                dir += "src\\main\\webapp";
                dir += "\\img";
                File img = new File(dir);
                if (!img.exists()) {
                    img.mkdir();
                }
                dir += "\\avatar";
                File avatar = new File(dir);
                if (!avatar.exists()) {
                    avatar.mkdir();
                }
                dir += "\\" + "tri";
                File image = new File(dir);
                if (!image.exists()) {
                    image.mkdir();
                }
                //Lấy đường dẫn tương đối

                Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">

                String fileName = "avatar";
                File file = File.createTempFile(fileName, ".png", image);

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                Path source = Paths.get(dir + "\\" + file.getName());

                Files.move(source, source.resolveSibling("avatar.png"),
                        StandardCopyOption.REPLACE_EXISTING);
        
        
        request.setAttribute("path", dir);
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
