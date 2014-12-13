
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
}
;

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
                        "<div class='col-md-4'>"
                        + "<div class='thumbnail'>"
                        + "<a href='#'>"
                        + "<input id='booksSearchResult" + i + "'type='image' value='" + data[i].bookId + "' src='" + data[i].cover + "' class='basic'>"
                        + "</a>"
                        + "<div class='caption'>"
                        + "<h4>" + title + "</h4>"
                        + "<p>" + data[i].author + "</p>"
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

