jQuery(function ($) {
    var email = $("#loggedInEmail").text();
    $.ajax({
        url: '/HardCover/PopulateMyBooksServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        success: function (data)
        {
            var counter = 0;
            for (i = 0; i < data.length; i++)
            {
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + "...";
                }
                var author = data[i].author;
                if (author.length > 20)
                {
                    author = author.substring(0, 17) + "...";
                }
                
                    $("#myBooksRow").append("<tr>"
                            + "<td>"
                            + "<div class='col-md-4'>"
                            + "<div class='thumbnail' >"
                            + "<a href='#' >"
                            + "<input class='basic' id='booksSearchResult" + i + "'type='image' value='" + data[i].bookId + "' src='" + data[i].cover + "'  style='display:block; margin-left: auto; margin-right: auto'>"
                            + "</a>"
                            + "<div class='caption' style='position:absolute; bottom: 10px;'>"
                            + "<h4>" + title + "</h4>"
                            + "<p>" + author + "</p>"
                            + "</div>"
                            + "</div>"
                            + "</div>"
                            + "</td>"
                            + "<td style='color:white; font-size:20px'>"
                            + data[i].expirationDate.substring(0, 10)
                            + "</td>"
                            + "<td>"
                            + "<button class='btn' style='background-color:white'> Download Book </button>"
                            + "</td>"
                            + "</tr>");
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
        }
    });
});