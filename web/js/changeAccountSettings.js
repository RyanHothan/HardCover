jQuery(function ($) {

    $('#changePassword').on('click', function (e) {
        $('#change-password-modal').modal({overlayClose: true,
            containerCss: {
                height: 400,
                width: 300
            },
        });

        return false;
    });
    $('#changeEmail').on('click', function (e) {
        $('#change-email-modal').modal({overlayClose: true});

        return false;
    });
});

function changePassword()
{
    var currentPassword = $("#currentPassword").val();
    var passwordRepeat = $("#passwordRepeat").val();
    var newPassword = $("#newPassword").val();
    $.ajax({
        url: '/HardCover/ChangePasswordServlet',
        type: 'POST',
        data: {password: currentPassword, passwordRepeat : passwordRepeat, newPassword : newPassword},
        dataType: 'text'
    });
}