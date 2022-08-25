<%-- 
    Document   : main
    Created on : Aug 19, 2022, 3:46:12 PM
    Author     : tri
--%>

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
        %>

        <!-- Catch request attributes -->
        <%
            manga = (MangaDTO) request.getAttribute("manga");
            author = (AuthorDTO) request.getAttribute("author");
            chapterList = (ArrayList<ChapterDTO>) request.getAttribute("chapterList");
            mangaCategories = (ArrayList<CategoryDTO>) request.getAttribute("mangaCategories");
        %>

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <a href="./categories.html">Categories</a>
                            <span>Romance</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Anime Section Begin -->
        <section class="anime-details spad">
            <div class="container">
                <!-- Manga detail section -->
                <c:if test="${not empty requestScope.manga}">
                    <div class="anime__details__content">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="anime__details__pic set-bg" data-setbg="${requestScope.manga.coverImageURL}">
                                    <div class="comment"><i class="fa fa-comments"></i> 0</div>
                                    <div class="view"><i class="fa fa-eye"></i> ${requestScope.manga.view}</div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="anime__details__text">
                                    <div class="anime__details__title">
                                        <h3>${requestScope.manga.mangaName}</h3>
                                        <span>${requestScope.author.authorName}</span>
                                    </div>
                                    <div class="anime__details__rating">
                                        <div class="rating">
                                            <a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star"></i></a>
                                            <a href="#"><i class="fa fa-star-half-o"></i></a>
                                        </div>
                                        <span>${requestScope.manga.rating}</span>
                                    </div>
                                    <p>${requestScope.manga.description}</p>
                                    <div class="anime__details__widget">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <ul>
                                                    <li><span>Uploader:</span> ${requestScope.manga.uploader}</li>
                                                    <li><span>Publish Date:</span> ${requestScope.manga.publishDate}</li>
                                                    <li><span>Update Date:</span> ${requestScope.manga.updateDate}</li>
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
                                                    <li><span>Likes:</span> ${requestScope.manga.likeNumber}</li>
                                                    <li><span>Rating:</span> ${requestScope.manga.rating}</li>
                                                    <li>
                                                        <span>Group:</span> 
                                                        <c:if test="${not empty requestScope.manga.group}">
                                                            <span>${requestScope.manga.group}</span>
                                                        </c:if>
                                                        <c:if test="${empty requestScope.manga.group}">
                                                            <span>Updating</span>
                                                        </c:if>
                                                    </li>
                                                    <li><span>Views:</span> ${requestScope.manga.view}</li>
                                                    <li><span>Quality:</span> HD</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="anime__details__btn">
                                        <a href="#" class="follow-btn"><i class="fa fa-heart-o"></i> Favorite</a>
                                        <a href="#" class="follow-btn">Read First</a>
                                        <a href="#" class="follow-btn">Read Last</a>
                                    </div>
                                </div>
                            </div>
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
                                <th>Update Date</th>
                            </tr>
                            <c:forEach var="chapter" items="${requestScope.chapterList}" varStatus="loop">
                                <tr>
                                    <td>
                                        <a href="manga?action=read&mangaID=${requestScope.manga.mangaID}&chapterID=${chapter.chapterID}">
                                            ${chapter.chapterName}
                                        </a>
                                    </td>
                                    <td>${chapter.updateDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
                <!-- Temporary line break, please edit using CSS -->
                <br>   
                <div class="row">
                    <!-- Manga comment section -->
                    <div class="col-lg-8 col-md-8">
                        <div class="anime__details__form">
                            <div class="section-title">
                                <h5>Your Comment</h5>
                            </div>
                            <form action="#">
                                <textarea placeholder="Your Comment"></textarea>
                                <button type="submit"><i class="fa fa-location-arrow"></i> Review</button>
                            </form>
                        </div>
                        <!-- Temporary line break, please edit using CSS -->
                        <br>
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
                    </div>
                    <!-- Manga recommendation section -->
                    <div class="col-lg-4 col-md-4">
                        <div class="anime__details__sidebar">
                            <div class="section-title">
                                <h5>you might like...</h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-1.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-2.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-3.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-4.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                            </div>
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