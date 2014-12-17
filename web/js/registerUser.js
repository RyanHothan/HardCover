function registerUser()
{
    var firstName = $("#firstName").val();
    var lastName = $("#lastName").val();
    var email = $("#email").val();
    var password = $("#password").val();
    var libraryCardNum = $("#libraryCardNum").val();
    if(firstName === "")
    {
        alert('Your first name can not be empty');
        return;
    }
    if(lastName === "")
    {
        alert('Your last name can not be empty');
        return;
    }
    if(email === "")
    {
        alert('Your email can not be empty');
        return;
    }
    
    if(password === "")
    {
        alert('Your password can not be empty');
        return;
    }
    
    if(libraryCardNum === "" || libraryCardNum.length !== 10)
    {
        alert('Your library card number is invalid.');
        return;
    }

    $.ajax({
        url: '/HardCover/RegisterUserServlet',
        type:'POST',
        data:{firstName : firstName, lastName : lastName, email : email, password : password, libraryCardNum : libraryCardNum}, 
        dataType: 'text'
    })

}