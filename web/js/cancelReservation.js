function cancelReservation(button)
{
    var bookId = $(button).attr('name');
    var cancelReservationButton = $(this);
    $.ajax({
        url: '/HardCover/CancelReservationServlet',
        type: 'POST',
        async: false,
        data: {bookId : bookId},
        dataType: 'text',
        success: function(e)
        {
            alert('You have unreserved the book.');
            $(button).parent().parent().empty();
            $(button).parent().parent().remove();
        }
    });
}