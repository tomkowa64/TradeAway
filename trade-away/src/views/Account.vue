<template>
    <section class="account">
        <div class="account-info">
            <div class="user-details">
                <img src="../assets/user-icon.png" alt="">
                <div class="username">
                    Username
                </div>
                <div class="password">
                    <input type="password" value="samplepassword" id="password" >
                    <i style="font-size: 1.6em; cursor: pointer;" class="fas fa-eye" id="pwd-visibility-toggler"></i>
                </div>
            </div>
            <div class="person-details">
                b
            </div>
        </div>
    </section>
</template>
<script>
import $ from 'jquery';

export default ({
  name: 'Account'
})

$(function(){
    //Script for password visibility
    $("#pwd-visibility-toggler").on("click",function(){
        var inputType = $("#password").attr("type");
        if(inputType == "password"){
            $("#password").attr("type","text");
            $(this).attr("class","fas fa-eye-slash");
        }
        else if(inputType == "text"){
            $("#password").attr("type","password");
            $(this).attr("class","fas fa-eye");
        }
    });
});

</script>

<style lang="scss">
 @import url('../styles/Home.scss');
 @import url('../styles/Settings.scss');
</style>