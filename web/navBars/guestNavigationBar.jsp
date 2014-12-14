<div class="navbar navbar-default navbar-static-top navbar-inverse">
    <div class="container"> 
        <div class="navbar-header">
            <a class="navbar-brand" href="/HardCover">
                <span class="fa fa-book"></span> HardCover
            </a>
        </div>
        <ul class="nav navbar-left navbar-nav">
            <li>
                <a href="HardCover-browse.jsp">Browse</a>
            </li>
            <li>
                <a href="mybooks.jsp">My Books</a>
            </li>
        </ul>
        <div class="col-md-4 pull-right">
            <div class="input-group">
                <input id = "quickSearchBar" type="text" class="form-control" placeholder="Search Books">
                <span class="input-group-btn">
                    <button id = "searchButton" class="btn btn-default" type="button">
                        <span class="fa fa-search"></span>
                    </button>
                </span>
            </div>
        </div>
        <div class="col-md-4 pull-right">
            <div class="btn-group">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown">Log In
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <form role="form">
                            <div class="form-group">
                                <li role="presentation">
                                    <input type="email" class="form-control" placeholder="email" id="loginEmail">
                                </li>
                            </div>
                            <div class="form-group">
                                <li role="presentation">
                                    <input type="password" class="form-control" placeholder="password" id="loginPassword">
                                </li>
                            </div>
                            <li role="presentation">
                                <button type="submit" class="btn btn-default" onclick="loginUser()">Log In</button>
                            </li>
                        </form>
                    </ul>
                </div>

            </div>
            <button class="btn" id="registerButton" type="button" style="float:right">Register</button> 
        </div>
    </div>
</div>