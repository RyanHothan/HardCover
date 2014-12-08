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
            window.location.hash = bookId;
        }
    });
}
