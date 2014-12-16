function removeUser()
{
    var selectedOption = $("#listOfUsers option:selected");
    if(selectedOption.attr('value') !== "")
    {
    $.ajax({
    url: '/HardCover/RemoveUserServlet',
            type: 'GET',
            async: false,
            dataType: 'JSON',
            data: {userId: selectedOption.attr('value')},
    success: function (data)
    {
        location.reload();
    }
    });
}
};