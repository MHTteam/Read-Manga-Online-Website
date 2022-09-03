<%-- 
    Document   : main
    Created on : Aug 19, 2022, 3:46:12 PM
    Author     : tri
--%>

<%@page import="com.mangahub.User.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <%--Khai báo biến--%>
        <%UserDTO user = (UserDTO) session.getAttribute("user");%>

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
        
        <c:if test = "${user != null}">

        <!-- Profile option Begin -->

        <section class="sidebar">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="sidebar-options">
                            <ul>
                                <li class="sidebar-option sidebar-option--active">
                                    <a href="#">Thông tin cá nhân</a>
                                </li>
                                <li class="sidebar-option">
                                    <a href="#">Bookmark</a>
                                </li>
                                <li class="sidebar-option">
                                    <a href="#">Danh sách truyện</a>
                                </li>
                                <li class="sidebar-option">
                                    <a href="#">Lịch sử đọc</a>
                                </li>
                                <li class="sidebar-option">
                                    <a href="#">Bình luận</a>
                                </li>
                                <li class="sidebar-option">
                                    <a href="./userprofile?action=logout">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="sidebar-option--content">
                            <div class="user-avatar">
                                <h3>Ảnh đại diện</h3>
                                <div class="user-avatar--image">
                                    <img
                                        src="<%=user.getAvatarURL()%>"
                                        alt="Ảnh đại diện"
                                        title="Avatar"
                                        />
                                </div>
                                <div>
                                    <p>PNG file</p>
                                    <form action="./userprofile" method="post" enctype="multipart/form-data">
                                        <input type="file" name="file" accept="image/png"/> <br />
                                        <input type ="hidden" name="action" value="updateAvatar">
                                        <button class="user-profile-button" type="submit">Tải lên</button>
                                    </form>
                                    <%--<p>Path: ${path}</p>--%>
                                </div>
                            </div>

                            <div class="user-informations">
                                <h3>Thông tin người dùng</h3>
                                <div class="user-information">
                                    <p style="font-weight: bold; color: yellow;">${changeInforMess}</p>
                                    <form action="./userprofile" method="post">
                                        
                                        <label for="nickName">Nick Name</label><br />
                                        <input
                                            type="text"
                                            name="nickName"
                                            placeholder="Nick Name"
                                            value ="<%=user.getNickName()%>"
                                            />

                                        <%--Phần nào không được thay đổi thì để trong class user-information--fixed--%>
                                        <p>Tên đăng nhập</p>
                                        <span class="user-information--fixed"><%=user.getUserName()%></span>

                                        <p>Email</p>
                                        <span class="user-information--fixed"><%=user.getEmail()%></span>

                                        <label for="gender">Giới tính</label>
                                        <select
                                            name="gender"
                                            class="user-information--selection"
                                            style="display: block; float: none; color: black"
                                            >
                                            <%--Toán tử 3 ngôi--%>
                                            <option value="Nam" <%=user.getGender().equalsIgnoreCase("Nam") ? "selected" : ""%>>Nam</option>
                                            <option value="Nữ" <%=user.getGender().equalsIgnoreCase("nữ") ? "selected" : ""%>>Nữ</option>
                                            <option value="Bí mật" <%=user.getGender().equalsIgnoreCase("bí mật") ? "selected" : ""%>>Bí mật</option>
                                        </select>

                                        <p>Ngày đăng kí</p>
                                        <span class="user-information--fixed"><%=user.getSignupDate()%></span
                                        ><br />

                                        <p>Nhấn nút lưu để cập nhật thông tin của bạn</p>
                                        <input type="hidden" name="action" value="changeInfor">
                                        <button class= "user-profile-button" type="submit">Lưu</button>
                                    </form>
                                </div>
                            </div>

                            <div class="user-password">
                                <h3>Đổi mật khẩu</h3> 
                                <p style="font-weight: bold; color: yellow;">${changePassMess}</p>
                                <form id="changePassword" class="user-password--form" action = "./userprofile" method="post">
                                    <lable for="oldPassword">Nhập mật khẩu cũ</lable><br />
                                    <input type="password" id = "oldPassword" name = "oldPassword" required <%--value="${oldPass}"--%>> <br />
                                    <p id="checkOldPass" style="color: red; font-weight: bold; display: none;">Mật khẩu cũ không khớp</p>
                                    <label for="newPassword">Nhập mật khẩu mới</label> <br/>
                                    <input type="password" name = "newPassword" id="newPassword" required <%--value = "${newPass}"--%>> <br />
                                    <label for="rePassword">Xác nhận mật khẩu mới</label> <br/>
                                    <input type="password" name = "rePassword" id="rePassword" required <%--value = "${newPass}"--%>> <br />
                                    <p id="checkPassFalse" style="color: red; font-weight: bold; display: none">Mật khẩu không khớp</p>
                                    <input type="hidden" name="action" value="changePass">
                                    <input type="hidden" name="userName" value="<%=user.getUserName()%>">
                                    <button onclick="checkPass('changePassword')" type="button" class= "user-profile-button">Đổi mật khẩu</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Profile option End -->
        
        </c:if>

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
        <c:if test = "${user != null}">
        <script>
            <%--Check password có hợp lệ hay không--%>
            function checkPass(id) {
                var form = document.getElementById(id);
                var pass = document.getElementById("newPassword").value;
                var rePass = document.getElementById("rePassword").value;
                var oldPass = document.getElementById("oldPassword").value;
                var userPass = "<%=user.getPassword()%>";
                var isValid = true;

                if (pass !== rePass) {
                    document.getElementById("checkPassFalse").style.display = "block";
                    isValid = false;
                } else {
                    document.getElementById("checkPassFalse").style.display = "none";
                } 
                
                if (oldPass !== userPass) {
                    document.getElementById("checkOldPass").style.display = "block";
                    isValid = false;
                } else {
                    document.getElementById("checkOldPass").style.display = "none";
                }
                
                if(isValid === true) {
                    form.submit();
                }
            }
        </script>
        </c:if>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/player.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


    </body>

</html>