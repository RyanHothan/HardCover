JQuery(function($) {
    
    $.ajax({
        url: '/HardCover/HomePageBooksServlet',
        type: 'GET',
        dataType: 'JSON',
        success: function (data)
        {
            
        }
    });

});

