function logOut()
{
    $.ajax({
        url: '/HardCover/LogOutUserServlet',
        type: 'POST',
        async: false,
        dataType: 'text'
    });
    if (location.pathname === '/HardCover/adminPanel.jsp')
    {
        window.location = "/HardCover/";
    }
    else
    {
        location.reload();
    }
}