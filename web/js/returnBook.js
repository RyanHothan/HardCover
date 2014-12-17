function returnBook(returnBookButton)
{
    var bookId = $('#returnBook').data('data-bookUuid');
    $.ajax({
        url:'/HardCover/ReturnBookServlet',
        type:'POST',
        async: false,
        data: {bookId : bookId},
        error: function(e)
        {
            if(e.status === 500)
            {
                alert('You do not have that book checked out.');
            }
        },
        success: function(){
            alert('You have returned the book.');
            window.location.reload();
        }
    })
}