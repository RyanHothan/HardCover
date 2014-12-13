
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
};

function quickSearchButton(me)
{
    window.location = "/HardCover/HardCover-browse.jsp#" + me.val();
    populateSearch();
};

function populateSearch(){
    $("#bookSearchResultsView").empty();
    $("#bookSearchResultsView").append("<div class='row'>"
                +       "<form class='navbar-form navbar-left' role='search'>"
                +           "<div class='form-group'>"
                +               "<input type='text' class='form-control' placeholder='Search'>"
                +           "</div>"
                +           "<button type='submit' class='btn btn-default'>Submit</button>"
                +       "</form>"
                +    "</div>");
    $.ajax({
            url: '/HardCover/BookSearchServlet',
            type: 'GET',
            async: false,
            dataType: 'JSON',
            data: {searchPhrase: window.location.hash.substring(1)},
            success: function (data)
            {
                var rowNum;
                for(i = 0; i < data.length; i++)
                {
                    rowNum  = Math.floor(i/4);
                    if(i % 4 === 0)
                    {
                        $("#bookSearchResultsView").append("<div id = 'booksSearchResultsRow" + rowNum + "' class='row'></div>");
                    }
                    $("#booksSearchResultsRow" + rowNum).append(
                            "<div class='col-md-4'>"
                            + "<div class='thumbnail'>"
                            + "<a href='#'>"
                            + "<input id='booksSearchResult" + i + "'type='image' value='" + data[i].bookId + "' src='" + data[i].cover + "' class='basic'>"
                            + "</a>"
                            + "<div class='caption'>"
                            + "<h4>" + data[i].title + "</h4>"
                            + "<p>" + data[i].author + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>");
                    $("#booksSearchResult" + i).on('click',function()
                        {
                            populateModal($(this));
                        });
                    $('.thumbnail .basic').on('click', function (e) {
                    $('#basic-modal-content').modal({overlayClose:true});

                    return false;
	});
                }
            }
        });
}

