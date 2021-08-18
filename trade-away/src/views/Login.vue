<template>
    <section class="auth">
      <div class="login-form">
        <form action="">
          <div class="form-header">
            <div class="form-header-item form-header-active">Log In</div>
            <div class="form-header-item"><a href="#/register">Register</a></div>
          </div>
          <div class="form-body">
            <div class="form-label">
              E-mail
            </div>
            <input type="text" id="email" name="email" placeholder="Email">
            <div class="form-label">
              Password
            </div>
            <input type="password" id="pass" name="password" placeholder="Password">
            <div class="form-remember">
              <input type="checkbox"> Remember me
            </div>
            <a href="" class="pwd-recovery">Password recovery</a>
            <div id="info-label">
              Succesfully logged in!
            </div>
            <div id="error-label">
              Wrong email or password
            </div>
            <div id="login-button" class="form-button">Log In</div>
          </div>
        </form>
      </div>
    </section>
</template>

<script>
import firebase from 'firebase/app'
import 'firebase/auth'
import $ from 'jquery'
import {firebaseConfig} from '../main'
import router from '../router'

function login()
{
  var email = $("input#email:first").val();
  var pass = $("input#pass:first").val();

  firebase.auth().signInWithEmailAndPassword(email, pass)
    .then((/*userCredential*/) => {
      // var user = userCredential.user;
      // console.log(user);
      $('.form-button').css('margin-top','5em');
      $('#info-label').css('display','flex');
      window.setTimeout(function() {
        router.push("/");
      }, 2000);
    })
    .catch((error) => {
      var errorMessage = error.message;
      $('.form-button').css('margin-top','5em');
      $('#error-label').css('display','flex');
      $('#error-label').text(errorMessage);
      console.log(errorMessage);
    });
}

/*firebase.auth().onAuthStateChanged((user) => {
  if (user) {
    var uid = user.uid;
    $('.form-button').css('margin-top','5em');
    $('#info-label').css('display','flex');
    console.log(uid);
  } else {
    // User is signed out
  }
});*/

export default {
  mounted() { 
    if(firebase.apps.length === 0) firebase.initializeApp(firebaseConfig);
    $("#login-button").on('click', login);
  }
}
</script>

<style lang="scss">
  @import url('../styles/Auth.scss');
</style>
