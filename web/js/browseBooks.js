jQuery(function () {
    populateSearch();

    $.ajax({
        url: '/HardCover/BookGenresServlet',
        type: 'GET',
        async: false,
        dataType: 'JSON',
        success: function (data)
        {
            
        }
    });
});
