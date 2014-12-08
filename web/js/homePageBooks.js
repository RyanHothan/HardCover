jQuery(function ($) {
    
    window.onhashchange = function(){
    var what_to_do = document.location.hash;    
    if (what_to_do=="#show_picture")
        show_picture();
}

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
                    title = title.substring(0, 17) + "...";
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
                $("#popularBookCover" + (i - 4)).attr('value', data[i].bookId);
                var title = data[i].title;
                if (title.length > 20)
                {
                    title = title.substring(0, 17) + "...";
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
    var bookId= $(book).val();
    $.ajax({
        url: '/HardCover/BookInfoServlet',
        type: 'GET',
        dataType: 'JSON',
        data: {bookId: bookId},
        success: function(data)
        {
            var title = data.title;
            var cover = data.cover;
            var description = data.description;
            var numCopies = data.numCopies;
            var language = data.language;
            var publisher = data.publisher;
            var authors = data.authors;
            var genres = data.genres;
            $("#modalTitle").html(title + " by " + authors);
            $("#modalImage").attr('src', cover);
            if(description.length > 500)
            {
                description = description.substring(0,497) + "...";
            }
            $("#modalDescription").html(description);
            $("#modalPublisher").html("Publisher: " + publisher);
            $("#modalLanguage").html("Language: " + language);
            $("#modalGenres").html("Genres: " + genres);
            $("#modalCopies").html("Number of Copies: " + numCopies);
            document.location.hash = bookId;
        }
    });
}