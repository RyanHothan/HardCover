jQuery(function ($) {
    $("#filterDiv").keypress(function (e)
    {
        if (e.keyCode === 13)
        {
            advancedSearch();
        }
    });
});

jQuery(function ($) {
    $("#genreList").click(function (e)
    {
        advancedSearch();
    });
});
function advancedSearch()
{

    window.location.hash = "A?";
    if (!($("#authorSearch").val() === ("")))
    {
        window.location.hash = window.location.hash + "+author=" + $("#authorSearch").val() + "?";
    }
    if (!($("#titleSearch").val() === ("")))
    {
        window.location.hash = window.location.hash + "+title=" + $("#titleSearch").val() + "?";
    }
    var genreList = $("#genreList").find("input:checked");
    if (genreList.length > 0)
    {
        window.location.hash = window.location.hash + "+genre=" + $(genreList[0]).val();
        for (i = 1; i < genreList.length; i++)
        {
            window.location.hash = window.location.hash + ", " + $(genreList[i]).val();
        }
        window.location.hash = window.location.hash + "?";
    }
    $("#bookSearchResultsView").empty();
    var hash = window.location.hash;
    var newBookResults = bookResults;
    if (hash.indexOf("+author=") >= 0)
    {
        var startOfAuthor = hash.indexOf("+author=") + 8;
        var endOfAuthor = startOfAuthor;

        while (hash.charAt(endOfAuthor) !== "?")
        {
            endOfAuthor++;
        }
        var authorName = hash.substring(startOfAuthor, endOfAuthor).toLowerCase();
        var tempBookList = [];
        for (i = 0; i < bookResults.length; i++)
        {
            if (bookResults[i].author.toLowerCase().indexOf(authorName) >= 0)
            {
                tempBookList.push(bookResults[i]);
            }
        }
        newBookResults = tempBookList;
    }

    if (hash.indexOf("+title=") >= 0)
    {
        var startOfTitle = hash.indexOf("+title=") + 7;
        var endOfTitle = startOfTitle;

        while (hash.charAt(endOfTitle) !== "?")
        {
            endOfTitle++;
        }
        var titleName = hash.substring(startOfTitle, endOfTitle).toLowerCase();
        var tempBookList = [];
        for (i = 0; i < newBookResults.length; i++)
        {
            if (newBookResults[i].title.toLowerCase().indexOf(titleName) >= 0)
            {
                tempBookList.push(newBookResults[i]);
            }
        }
        newBookResults = tempBookList;
    }

    if (hash.indexOf("+genre=") >= 0)
    {
        var startOfGenre = hash.indexOf("+genre=") + 7;
        var endOfGenre = startOfGenre;

        while (hash.charAt(endOfGenre) !== "?")
        {
            endOfGenre++;
        }
        var genres = hash.substring(startOfGenre, endOfGenre).toLowerCase().split(", ");
        for (i = 0; i < genres.length; i++)
        {
            var genreName = genres[i];
            var tempBookList = [];
            for (j = 0; j < newBookResults.length; j++)
            {
                if (newBookResults[j].genres.toLowerCase().indexOf(genreName) >= 0)
                {
                    tempBookList.push(newBookResults[j]);
                }
            }
            newBookResults = tempBookList;
        }
    }
    var rowNum;
    for (i = 0; i < newBookResults.length; i++)
    {
        rowNum = Math.floor(i / 3);
        if (i % 3 === 0)
        {
            $("#bookSearchResultsView").append("<div id = 'booksSearchResultsRow" + rowNum + "' class='row'></div>");
        }
        var title = newBookResults[i].title;
        if (title.length > 20)
        {
            title = title.substring(0, 17) + "...";
        }
        $("#booksSearchResultsRow" + rowNum).append(
                "<div class='col-md-4'>"
                + "<div class='thumbnail'>"
                + "<a href='#'>"
                + "<input id='booksSearchResult" + i + "'type='image' value='" + newBookResults[i].bookId + "' src='" + newBookResults[i].cover + "' class='basic'>"
                + "</a>"
                + "<div class='caption'>"
                + "<h4>" + title + "</h4>"
                + "<p>" + newBookResults[i].author + "</p>"
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
;