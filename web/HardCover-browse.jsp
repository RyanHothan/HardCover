<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <%@ page session="true" %>
        <title>HardCover</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <script type='text/javascript' src='js/jquery.js'></script>
        <script type='text/javascript' src='js/jquery.simplemodal.js'></script>
        <script type='text/javascript' src='js/basic.js'></script>
        <link type='text/css' href='css/demo.css' rel='stylesheet' media='screen' />

        <!-- Contact Form CSS files -->
        <link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
    </head>
    <body>
        <div id="basic-modal-content">
            <h3>Cats by Ryan Hothan</h3>
            <img src="http://placekitten.com/g/180/270" class="img-responsive" style="max-height: 200px;">
            <p>This book offers many cat facts by the bundle of sticks known as Ryan Hothan</p>
            <button class ="btn btn-default" type="button">Borrow Book</button>
            <button class ="btn btn-default" type="button">More Info</button>

        </div>

        <div class="navbar navbar-default navbar-static-top navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"></a>
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <a class="navbar-brand" href="index.jsp">
                        <span class="fa fa-book"></span> HardCover
                    </a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active">
                            <a href="HardCover-browse.jsp"> Browse Books</a>
                        </li>
                        <li>
                            <a href="mybooks.html">My Books</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li draggable="true">
                            <input type="text" class="form-control" placeholder="Quick Search">
                        </li>
                        <li>
                            <button type="button" class="btn btn-default">Search</button>
                        </li>
                        <li style="padding-left:20px;">
                            <div class="btn-group" draggable="true">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">${email}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="#">Account Settings</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Log Out</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Browse Books</h1>
                    <hr>
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
                        <h4>Author<input type="search" name="vehicle" ></h4>
                        <h4>Title<input type="search" name="vehicle" ></h4>
                    </div>
                    <div class="row">
                        <h3>Genre</h3>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Fantasy<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Biography<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Science Fiction<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Adult<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">For Dummies<br></h4>
                    </div>
                    <div class="row">
                        <h3>Availability</h3>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Available Only<br></h4>
                    </div> 
                    <div class="row">
                        <h3> Age Group </h3>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Age 4-12<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Age 13-17<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">Age 18+<br></h4>
                    </div>
                    <div class="row">
                        <h3> Format </h3>
                        <h4><input type="checkbox" name="vehicle" value="Bike">.PDF File<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">EPUB File<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">AZW File<br></h4>
                        <h4><input type="checkbox" name="vehicle" value="Bike">In Browser File<br></h4>
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
                                <a href='#' class='basic'>
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
                                <a href='#' class='basic'>
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
                                <a href='#' class='basic'>
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
                                <a href='#' class='basic'>
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
                                    <a href='#' class='basic'>
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
                                    <a href='#' class='basic'>
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
                                    <a href='#' class='basic'>
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
                                    <a href='#' class='basic'>
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
