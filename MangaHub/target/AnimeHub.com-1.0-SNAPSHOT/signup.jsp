<%-- 
    Document   : signup
    Created on : Aug 19, 2022, 3:48:04 PM
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
                            <h2>Sign Up</h2>
                            <p>Welcome to the official Anime blog.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Normal Breadcrumb End -->

        <!-- Signup Section Begin -->
        <section class="signup spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login__form">
                            <h3>Đăng kí</h3>
                            <form action="./signup" id="signupForm">
                                <div class="input__item">
                                    <input type="text" placeholder="* Địa chỉ email" name="email" id = "email" value = ${email}>
                                    <span class="icon_mail"></span>
                                </div>
                                <p id="checkEmail" style="display:none; color: red; font-weight: bold;">Email không được bỏ trống.</p>
                                <div class="input__item">
                                    <input type="text" placeholder="* Tên đăng nhập" name="userName" id = "userName" value = ${userName}>
                                    <span class="icon_profile"></span>
                                </div>  
                                <p id="checkUserName" style="display:none; color: red; font-weight: bold;">Tên đăng nhập không được bỏ trống.</p>
                                <div class="input__item">
                                    <input type="password" placeholder="* Mật khẩu" name = "password" id="password" value = ${password}>
                                    <span class="icon_lock"></span>
                                </div>
                                <p id="checkPass" style="display:none; color: red; font-weight: bold;">Mật khẩu không được bỏ trống.</p>
                                <div class="input__item">
                                    <input type="password" placeholder="* Nhập lại mật khẩu" id = "re_password" value = ${re_password}>
                                    <span class="icon_lock"></span>
                                </div>
                                <p id="checkRePass" style="display:none; color: red; font-weight: bold;">Mật khẩu không khớp.</p>
                                <div class="input__item">
                                    <input type="text" placeholder="Nick name" name="nickName" value = ${nickName}>
                                    <span class="icon_profile"></span>
                                </div>
                                <div class="input__item" style = "color: white; font-weight: bold;">
                                    <p style = "color: white; font-weight: bold;">Giới tính</p>
                                    <input style=" height: 13px; width: 10%;" type="radio" name = "gender" id ="gender1" value = "Nam" checked="checked">
                                    <label for ="gender1" >Nam  </label>
                                    <input style=" height: 13px; width: 10%;" type="radio" name = "gender" id ="gender2" value = "Nữ">
                                    <label for ="gender1" >Nữ  </label>
                                    <input style=" height: 13px; width: 10%;" type="radio" name = "gender" id ="gender3" value = "Khác">
                                    <label for ="gender1" >Khác  </label>
                                    <span class="icon_profile"></span>
                                </div>


                                <button onclick ="check()" type="button" class="site-btn">Đăng kí</button>
                            </form>
                            <h5>Đã có tài khoản? <a href="login.jsp">Đăng nhập!</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <h3>Đăng nhập với:</h3>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                                </li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Signup Section End -->

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

        <script>
                                    function check() {
                                        var form = document.getElementById("signupForm");
                                        var email = document.getElementById("email");
                                        var userName = document.getElementById("userName");
                                        var password = document.getElementById("password");
                                        var re_password = document.getElementById("re_password");
                                        var isValid = "true";

                                        if (email.value === "") {
                                            document.getElementById("checkEmail").style.display = "block";
                                            isValid = "false";
                                        }

                                        if (userName.value === "") {
                                            document.getElementById("checkUserName").style.display = "block";
                                            isValid = "false";
                                        }

                                        if (password.value === "") {
                                            document.getElementById("checkPass").style.display = "block";
                                            isValid = "false";
                                        }

                                        if (password.value !== re_password.value) {
                                            document.getElementById("checkRePass").style.display = "block";
                                            isValid = "false";
                                        }

                                        if (isValid === "true") {
                                            form.submit();
                                        }
                                    }
        </script>

    </body>

</html>
