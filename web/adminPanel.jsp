<%-- 
    Document   : adminPanel
    Created on : Dec 14, 2014, 7:51:42 PM
    Author     : Ryan Hothan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="modals/bookModal.jsp" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page session="true" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script type='text/javascript' src='js/basic.js'></script>
        <script type='text/javascript' src='js/quickSearch.js'></script>
        <script type='text/javascript' src='js/populateModal.js'></script>
        <script type='text/javascript' src='js/logOut.js'></script>
        <script type='text/javascript' src='js/adminPanelLoad.js'></script>
        <title>Administration Panel</title>
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
                <div class="col-md-8">
                    <h1 style="color:white">Administration Control Panel</h1>
                    <hr>
                </div>
                <div class = 'col-md-4'>
                    <h3 style="color:white">Email: <c:out value="${email}"/></h3>
                    <h4><a href='#' id="changePassword">Change Password</a></h4>
                    <h4><a href='#' id="changeEmail">Change E-Mail</a></h4>
                </div>
            </div>
            <div class='row'>
                <div class='col-md-4' style='border-right: #eeeeee solid;border-width: 1px'>
                    <a onclick='addBook()' class='btn btn-lg btn-primary'>Add Book</a>
                    <hr>
                    <h4 style=" color: white;">Title</h4>
                    <input id = "titleInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Authors</h4>
                    <input id = "authorInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Cover Image URL</h4>
                    <input id = "coverInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Publisher</h4>
                    <input id = "publisherInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Genres</h4>
                    <input id = "genreInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Language</h4>
                    <input id = "languageInput" style="color:white;background-color: black ">
                    <h4 style=" color: white;">Description</h4>
                    <textarea  id = "descriptionInput" style="resize:none;color:white;background-color: black; height: 150px; width: 350px"></textarea>
                </div>
                <div class='col-md-8' style='border-right: #eeeeee solid;border-width: 1px'>
                    <a onclick='removeBook()' class='btn btn-lg btn-primary'>Remove Book</a>
                    <hr>
                    <select id="listOfBooks" style="color:white;background-color: black">
                        <option value="" disabled selected>Select Book to Remove</option>
                    </select>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <a onclick='removeBook()' class='btn btn-lg btn-primary'>Remove User</a>
                    <hr>
                    <select id="listOfUsers" style="color:white;background-color: black">
                        <option value="" disabled selected>Select User to Remove</option>
                    </select>
                </div>
            </div>
        </div>
    </body>
</html>
