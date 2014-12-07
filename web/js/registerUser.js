function registerUser()
{
    var firstName = $("#firstName").val();
    var lastName = $("#lastName").val();
    var email = $("#email").val();
    var password = $("#password").val();
    var libraryCardNum = $("#libraryCardNum").val();

    $.ajax({
        url: '/HardCover/RegisterUserServlet',
        type:'POST',
        data:{firstName : firstName, lastName : lastName, email : email, password : password, libraryCardNum : libraryCardNum}, 
        dataType: 'text'
    })

}