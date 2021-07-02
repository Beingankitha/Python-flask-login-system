$(document).ready(function(){
  // set initially button state hidden
  //$("#btn").hide();
  // use keyup event on email field
  $("#email").keyup(function(){
    if(validateEmail()){
      // if the email is validated
      // set input email border green
      $("#email").css("border","2px solid green");
      // and set label
      $("#emailMsg").html("<p class='text-success'>Validated</p>");
    }else{
      // if the email is not validated
      // set border red
      $("#email").css("border","2px solid red");
      $("#emailMsg").html("<p class='text-danger'>Un-validated</p>");
    }
    buttonState();
  });
  // use keyup event on full name
  $("#fullname").keyup(function(){
    var fnm = $("#fullname").val();
    var regnm = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
    var reg = reg =/^[0-9]+$/;
    if(fnm.length >0 && fnm.length<=3){
      $("#fullname").css("border", "2px solid red");
      $("#fnmMsg").html("<p class='text-danger'>Very Short Full Name!</p>");
    }
    else if (reg.test(fnm)){
      $("#fullname").css("border", "2px solid red");
      $("#fnmMsg").html("<p class='text-danger'>Name can not start with number!</p>");
    }
    else if(regnm.test(fnm)) {
      $("#fullname").css("border", "2px solid green");
     $("#fnmMsg").html("<p class='text-success'>Valid Name</p>");
    }
  });

  $("#age").keyup(function(){

    var age =  $("#age").val();
    var reg = /^[1-9][0-9]?$|^110$/;
    if(reg.test(age)){
      $("#age").css("border", "2px solid green");
     $("#ageMsg").html("<p class='text-success'>Valid Age</p>");
    }else {
       $("#age").css("border", "2px solid red");
      $("#ageMsg").html("<p class='text-danger'>Only valid age allowed upto 1-110!</p>");
    }
  });


  $("#postcode").keyup(function(){

    var pc = $("#postcode").val();
    

  });
  // use keyup event on password

  /*$("#pass").keyup(function(){
    // check
    if(validatePassword()){
      // set input password border green
      $("#pass").css("border","2px solid green");
      //set passMsg
      $("#passMsg").html("<p class='text-success'>Password validated</p>");
    }else{
        // set input password border red
      $("#pass").css("border","2px solid red");
      //set passMsg
      $("#passMsg").html("<p class='text-danger'>Password not valid</p>");
    }
    buttonState();
  });*/

});

/*function buttonState(){
  if(validateEmail() && ValidatePassword()){
    // if the both email and password are validate
    // then button should show visible
    $("#btn").show();
  }else{
    // if both email and pasword are not validated
    // button state should hidden
    $("#btn").hide();
  }
}*/
function validateEmail(){
  // get value of input email
  var email=$("#email").val();
  // use reular expression
   var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
   if(reg.test(email)){
     return true;
   }else{
     return false;
   }

}
/*function validatePassword(){
  //get input password value
  var pass=$("#pass").val();
  // check it s length
  if(pass.length > 7){
    return true;
  }else{
    return false;
  }

}*/


