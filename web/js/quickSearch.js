var bookResults;

jQuery(function ($) {
    $("#quickSearchBar").keypress(function (e)
    {
        quickSearch(e, $(this));
    });
});

jQuery(function ($) {
    $("#searchButton").click(function ()
    {
        quickSearchButton($("#quickSearchBar"));
    });
});

function quickSearch(e, me)
{
    if (e.keyCode === 13)
    {
        window.location = "/HardCover/HardCover-browse.jsp#" + me.val();
        if (window.location.pathname !== "/HardCover/")
        {
            populateSearch();
        }
    }
}
;

function quickSearchButton(me)
{
    window.location = "/HardCover/HardCover-browse.jsp#" + me.val();
    if (window.location.pathname !== "/HardCover/")
    {
        populateSearch();
    }
}
;

function populateSearch() {

    $.ajax({
        url: '/HardCover/BookSearchServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        data: {searchPhrase: window.location.hash.substring(1)},
        success: function (data)
        {
            bookResults = data;
        }
    });
    drawBookResults(0);
}
;

function drawBookResults(pageNumber)
{
    $("#bookSearchResultsView").empty();
    var rowNum;
    var startNum = pageNumber * 9;
    var numToList = 9;
    if (startNum + numToList > bookResults.length)
    {
        numToList = bookResults.length - startNum;
    }
    var counter = 0;
    for (i = startNum; i < startNum + numToList; i++)
    {
        rowNum = Math.floor(counter / 3);
        if (counter % 3 === 0)
        {
            $("#bookSearchResultsView").append("<div id = 'booksSearchResultsRow" + rowNum + "' class='row'></div>");
        }
        var title = bookResults[i].title;
        if (title.length > 20)
        {
            title = title.substring(0, 17) + "...";
        }
        var author = bookResults[i].author;
        if (author.length > 20)
        {
            author = author.substring(0, 17) + "...";
        }
        $("#booksSearchResultsRow" + rowNum).append(
                "<div class='col-md-4' >"
                + "<div class='thumbnail' >"
                + "<a href='#'>"
                + "<input class='basic' id='booksSearchResult" + counter + "'type='image' value='" + bookResults[i].bookId + "' src='" + bookResults[i].cover + "'  style='display:block; margin-left: auto; margin-right: auto'>"
                + "</a>"
                + "<div class='caption' style='position:absolute; bottom: 10px;'>"
                + "<h4 style ='color: white'>" + title + "</h4>"
                + "<p style ='color: white; font-size:14px'>" + author + "</p>"
                + "</div>"
                + "</div>"
                + "</div>");
        $("#booksSearchResult" + counter).on('click', function ()
        {
            populateModal($(this));
        });
        $('.thumbnail .basic').on('click', function (e) {
            $('#basic-modal-content').modal({overlayClose: true});

            return false;
        });
        counter++;
    }
    if(i < 9)
    {
        return;
    }
    else if (pageNumber === 0 && i < bookResults.length)
    {
        $("#bookSearchResultsView").append("<div id = 'pageRow' class='row'></div>");
        $("#pageRow").append("<a onclick='drawBookResults(" + (pageNumber + 1) + ")' class='btn btn-lg btn-primary'>Next</a>");
    }
    else if (i === bookResults.length)
    {
        $("#bookSearchResultsView").append("<div id = 'pageRow' class='row'></div>");
        $("#pageRow").append("<a onclick='drawBookResults(" + (pageNumber - 1) + ")' class='btn btn-lg btn-primary'>Previous</a>");
    }
    else if (i < bookResults.length)
    {
        $("#bookSearchResultsView").append("<div id = 'pageRow' class='row'></div>");
        $("#pageRow").append("<a onclick='drawBookResults(" + (pageNumber - 1) + ")' class='btn btn-lg btn-primary'>Previous</a>");
        $("#pageRow").append("<a onclick='drawBookResults(" + (pageNumber + 1) + ")' class='btn btn-lg btn-primary'>Next</a>");
    }


}

