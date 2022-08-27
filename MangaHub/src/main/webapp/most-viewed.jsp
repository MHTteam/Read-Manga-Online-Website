<%-- 
    Document   : popular-show
    Created on : Aug 22, 2022, 2:53:19 PM
    Author     : tri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="popular__product">
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-8">
            <div class="section-title">
                <h4>Most Viewed</h4>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="btn__all">
                <a href="#" class="primary-btn">View All <span class="arrow_right"></span></a>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Manga detail begin -->
        <c:if test="${not empty requestScope.mostView}">
            <c:forEach var="manga" items="${requestScope.mostView}" varStatus="loop">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${manga.coverImageURL}">
<!--                            <div class="ep">18 / 18</div>-->
                            <div class="comment"><i class="fa fa-star-o"></i> ${manga.rating}/5</div>
                            <div class="view"><i class="fa fa-eye"></i> ${manga.view}</div>
                        </div>
                        <div class="product__item__text">
                            <ul>
                                <li>Active</li>
                                <li>Movie</li>
                            </ul>
                            <h5><a href="manga?action=detail&mangaID=${manga.mangaID}">${manga.mangaName}</a></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!-- Manga detail end -->
    </div>
</div>
