jQuery(function () {
    populateSearch();

    $.ajax({
        url: '/HardCover/BookGenresServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        success: function (data)
        {
            for(i = 0; i < data.length; i++)
            {
                $("#genreList").append("<h4><input type='checkbox' value = '" + data[i].genre + "'>" +data[i].genre + "<br></h4>");
            }
        }
    });
});
