$(function () {
  let forgotQuestion = $(".auth-q-forgot");
  registerQuestion = $(".auth-q-register");
  loginQuestion = $(".auth-q-login");
  forgotContainer = $(".password-reset-container");
  registerContainer = $(".register-container");
  loginContainer = $(".login-container");

  $(forgotQuestion).click(function () {
    $(loginContainer).addClass("hide");
    $(forgotContainer).addClass("show");
    console.log("Its working");
  });

  $(registerQuestion).click(function () {
    $(loginContainer).addClass("hide");
    $(loginContainer).removeClass("show");
    $(registerContainer).addClass("show");
    $(registerContainer).removeClass("hide");
    console.log("Its working 2");
  });

  $(loginQuestion).click(function () {
    $(loginContainer).addClass("show");
    $(loginContainer).removeClass("hide");
    $(registerContainer).addClass("hide");
    $(registerContainer).removeClass("show");
    console.log("Its working 3");
  });
});
