function removeBook()
{
    var selectedOption = $("#listOfBooks option:selected");
    if(selectedOption.attr('value') !== "")
    {
    $.ajax({
    url: '/HardCover/RemoveBookServlet',
            type: 'GET',
            async: false,
            dataType: 'JSON',
            data: {bookId: selectedOption.attr('value')},
    success: function (data)
    {
        location.reload();
    }
    });
}
};


