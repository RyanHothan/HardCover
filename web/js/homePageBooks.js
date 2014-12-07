jQuery(function ($) {

    $.ajax({
        url: '/HardCover/HomePageBooksServlet',
        type: 'GET',
        dataType: 'JSON',
        data: {},
        success: function (data)
        {
//          create newest books section of homepage
            for (i = 0; i < 4; i++)
            {
                $("#newestBookCover" + i).attr('src', data[i].cover);
                $("#newestBookCover" + i).attr('value', data[i].bookId);
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + '...';
                }
                $("#newestBookTitle" + i).html(title);
                $("#newestBookAuthor" + i).html(data[i].author);
                $("#newestBookCover" + i).on('click', function()
                        {
                            populateModal($(this));
                        });
            }
//          create most popular books section of homepage
            for (i = 4; i < 8; i++)
            {
                $("#popularBookCover" + (i - 4)).attr('src', data[i].cover);
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + '...';
                }
                $("#popularBookTitle" + (i - 4)).html(title);
                $("#popularBookAuthor" + (i - 4)).html(data[i].author);
                $("#popularBookCover" + (i - 4)).on('click',function()
                        {
                            populateModal($(this));
                        });
            }
        }
    });

});

function populateModal(book)
{
    $.ajax({
        url: '/HardCover/BookInfoServlet',
        type: 'GET',
        dataType: 'JSON',
        data: {bookId: book},
        success: function(data)
        {
            
        }
    });
}