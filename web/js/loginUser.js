function loginUser()
{
    var loginEmail = $('#loginEmail').val();
    var loginPassword = $('#loginPassword').val();

    $.ajax({
        url: '/HardCover/LoginUserServlet',
        type: 'POST',
        data: {loginEmail: loginEmail, loginPassword: loginPassword},
        async: false,
        dataType: 'text',
        error: function(e){
        alert('Your email and Password combination are incorrect.');
        }
    });
    
}