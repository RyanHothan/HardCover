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
        $('#change-email-modal').modal({overlayClose: true,
        containerCss: {
                height: 400,
                width: 300
            },});

        return false;
    });
});

function changePassword()
{
    var currentPassword = $("#currentPassword").val();
    var passwordRepeat = $("#passwordRepeat").val();
    
    var newPassword = $("#newPassword").val();
    
    if(currentPassword === newPassword)
    {
        alert('Your new password is the same as your old one.');
        return;
    }
    if(passwordRepeat !== newPassword)
    {
        alert('Your two passwords do not match.');
        return;
    }
    $.ajax({
        url: '/HardCover/ChangePasswordServlet',
        type: 'POST',
        data: {password: currentPassword, passwordRepeat : passwordRepeat, newPassword : newPassword},
        dataType: 'text',
        async: false,
        success: function(e)
        {
            alert('Password Change Successful!');
        },
        error: function(e)
        {
            alert('Password Change unsuccessful please try again');
        }
    });
}

function changeEmail()
{
    var newEmail = $('#newEmail').val();
    var password = $('#currentPasswordForEmailChange').val();
    $.ajax({
        url:'/HardCover/ChangeEmailServlet',
        type: 'POST',
        async:false,
        data: {password : password, newEmail : newEmail},
        dataType: 'text',
        success: function()
        {
            alert('Email Change successful!');
            
        },
        error: function(e)
        {
            if(e.status === 500)
            {
            alert('Email Change unsuccessful. Please try again.');
            }
            else
            {
                if(e.status ===501)
                {
                    alert('That email already has an account!');
                }
            }
        }
        
        
    });
}