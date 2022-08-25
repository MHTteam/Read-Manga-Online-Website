package com.mangahub.controller;

import com.mangahub.Author.AuthorDAO;
import com.mangahub.Author.AuthorDTO;
import com.mangahub.Category.CategoryDAO;
import com.mangahub.Category.CategoryDTO;
import com.mangahub.Chapter.ChapterDAO;
import com.mangahub.Chapter.ChapterDTO;
import com.mangahub.Image.ImageDAO;
import com.mangahub.Image.ImageDTO;
import com.mangahub.Manga.MangaDAO;
import com.mangahub.Manga.MangaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tri
 */
public class MangaController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            MangaDAO mangaDAO = new MangaDAO();
            AuthorDAO authorDAO = new AuthorDAO();
            ChapterDAO chapterDAO = new ChapterDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            ImageDAO imageDAO = new ImageDAO();

            String action = request.getParameter("action");
            String url = "";
            switch (action) {
                case "detail":
                    url = "manga-details.jsp";
                    int mangaID = Integer.parseInt(request.getParameter("mangaID"));
                    
                    MangaDTO manga = mangaDAO.loadManga(mangaID);
                    AuthorDTO author = authorDAO.loadAuthor(manga.getAuthor());
                    ArrayList<ChapterDTO> chapterList = chapterDAO.loadChapters(mangaID);
                    ArrayList<CategoryDTO> mangaCategories = cateDAO.loadMangaCategories(mangaID);
                    
                    request.setAttribute("manga", manga);
                    request.setAttribute("author", author);
                    request.setAttribute("chapterList", chapterList);
                    request.setAttribute("mangaCategories", mangaCategories);
                    break;
                case "read":
                    url = "manga-reading.jsp";
                    mangaID = Integer.parseInt(request.getParameter("mangaID"));
                    int chapterID = Integer.parseInt(request.getParameter("chapterID"));  
                    
                    manga = mangaDAO.loadManga(mangaID);
                    chapterList = chapterDAO.loadChapters(mangaID);
                    ArrayList<ImageDTO> imageList = imageDAO.loadChapterImages(chapterID);
                    
                    request.setAttribute("chapterID", chapterID);
                    request.setAttribute("manga", manga);
                    request.setAttribute("chapterList", chapterList);
                    request.setAttribute("imageList", imageList);
                    break;
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
