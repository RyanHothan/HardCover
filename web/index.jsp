<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
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
            <h3>Cats by Ryan Hothan</h3>
            <img src="http://placekitten.com/g/180/270" class="img-responsive" style="max-height: 200px;">
            <p>This book offers many cat facts by Ryan Hothan</p>
            <button class ="btn btn-default" type="button">Borrow Book</button>
            <button class ="btn btn-default" type="button">More Info</button>

        </div>

        <div class="navbar navbar-default navbar-static-top navbar-inverse">
            <div class="container"> 
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">
                        <span class="fa fa-book"></span> HardCover
                    </a>
                </div>
                <ul class="nav navbar-left navbar-nav">
                    <li>
                        <a href="HardCover-browse.html">Browse</a>
                    </li>
                    <li>
                        <a href="#">My Books</a>
                    </li>
                </ul>
                <div class="col-md-4 pull-right">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Books">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="fa fa-search"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-md-2 pull-right">
                    <div class="btn-group">
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown">Log-In
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <form role="form">
                                    <div class="form-group">
                                        <li role="presentation">
                                            <input type="email" class="form-control" placeholder="email">
                                        </li>
                                    </div>
                                    <div class="form-group">
                                        <li role="presentation">
                                            <input type="password" class="form-control" placeholder="password">
                                        </li>
                                    </div>
                                    <li role="presentation">
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </li>
                                </form>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                            <img id = "newestBookCover0" src="" class="img-responsive">
                        </a>
                        <div class="caption">
                            <h3 id = "newestBookTitle0"></h3>
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
                            <h3 id = "newestBookTitle1"></h3>
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
                            <h3 id = "newestBookTitle2"></h3>
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
                            <h3 id = "newestBookTitle3"></h3>
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
                            <h3 id = "popularBookTitle0"></h3>
                            <p id = "popularBookAuthor0"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover1" src="" class="img-responsive">
                        <div class="caption">
                            <h3 id = "popularBookTitle1"></h3>
                            <p id = "popularBookAuthor1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover2" src="" class="img-responsive">
                        <div class="caption">
                            <h3 id = "popularBookTitle2"></h3>
                            <p id = "popularBookAuthor2"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="thumbnail">
                        <img id = "popularBookCover3" src="" class="img-responsive">
                        <div class="caption">
                            <h3 id = "popularBookTitle3"></h3>
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