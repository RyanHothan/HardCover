<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <%@ include file="modals/bookModal.jsp" %>	
        <%@ include file="modals/changeEmailModal.jsp" %>
        <%@ include file="modals/changePasswordModal.jsp" %>     
        <%@ include file="modals/registerModal.jsp" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page session="true" %>
        <title>HardCover eLibrary</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
              rel="stylesheet" type="text/css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">

        <!-- Contact Form CSS files -->
        <link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type='text/javascript' src='js/jquery.simplemodal.js'></script>
        <script type='text/javascript' src='js/registerUser.js'></script>
        <script type='text/javascript' src='js/loginUser.js'></script>
        <script type='text/javascript' src='js/basic.js'></script>
        <script type='text/javascript' src='js/homePageBooks.js'></script>
        <script type='text/javascript' src='js/quickSearch.js'></script>
        <script type='text/javascript' src='js/populateModal.js'></script>
        <script type='text/javascript' src='js/viewMore.js'></script>
        <script type='text/javascript' src='js/logOut.js'></script>
        <script type='text/javascript' src='js/borrowBook.js'></script>

    </head>
    <body>
        <c:choose>
            <c:when test="${empty email}">
                <%@ include file="navBars/guestNavigationBar.jsp" %>
            </c:when>
            <c:when test = "${isAdmin}">
                <%@ include file="navBars/adminNavigationBar.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="navBars/registeredUserNavigationBar.jsp" %>
            </c:otherwise>
        </c:choose>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </div>
        <div class="container" id="bodyContainer">
            <div class="row">
                <h1 style="color:white">New Books</h1>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="thumbnail" >
                        <a href='#' class="basic">
                            <input type = "image" src="" id="newestBookCover0" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "newestBookTitle0" ></h4>
                            <p id = "newestBookAuthor0" ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic' >
                            <input type = "image" src="" id="newestBookCover1" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "newestBookTitle1" ></h4>
                            <p id = "newestBookAuthor1" ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic' >
                            <input type = "image" src="" id="newestBookCover2" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "newestBookTitle2" ></h4>
                            <p id = "newestBookAuthor2" ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input type = "image" src="" id="newestBookCover3" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "newestBookTitle3" ></h4>
                            <p id = "newestBookAuthor3" ></p>
                        </div>
                    </div>
                </div>
                <div class="row" draggable="false">
                    <div class="col-md-3 pull-right">
                        <a class="btn btn-lg btn-primary" onclick = "newestBookSearch()">View More</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1 style="color:white">Popular Books</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" >
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input type = "image" src="" id="popularBookCover0" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "popularBookTitle0" ></h4>
                            <p id = "popularBookAuthor0" ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input type = "image" src="" id="popularBookCover1" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "popularBookTitle1" ></h4>
                            <p id = "popularBookAuthor1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input type = "image" src="" id="popularBookCover2" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "popularBookTitle2" ></h4>
                            <p id = "popularBookAuthor2" ></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input type = "image" src="" id="popularBookCover3" style='display:block; margin-left: auto; margin-right: auto'>
                        </a>
                        <div class="caption" style='position:absolute; bottom: 10px;'>
                            <h4 id = "popularBookTitle3" ></h4>
                            <p id = "popularBookAuthor3" ></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 pull-right">
                        <a onclick ="mostPopularSearch()" class="btn btn-lg btn-primary">View More</a>
                    </div>
                </div>
            </div>
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-12">
                        <hr>
                        <p>HardCover eLibrary Solutions
                            <span class="fa fa-copyright"></span>2014</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
