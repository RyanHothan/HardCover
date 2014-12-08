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
                    <a href="mybooks.jsp">My Books</a>
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
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="loggedInEmail">${email}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="#">Account Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <input type="button" value="Log Out" onclick="logOut()">
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>