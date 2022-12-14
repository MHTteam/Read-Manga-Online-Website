<%@page import="com.mangahub.User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="./home">
                        <img src="img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a href="./home">Homepage</a></li>
                            <li><a href="./categories">Categories <span class="arrow_carrot-down"></span></a>
                                <ul class="dropdown">
                                    <li><a href="./categories.jsp">Categories</a></li>
                                    <li><a href="./manga-details.jsp">Manga Details</a></li>
                                    <li><a href="./manga-reading.jsp">Manga Reading</a></li>
                                    <li><a href="./blog-details.jsp">Blog Details</a></li>
                                    <li><a href="./signup.jsp">Sign Up</a></li>
                                    <li><a href="./login.jsp">Login</a></li>

                                </ul>
                            </li>
                            <li><a href="./blog">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                
                    
                        <%!UserDTO usersession;%>
                        <%
                            usersession = (UserDTO) session.getAttribute("user");
                            if (usersession == null) {

                        %>
                        <div class="header__right" style="padding: 0; margin: 0; color: #ffffff; text-align: right">
                                <nav class="header__menu mobile-menu">
                                    <ul>
                                        <li><a href="#" class="search-switch"><span class="icon_search"></span></a></li>
                                        <li><a href="./login"><span class="icon_profile"></span></a></li>
                                    </ul>
                                </nav>
                            </div>
                        <%                        
                            } else { %>
                            <div class="header__right" style="padding: 0; margin: 0; color: #ffffff; text-align: right">
                                <nav class="header__menu mobile-menu">
                                    <ul>
                                        <li><a href="#" class="search-switch"><span class="icon_search"></span></a></li>
                                        <li><a href="./home"><span class="icon_profile"></a>
                                            <ul class="dropdown">
                                                <li><a href="./">Trang c?? nh??n</a></li>
                                                <li><a href="./">Truy???n y??u th??ch</a></li>
                                                <li><a href="./">????ng xu???t</a></li>
                                            </ul> 
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        <%
                            }
                        %>
                    

                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>

