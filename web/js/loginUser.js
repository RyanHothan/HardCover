function loginUser()
{
    var loginEmail = $('#loginEmail').val();
    var loginPassword = $('#loginPassword').val();

    $.ajax({
        url: '/HardCover/LoginUserServlet',
        type: 'POST',
        data: {loginEmail: loginEmail, loginPassword: loginPassword},
        dataType: 'text',
    });
    
}