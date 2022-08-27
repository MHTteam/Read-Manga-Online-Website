<%-- 
    Document   : main
    Created on : Aug 19, 2022, 3:46:12 PM
    Author     : tri
--%>

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

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="hero__slider owl-carousel">
                    <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="hero__text">
                                    <div class="label">Adventure</div>
                                    <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                    <p>After 30 days of travel across the world...</p>
                                    <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="hero__text">
                                    <div class="label">Adventure</div>
                                    <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                    <p>After 30 days of travel across the world...</p>
                                    <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="hero__text">
                                    <div class="label">Adventure</div>
                                    <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                    <p>After 30 days of travel across the world...</p>
                                    <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <jsp:include page="top-rating.jsp" />
                        <jsp:include page="most-viewed.jsp" />
                        <jsp:include page="recent-manga.jsp" />
                        <jsp:include page="live-product.jsp" />
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <jsp:include page="manga-sidebar.jsp" />
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

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