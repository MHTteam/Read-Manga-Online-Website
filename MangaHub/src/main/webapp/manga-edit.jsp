<%-- 
    Document   : main
    Created on : Aug 19, 2022, 3:46:12 PM
    Author     : tri
--%>

<%@page import="java.util.Collections"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mangahub.Category.CategoryDTO"%>
<%@page import="com.mangahub.Chapter.ChapterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mangahub.Author.AuthorDTO"%>
<%@page import="com.mangahub.Manga.MangaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Anime Template">
        <meta name="keywords" content="Anime, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Anime | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/plyr.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <jsp:include page="header.jsp" />
        <!-- Header End -->

        <!-- Declare attributes from servlet -->
        <%!
            MangaDTO manga;
            AuthorDTO author;
            ArrayList<ChapterDTO> chapterList;
            ArrayList<CategoryDTO> mangaCategories;
            ChapterDTO firstChapter, lastChapter;
        %>

        <!-- Catch request attributes -->
        <%
            manga = (MangaDTO) request.getAttribute("manga");
            author = (AuthorDTO) request.getAttribute("author");
            chapterList = (ArrayList<ChapterDTO>) request.getAttribute("chapterList");
            firstChapter = chapterList.get(0);
            lastChapter = chapterList.get(chapterList.size() - 1);
            Collections.sort(chapterList, Collections.reverseOrder());
            mangaCategories = (ArrayList<CategoryDTO>) request.getAttribute("mangaCategories");
        %>

        <!-- Anime Section Begin -->
        <section class="anime-details spad">
            <div class="container">
                <!-- Manga detail section -->
                <c:if test="${not empty requestScope.manga}">
                    <div class="anime__details__content">
                        <div class="row">
                            <!-- Edit Manga Cover -->
                            <div class="col-lg-3">
                                <div class="anime__details__pic set-bg" data-setbg="${requestScope.manga.coverImageURL}">
                                </div>
                                <div class="anime__details__btn">
                                    <h4>Thay Đổi Ảnh Bìa</h4>
                                    <form action="#" method="post" enctype="multipart/form-data">
                                        <input type="file" name="file" accept="image/png"/> <br/>
                                        <input type ="hidden" name="action" value="updateCover">
                                        <button class="follow-btn" type="submit">Tải lên</button>
                                    </form>
                                </div>
                            </div>
                            <!---->
                            <!-- Edit Manga Detail -->
                            <div class="col-lg-9">
                                <div class="anime__details__text">
                                    <div class="anime__details__title">
                                        <h3 style="text-align: center">Manga Detail</h3>
                                        <label style='color:#919191' for='mangaName'>Manga Name: </label>
                                        <input type="text" id='mangaName' name='mangaName' value='${requestScope.manga.mangaName}'/>
                                        <label style='color:#919191' for='authorName'>Author: </label>
                                        <input type="text" id='authorName' name='authorName' value='${requestScope.author.authorName}'/>
                                    </div>
                                    <label style='color:#919191' for='description'>Description: </label>
                                    <input type="text" id='description' name='description' value='${requestScope.manga.description}' size="1000"/>
                                    <div class="anime__details__widget">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <ul>
                                                    <label style='color:#919191' for='publishDate'>Publish Date: </label>
                                                    <input type="date" id='publishDate' name='publishDate' value='${requestScope.manga.publishDate}'/>
                                                    <label style='color:#919191' for='addedDate'>Added Date: </label>
                                                    <input type="date" id='addedDate' name='addedDate' value='${requestScope.manga.addedDate}'/>
                                                    <label style='color:#919191' for='updateDate'>Update Date: </label>
                                                    <input type="date" id='updateDate' name='updateDate' value='${requestScope.manga.updateDate}'/>
                                                    <li><span>Status:</span> ${requestScope.manga.status}</li>
                                                    <li>
                                                        <span>Genre:</span> 
                                                        <c:forEach var="cate" items="${requestScope.mangaCategories}" varStatus="loop">
                                                            <span><a href="#">${cate.cateName}</a></span>
                                                            </c:forEach>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <ul>
                                                    <li><span>Uploader:</span> ${requestScope.manga.uploader}</li>
                                                    <li>
                                                        <span>Group:</span> 
                                                        <c:if test="${not empty requestScope.manga.group}">
                                                            <span>${requestScope.manga.group}</span>
                                                        </c:if>
                                                        <c:if test="${empty requestScope.manga.group}">
                                                            <span>Updating</span>
                                                        </c:if>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!---->
                        </div>
                    </div>
                </c:if>
                <!-- Manga chapters list section -->
                <c:if test="${not empty requestScope.chapterList}">
                    <div class="section-title">
                        <h5>Chapters List</h5>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <th>Chapter Name</th>
                                <th>Chapter Index</th>
                                <th>Update Date</th>
                            </tr>
                            <c:forEach var="chapter" items="${chapterList}" varStatus="loop">
                                <tr>
                                    <td>
                                        <a href="manga?action=read&mangaID=${manga.mangaID}&chapterID=${chapter.chapterID}">
                                            ${chapter.chapterName}
                                        </a>
                                    </td>
                                    <td>${chapter.chapterNumber}</td>
                                    <td>${chapter.updateDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
                <!-- Temporary line break, please edit using CSS -->
                <br>   
            </div>
        </section>
        <!-- Anime Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp" />
        <!-- Footer Section End -->

        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search model end -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/player.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>