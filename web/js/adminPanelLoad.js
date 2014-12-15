jQuery(function () {
    $.ajax({
        url: '/HardCover/BookListServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        success: function (data)
        {
            for(i = 0; i < data.length; i++)
            {
                $("#listOfBooks").append("<option value=" + data[i].bookId + ">" + data[i].title + "</option>");
            }
        }
    });
});


