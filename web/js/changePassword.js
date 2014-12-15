function changePassword()
{
    var password = $("#password").val();
    var passwordRepeat = $("#passwowrdRepeat").val();
    var newPassword = $("newPassword").val();
    $.ajax({
        url: '/HardCover/ChangePasswordServlet',
        type: 'POST',
        data: {password: password, passwordRepeat : passwordRepeat, newPassword : newPassword},
        dataType: 'text',
        async: false,
        success: function(e)
        {
            alert('Password Change Successful!');
        },
        error: function()
        {
            alert('Password Change unsuccessful please try again');
        }
    });
}