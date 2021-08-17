<template>
    <section class="auth">
      <div class="register-form">
        <form action="">
          <div class="form-header">
            <div class="form-header-item"><a href="#/login">Log In</a></div>
            <div class="form-header-item form-header-active">Register</div>
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
            <div class="form-label">
              Repeat Password
            </div>
            <input type="password" id="pass-repeat" name="password-repeat" placeholder="Repeat Password">
            <div class="form-remember">
              <input id="form-check" type="checkbox"> I have read and accepted &nbsp;<a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" target="_blank">terms</a>
            </div>
            <div id="info-label">
              Succesfully registered!
            </div>
            <div id="error-label">
              Please fill up all boxes properly
            </div>
            <div id="register-button" class="form-button">Register</div>
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

function createUser(email, password)
{
  firebase.auth().createUserWithEmailAndPassword(email, password)
    .then((/*userCredential*/) => {
      // var user = userCredential.user;
      // console.log(user);
      $('.form-button').css('margin-top','5em');
      $('#info-label').css('display','flex');
      $('#error-label').css('display','none');
      window.setTimeout(function() {
        router.push("Login");
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

export default {
  mounted() {
    if(firebase.apps.length === 0) firebase.initializeApp(firebaseConfig);
    $("#register-button").on('click', () => {
      var email = $("input#email:first").val();
      var pass = $("input#pass:first").val();
      var passRepeat = $("input#pass-repeat:first").val();
      var check = $("#form-check:first").prop('checked');

      if(pass === passRepeat && email !== '' && pass !== '' && check)
      {
        createUser(email, pass);
      }
      else if(pass !== passRepeat)
      {
        console.log('Password and Repeat Password must be the same.');
        $('#error-label').text('Password and Repeat Password must be the same.');
        $('.form-button').css('margin-top','5em');
        $('#error-label').css('display','flex');
      }
      else if(email === '' || pass === '')
      {
        console.log('All fields have to be filled.');
        $('#error-label').text('All fields have to be filled.');
        $('.form-button').css('margin-top','5em');
        $('#error-label').css('display','flex');
      }
      else if(!check)
      {
        console.log('You have to read and accept terms.');
        $('#error-label').text('You have to read and accept terms.');
        $('.form-button').css('margin-top','5em');
        $('#error-label').css('display','flex');
      }
      else
      {
        $('.form-button').css('margin-top','5em');
        $('#error-label').css('display','flex');
      }
    })
  }
}
</script>

<style lang="scss">
  @import url('../styles/Auth.scss');
</style>
