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
            if (e.status === 501)
            {
                var x = confirm('That book is not available. Please reserve it to be placed in queue.');
                if(x === true)
                {
                    $.ajax({
                        url: '/HardCover/ReserveBookServlet',
                        type: 'POST',
                        data: {bookUuid : bookUuid},
                        async: false,
                        dataType: 'text',
                        success: function(data)
                        {
                            alert('You have successfully reserved' + data[0].title +".  Please look check your books regularly.");
                        }
                    })
                }
            }
            else
            if (e.status === 502)
            {
               alert('That book is no longer available.');
            }


        },
        success: function (e)
        {
            alert('You have successfully borrowed a book. Check your My Books page to download it.');
        }
    })
}
