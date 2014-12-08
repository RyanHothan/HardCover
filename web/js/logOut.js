function logOut()
{   
    $.ajax({
        url: '/HardCover/LogOutUserServlet',
        type: 'POST',
        async: false,
        dataType: 'text'
    });
    location.reload();
}