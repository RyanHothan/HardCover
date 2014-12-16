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
                <a href="mybooks.jsp">My Account</a>
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
            <div class="btn-group" draggable="true">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="loggedInEmail">${email}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <input type="button" class ="btn" value="Log Out" onclick="logOut()" style="width:100%">
                            </li>
                        </ul>
                    </div>
        </div>
    </div>
</div>