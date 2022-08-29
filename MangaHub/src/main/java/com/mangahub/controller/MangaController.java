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
import java.util.Collections;
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

                    chapterList = chapterDAO.loadChapters(mangaID);
                    ChapterDTO chapter = chapterDAO.loadSingleChapter(chapterID);
                    ArrayList<ImageDTO> imageList = imageDAO.loadChapterImages(chapterID);
                    // declare previous and next chapters object
                    ChapterDTO previousChapter = null,
                     nextChapter = null;
                    // declare and assign indexes of first, last and current chapters
                    int firstChapterIndex = chapterList.get(0).getChapterNumber(),
                     lastChapterIndex = chapterList.get(chapterList.size() - 1).getChapterNumber(),
                     chapterIndex = -1;
                    // get current chapter index
                    for (int i = 0; i < chapterList.size(); i++) {
                        if(chapter.getChapterID() == chapterList.get(i).getChapterID()){
                            chapterIndex = i;
                        }
                    }
                    // assign and set next and previous chapters attributes to request 
                    if (chapterList.size() > 1) {
                        log("Manga has more than 1 chapters");
                        if (chapter.getChapterNumber() > firstChapterIndex) {
                            previousChapter = chapterList.get(chapterIndex - 1);
                            request.setAttribute("previousChapter", previousChapter);
                            log("Previous Chapter Name: " + previousChapter.getChapterName());
                        }
                        if (chapter.getChapterNumber() < lastChapterIndex) {
                            nextChapter = chapterList.get(chapterIndex + 1);
                            request.setAttribute("nextChapter", nextChapter);
                            log("Next Chapter Name: " + nextChapter.getChapterName());
                        }
                    }
                    request.setAttribute("chapter", chapter);
                    request.setAttribute("chapterList", chapterList);
                    request.setAttribute("imageList", imageList);
                    break;
                case "edit":
                    url = "manga-edit.jsp";
                    mangaID = Integer.parseInt(request.getParameter("mangaID"));

                    manga = mangaDAO.loadManga(mangaID);
                    author = authorDAO.loadAuthor(manga.getAuthor());
                    chapterList = chapterDAO.loadChapters(mangaID);
                    mangaCategories = cateDAO.loadMangaCategories(mangaID);

                    request.setAttribute("manga", manga);
                    request.setAttribute("author", author);
                    request.setAttribute("chapterList", chapterList);
                    request.setAttribute("mangaCategories", mangaCategories);
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
