<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page session="true" %>
        <title>HardCover</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
              rel="stylesheet">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type='text/javascript' src='js/jquery.simplemodal.js'></script>
        <script type='text/javascript' src='js/basic.js'></script>
        <script type='text/javascript' src='js/basicreturn.js'></script>
        <script type='text/javascript' src='js/passwordmodal.js'></script>
        <script type='text/javascript' src='js/emailmodal.js'></script>
        <script type='text/javascript' src='js/logOut.js'></script>
        <link type='text/css' href='css/demo.css' rel='stylesheet' media='screen' />

        <!-- Contact Form CSS files -->
        <link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
    </head>
    <body>
        <%@ include file="modals/bookModal.jsp" %>	
        <%@ include file="modals/changeEmailModal.jsp" %>
        <%@ include file="modals/changePasswordModal.jsp" %>     
        <%@ include file="modals/registerModal.jsp" %>



        <c:choose>
            <c:when test="${empty email}">
                <%@ include file="navBars/guestNavigationBar.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="navBars/registeredUserNavigationBar.jsp" %>
            </c:otherwise>
        </c:choose>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>My Books</h1>
                    <hr>
                </div>
                <div class="col" style="text-align:right">
                    <h3>Email : email.example.com</h3>
                    <h4><a href='#' class='changepassword'>Change Password</a></h4>
                    <h4><a href='#' class='changeemail'>Change E-Mail</a></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" draggable="true" style="padding-right:20px; border-right: 1px solid #ccc;">
                    <div class="row">
                        <h3>Filter</h3>
                        <hr>
                    </div>
                    <div class="row">
                        <h3>Search</h3>
                        <h4>Author<br /><input type="search" name="vehicle" ></h4>
                        <h4>Title<br /><input type="search" name="vehicle"></h4>
                    </div>
                    <div class="row">
                        <h3>Genre</h3>
                        <h4><input type="checkbox" >Fantasy<br></h4>
                        <h4><input type="checkbox" >Biography<br></h4>
                        <h4><input type="checkbox" >Science Fiction<br></h4>
                        <h4><input type="checkbox" >Adult<br></h4>
                        <h4><input type="checkbox" >For Dummies<br></h4>
                    </div>
                    <div class="row">
                        <h3>Availability</h3>
                        <h4><input type="checkbox" >Available Only<br></h4>
                    </div> 
                    <div class="row">
                        <h3> Age Group </h3>
                        <h4><input type="checkbox" >Age 4-12<br></h4>
                        <h4><input type="checkbox" >Age 13-17<br></h4>
                        <h4><input type="checkbox" >Age 18+<br></h4>
                    </div>
                    <div class="row">
                        <h3> Format </h3>
                        <h4><input type="checkbox" >.PDF File<br></h4>
                        <h4><input type="checkbox" >EPUB File<br></h4>
                        <h4><input type="checkbox" >AZW File<br></h4>
                        <h4><input type="checkbox" >In Browser File<br></h4>
                    </div> 
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="thumbnail" draggable="true">
                                <a href='#' class='basicmybooks'>
                                    <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                </a>
                                <div class="caption">
                                    <h3>Title</h3>
                                    <p>Author Name</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <a href='#' class='basicmybooks'>
                                    <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                </a>
                                <div class="caption">
                                    <h3>Title</h3>
                                    <p>Author Name</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <a href='#' class='basicmybooks'>
                                    <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                </a>
                                <div class="caption">
                                    <h3>Title</h3>
                                    <p>Author Name</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <a href='#' class='basicmybooks'>
                                    <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                </a>
                                <div class="caption">
                                    <h3>Title</h3>
                                    <p>Author Name</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <a href='#' class='basicmybooks'>
                                        <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                    </a>
                                    <div class="caption">
                                        <h3>Title</h3>
                                        <p>Author Name</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <a href='#' class='basicmybooks'>
                                        <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                    </a>
                                    <div class="caption">
                                        <h3>Title</h3>
                                        <p>Author Name</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <a href='#' class='basicmybooks'>
                                        <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                    </a>
                                    <div class="caption">
                                        <h3>Title</h3>
                                        <p>Author Name</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <a href='#' class='basicmybooks'>
                                        <img src="http://placekitten.com/g/180/270" class="img-responsive">
                                    </a>
                                    <div class="caption">
                                        <h3>Title</h3>
                                        <p>Author Name</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>
