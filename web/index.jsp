<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page session="true" %>
        <title>HardCover eLibrary</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
              rel="stylesheet" type="text/css">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
              rel="stylesheet" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <script type='text/javascript' src='js/jquery.simplemodal.js'></script>
        <script type='text/javascript' src='js/registerUser.js'></script>
        <script type='text/javascript' src='js/loginUser.js'></script>
        <script type='text/javascript' src='js/basic.js'></script>
        <script type='text/javascript' src='js/homePageBooks.js'></script>

        <!-- Page styles -->
        <link type='text/css' href='css/demo.css' rel='stylesheet' media='screen' />

        <!-- Contact Form CSS files -->
        <link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
    </head>

    <body>

        <!-- this is the modal -->
        <div id="basic-modal-content">
            <h4>title by author</h4>
            <img src="" class="img-responsive" style="max-height: 200px;">
            <p>desc</p>
            <button class ="btn btn-default" type="button">Borrow Book</button>
            <button class ="btn btn-default" type="button">More Info</button>

        </div>
        
        <div id="basic-modal-register">
            <div style="max-width: 70%; font-size: 14px">
            <div>First Name: </div><input type="text" placeholder="First Name" id="firstName"/><br/><br/>
            <div>Last Name: </div><input type="text" placeholder="Last Name" id="lastName"/><br/><br/>
            <div>Email: </div><input type="Email" placeholder="Email" id="email"/><br/><br/>
            <div>Password: </div><input type="password" placeholder="Password" id="password"/><br/><br/>
            <div>Library Card #: </div><input type="text" placeholder="Library Card Number" id="libraryCardNum"/><br/><br/>
            </div>
            <button class ="btn btn-default" type="button" onclick="registerUser()" id ="registerUserButton" style="float:right">Register</button>

        </div>
        <c:choose>
            <c:when test="${empty email}">
        <%@ include file="/guestNavigationBar.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="/registeredUserNavigationBar.jsp" %>
            </c:otherwise>
        </c:choose>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <h1>New Books</h1>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <input value="" type = "image" src="" id="newestBookCover0" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h4 id = "newestBookTitle0"></h4>
                            <p id = "newestBookAuthor0"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <img id = "newestBookCover1" src="" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h4 id = "newestBookTitle1"></h4>
                            <p id = "newestBookAuthor1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <img id = "newestBookCover2" src="" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h4 id = "newestBookTitle2"></h4>
                            <p id = "newestBookAuthor2"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <img id = "newestBookCover3" src="" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h4 id = "newestBookTitle3"></h4>
                            <p id = "newestBookAuthor3"></p>
                        </div>
                    </div>
                </div>
                <div class="row" draggable="false">
                    <div class="col-md-3 pull-right">
                        <a class="btn btn-lg btn-primary">View More</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Popular Books</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="thumbnail">
                        <a href='#' class='basic'>
                            <img id = "popularBookCover0" src="" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h4 id = "popularBookTitle0"></h4>
                            <p id = "popularBookAuthor0"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover1" src="" class="img-responsive">
                        <div class="caption">
                            <h4 id = "popularBookTitle1"></h4>
                            <p id = "popularBookAuthor1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover2" src="" class="img-responsive">
                        <div class="caption">
                            <h4 id = "popularBookTitle2"></h4>
                            <p id = "popularBookAuthor2"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover3" src="" class="img-responsive">
                        <div class="caption">
                            <h4 id = "popularBookTitle3"></h4>
                            <p id = "popularBookAuthor3"></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 pull-right">
                        <a class="btn btn-lg btn-primary">View More</a>
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
