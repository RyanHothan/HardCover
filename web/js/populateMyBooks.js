jQuery(function ($) {
    var email = $("#loggedInEmail").text();
    $.ajax({
        url: '/HardCover/PopulateMyBooksServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        success: function(data)
        {
            for(i=0;i < data.length; i++)
            {
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + "...";
                }
                var author = data[i].author;
                if (author.length > 20)
                {
                    title = title.substring(0, 17) + "...";
                }
            $("#myBooksRow").append("<tr>" 
                        +"<td>" 
                        + "<div class='col-md-4'>"
                        + "<div class='thumbnail' >"
                        + "<a href='#' class='basic'>"
                        + "<input id='booksSearchResult" + i + "'type='image' value='" + data[i].bookId + "' src='" + data[i].cover + "'  style='display:block; margin-left: auto; margin-right: auto'>"
                        + "</a>"
                        + "<div class='caption' style='position:absolute; bottom: 10px;'>"
                        + "<h4>" + title + "</h4>"
                        + "<p>" + data[i].author + "</p>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</td>"
                        + "</tr>");
            }
        }
    });
});