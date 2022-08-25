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

        <!-- Normal Breadcrumb Begin -->
        <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="normal__breadcrumb__text">
                            <h2>Đăng nhập</h2>
                            <p>Welcome to the official Anime blog.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Normal Breadcrumb End -->

        <!-- Login Section Begin -->
        <section class="login spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login__form">
                            <h3>Đăng nhập</h3>
                            <form action="./login" method="POST">
                                <div class="input__item">
                                    <input type="text" placeholder="Tên đăng nhập" name="username">
                                    <span class="icon icon_mail"></span>
                                </div>
                                <div class="input__item">
                                    <input type="password" placeholder="Mật khẩu" name="password">
                                    <span class="icon icon_lock"></span>
                                </div>
                                <div style="color:red; font-weight:bold;">${errorMessage}</div>
                                <button type="submit" class="site-btn">Đăng nhập</button>
                            </form>
                            <a href="#" class="forget_pass">Quên mật khẩu?</a>
                        </div>

                    </div>
                    <div class="col-lg-6">
                        <div class="login__register">
                            <h3>Chưa có tài khoản?</h3>
                            <a href="./signup" class="primary-btn">Đăng kí tài khoản</a>
                        </div>
                    </div>
                </div>
                <div class="login__social">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-6">
                            <div class="login__social__links">
                                <span>or</span>
                                <ul>
                                    <li><a href="https://www.facebook.com/profile.php?=75816879" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                            Facebook</a></li>
                                    <li><a href="https://google.com" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                    <li><a href="https://twitter.com/" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Login Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp" />
        <!-- Footer Section End -->

        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon icon_close"></i></div>
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