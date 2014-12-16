function promoteUser()
{
    var selectedOption = $("#listOfUsers option:selected");
    if (selectedOption.attr('value') !== "")
    {
        $.ajax({
            url: '/HardCover/PromoteUserServlet',
            type: 'GET',
            async: false,
            dataType: 'JSON',
            data: {userId: selectedOption.attr('value')},
            success: function (data)
            {
                alert(data.message);
            }
        });
    }
}
;
