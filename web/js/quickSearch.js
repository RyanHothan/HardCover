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
        populateSearch();
    }
}
;

function quickSearchButton(me)
{
    window.location = "/HardCover/HardCover-browse.jsp#" + me.val();
    populateSearch();
};
function populateSearch() {
    $("#bookSearchResultsView").empty();

    $.ajax({
        url: '/HardCover/BookSearchServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        data: {searchPhrase: window.location.hash.substring(1)},
        success: function (data)
        {
            bookResults = data;
            var rowNum;
            for (i = 0; i < data.length; i++)
            {
                rowNum = Math.floor(i / 3);
                if (i % 3 === 0)
                {
                    $("#bookSearchResultsView").append("<div id = 'booksSearchResultsRow" + rowNum + "' class='row'></div>");
                }
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + "...";
                }
                $("#booksSearchResultsRow" + rowNum).append(
                        "<div class='col-md-4' >"
                        + "<div class='thumbnail' >"
                        + "<a href='#'>"
                        + "<input id='booksSearchResult" + i + "'type='image' value='" + data[i].bookId + "' src='" + data[i].cover + "' class='basic' style='display:block; margin-left: auto; margin-right: auto'>"
                        + "</a>"
                        + "<div class='caption' style='position:absolute; bottom: 10px;'>"
                        + "<h4 style ='color: white'>" + title + "</h4>"
                        + "<p style ='color: white; font-size:14px'>" + data[i].author + "</p>"
                        + "</div>"
                        + "</div>"
                        + "</div>");
                $("#booksSearchResult" + i).on('click', function ()
                {
                    populateModal($(this));
                });
                $('.thumbnail .basic').on('click', function (e) {
                    $('#basic-modal-content').modal({overlayClose: true});

                    return false;
                });
            }
        }
    });
}

