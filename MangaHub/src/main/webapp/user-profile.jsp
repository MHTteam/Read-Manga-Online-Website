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
        <link rel="stylesheet" href="css/styleUserProfile.css" type="text/css" />
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
                            <h2>Thông tin cá nhân</h2>
                            <p>Xin chào ${sessionScope.user.getNickName()}.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Normal Breadcrumb End -->

        <!-- Profile option Begin -->
        <section class="sidebar">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="sidebar-options">
              <ul>
                <li class="sidebar-option sidebar-option--active">
                  <a href="./user?option=1">Thông tin cá nhân</a>
                </li>
                <li class="sidebar-option">
                  <a href="./user?option=2">Bookmark</a>
                </li>
                <li class="sidebar-option">
                  <a href="./user?option=3">Danh sách truyện</a>
                </li>
                <li class="sidebar-option">
                  <a href="./user?option=4">Lịch sử đọc</a>
                </li>
                <li class="sidebar-option">
                  <a href="./user?option=5">Bình luận</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="sidebar-option--content">
              <p>
                Guests and logged-in users Features:<br />
                Guests:<br />

                View mangas by criterias (Recent updated, top rating,
                recommended,...)<br />
                Search mangas by preferences (Name, author, category,...)<br />
                Sort mangas criterias (Name, publish date, views, rating,...)<br />
                View mangas of a category (Fantasy, slice of life,...)<br />
                View comments on mangas<br />

                Users:<br />

                Edit personal account profile<br />
                Give likes, comments and ratings on mangas<br />
                Add mangas to their favorite manga list<br />
                Request to be a manga uploader<br />
                Create and manage user groups<br />
                Join user groups<br />

                Uploaders:<br />

                Upload mangas to the website<br />
                Manage mangas they uploaded (Edit, update,...)<br />

                Admins:<br />

                Manage users (Ban/Unban, assign roles,...)<br />
                Manage mangas (Process requests, delete, update, edit,...)<br />
                Manage groups (Process requests, delete, update, edit,...)<br />

                Advanced Features:<br />
                Find forgotten password/password reset<br />
                Login with outside account (Google, Facebook)<br />

                Targeted customers:
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
        <!-- Profile option End -->

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