<%-- 
    Document   : main
    Created on : Aug 19, 2022, 3:46:12 PM
    Author     : tri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mangahub.Image.ImageDTO"%>
<%@page import="com.mangahub.Chapter.ChapterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mangahub.Manga.MangaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

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
            ArrayList<ChapterDTO> chapterList;
            ArrayList<ImageDTO> imageList;
        %>
        <!-- Catch request attributes -->
        <%
            manga = (MangaDTO) request.getAttribute("manga");
            chapterList = (ArrayList<ChapterDTO>) request.getAttribute("chapterList");
            imageList = (ArrayList<ImageDTO>) request.getAttribute("imageList");
        %>
        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <a href="./categories.html">Categories</a>
                            <a href="#">Romance</a>
                            <span>Fate Stay Night: Unlimited Blade</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Anime Section Begin -->
        <section class="anime-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!--                    <div class="anime__video__player">
                                                <video id="player" playsinline controls data-poster="./videos/anime-watch.jpg">
                                                    <source src="videos/1.mp4" type="video/mp4" />
                                                     Captions are optional 
                                                    <track kind="captions" label="English captions" src="#" srclang="en" default />
                                                </video>
                                            </div>
                                            <div class="anime__details__episodes">
                                                <div class="section-title">
                                                    <h5>List Name</h5>
                                                </div>
                                                <a href="#">Ep 01</a>
                                                <a href="#">Ep 02</a>
                                                <a href="#">Ep 03</a>
                                                <a href="#">Ep 04</a>
                                                <a href="#">Ep 05</a>
                                                <a href="#">Ep 06</a>
                                                <a href="#">Ep 07</a>
                                                <a href="#">Ep 08</a>
                                                <a href="#">Ep 09</a>
                                                <a href="#">Ep 10</a>
                                                <a href="#">Ep 11</a>
                                                <a href="#">Ep 12</a>
                                                <a href="#">Ep 13</a>
                                                <a href="#">Ep 14</a>
                                                <a href="#">Ep 15</a>
                                                <a href="#">Ep 16</a>
                                                <a href="#">Ep 17</a>
                                                <a href="#">Ep 18</a>
                                                <a href="#">Ep 19</a>
                                            </div>-->
                        <!-- Edit CSS here -->
                        <div class="chapter-images">
                            <c:if test="${not empty requestScope.imageList}">
                                <!-- Please Edit image display -->
                                <c:forEach var="image" items="${requestScope.imageList}" varStatus="loop">
                                    <<img src="${image.imageURL}" alt="${image.imageNumber}"/>
                                </c:forEach>
                            </c:if>
                        </div>
                        <br>
                        <div class="chapter-navigator">
                            <div class="anime__details__btn">
                                <div class="col-lg-4">
                                    <a href="#" class="follow-btn">Previous Chapter</a>
                                </div>
                                <div class="col-lg-4">
                                    <a href="#" class="follow-btn">Next Chapter</a>
                                </div>
                                <br>
                                <div class="col-lg-4">
                                    <select class="chapter-select" onchange="window.location = this.options[this.selectedIndex].value;">
                                        <c:forEach var="chapter" items="${requestScope.chapterList}" varStatus="loop">
                                            <option value="manga?action=read&mangaID=${requestScope.manga.mangaID}&chapterID=${chapter.chapterID}" <c:if test="${chapter.chapterNumber == requestScope.chapterID}">selected</c:if>>
                                                ${chapter.chapterName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- Edit CSS end here -->
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="anime__details__review">
                            <div class="section-title">
                                <h5>Reviews</h5>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-1.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Chris Curry - <span>1 Hour ago</span></h6>
                                    <p>whachikan Just noticed that someone categorized this as belonging to the genre
                                        "demons" LOL</p>
                                </div>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-2.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Lewis Mann - <span>5 Hour ago</span></h6>
                                    <p>Finally it came out ages ago</p>
                                </div>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-3.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Louis Tyler - <span>20 Hour ago</span></h6>
                                    <p>Where is the episode 15 ? Slow update! Tch</p>
                                </div>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-4.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Chris Curry - <span>1 Hour ago</span></h6>
                                    <p>whachikan Just noticed that someone categorized this as belonging to the genre
                                        "demons" LOL</p>
                                </div>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-5.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Lewis Mann - <span>5 Hour ago</span></h6>
                                    <p>Finally it came out ages ago</p>
                                </div>
                            </div>
                            <div class="anime__review__item">
                                <div class="anime__review__item__pic">
                                    <img src="img/anime/review-6.jpg" alt="">
                                </div>
                                <div class="anime__review__item__text">
                                    <h6>Louis Tyler - <span>20 Hour ago</span></h6>
                                    <p>Where is the episode 15 ? Slow update! Tch</p>
                                </div>
                            </div>
                        </div>
                        <div class="anime__details__form">
                            <div class="section-title">
                                <h5>Your Comment</h5>
                            </div>
                            <form action="#">
                                <textarea placeholder="Your Comment"></textarea>
                                <button type="submit"><i class="fa fa-location-arrow"></i> Review</button>
                            </form>
                        </div>
                    </div>
                </div>
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