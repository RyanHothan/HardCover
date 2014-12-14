<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <%@ include file="modals/bookModal.jsp" %>	
        <%@ include file="modals/changeEmailModal.jsp" %>
        <%@ include file="modals/changePasswordModal.jsp" %>     
        <%@ include file="modals/registerModal.jsp" %>
        <%@ page session="true" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>HardCover</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type='text/css' href='css/demo.css' rel='stylesheet' media='screen' />
        <!-- Contact Form CSS files -->
        <link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type='text/javascript' src='js/jquery.simplemodal.js'></script>
        <script type='text/javascript' src='js/quickSearch.js'></script>
        <script type='text/javascript' src='js/browseBooks.js'></script>
        <script type='text/javascript' src='js/basic.js'></script>
        <script type='text/javascript' src='js/populateModal.js'></script>
        <script type='text/javascript' src='js/advancedSearch.js'></script>
    </head>
    <body>

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
                    <h1>Browse Books</h1>
                    <hr>
                </div>
            </div>
            <div id="filterDiv" class="row">
                <div class="col-md-3" style="padding-right:20px; border-right: 1px solid #ccc;">
                    <div class="row">
                        <h3>Filter</h3>
                        <hr>
                    </div>
                    <div class="row">
                        <h3>Search</h3>
                        <h4>Author<input id = "authorSearch" type="search" ></h4>
                        <h4>Title<input id = "titleSearch" type="search"  ></h4>
                        <h3>Genre</h3>
                    </div>
                    <div id ="genreList" class="row">
                        <h4><input type="checkbox" >Fantasy<br></h4>
                        <h4><input type="checkbox" >Biography<br></h4>
                        <h4><input type="checkbox" >Science Fiction<br></h4>
                        <h4><input type="checkbox" value = "Adventure">Adventure<br></h4>
                        <h4><input type="checkbox" value = "Fantasy">Fantasy<br></h4>
                        <h4><input type="checkbox" value="Children">Children<br></h4>
                    </div>
                    <div class="row">
                        <h3>Availability</h3>
                        <h4><input type="checkbox" >Available Only<br></h4>
                    </div> 
                    <div class="row">
                        <h3> Format </h3>
                        <h4><input type="checkbox" >.PDF File<br></h4>
                        <h4><input type="checkbox" >EPUB File<br></h4>
                        <h4><input type="checkbox" >AZW File<br></h4>
                        <h4><input type="checkbox" >In Browser File<br></h4>
                    </div>
                    <div class="row">
                        <a onclick ="advancedSearch()" class="btn btn-lg btn-primary">Submit</a>
                    </div>
                </div>
                <div id = "bookSearchResultsView" class="col-md-9">
                </div>
            </div>
        </div>
    </body>
</html>
