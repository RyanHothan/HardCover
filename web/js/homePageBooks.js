jQuery(function($) {
    
    $.ajax({
        url: '/HardCover/HomePageBooksServlet',
        type: 'GET',
        dataType: 'JSON',
        data:{},
        success: function(data)
        {
//          create newest books section of homepage
            for(i=0; i < 4; i++)
            {
                $("#newestBookCover"+i).attr('src',data[i].cover);
                $("#newestBookTitle"+i).html(data[i].title);
                $("#newestBookAuthor"+i).html(data[i].author);
            }
//          create most popular books section of homepage
            for(i=4; i<8; i++)
            {
                $("#popularBookCover"+(i-4)).attr('src',data[i].cover);
                $("#popularBookTitle"+(i-4)).html(data[i].title);
                $("#popularBookAuthor"+(i-4)).html(data[i].author);
            }
        }
    });

});

