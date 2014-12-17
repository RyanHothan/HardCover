function addBook()
{
    $.ajax({
    url: '/HardCover/AddBookServlet',
            type: 'GET',
            async: false,
            dataType: 'JSON',
            data: {title: $("#titleInput").val(), author:$("#authorInput").val(),
                    cover:$("#coverInput").val(), publisher:$("#publisherInput").val(),
                    genre:$("#genreInput").val(), language:$("#languageInput").val(),
                    description:$("#descriptionInput").val(), file:$("#fileInput").val()},
    success: function (data)
    {
        location.reload();
    }
    });
}
;

