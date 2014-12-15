function borrowBook(bookId)
{

    var bookUuid = bookId.substring(1);
    $.ajax({
        url: '/HardCover/BorrowBookServlet',
        type: 'POST',
        data: {bookUuid: bookUuid},
        dataType: 'text',
        error: function (e)
        {
            if (e.status === 500)
            {
                alert('You can not borrow the same book twice');
            }
            else
            if(e.status === 501)
            {
                alert('That book is not available. Please reserve it to be placed in queue.');
            }
            else
            {
                alert('You have successfully borrowed a book. Check your My Books page to download it.')
            }
            
        }
    })
}