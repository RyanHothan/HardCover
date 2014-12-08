function borrowBook(bookId)
{
    var bookUuid = bookId.substring(1);
    $.ajax({
        url: '/HardCover/BorrowBookServlet',
        type: 'POST',
        data: {bookUuid : bookUuid},
        dataType: 'text'
    })
}