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
            <!-- Person info -->
                <div class="person-info-box">
                    <div class="content">
                        <div class="icon-label">
                            <i class="fas fa-user-alt"></i>
                        </div>
                        <div class="info-text">
                            <b>Name:</b> User
                        </div>
                        <div class="info-text">
                            <b>Surname:</b> Name
                        </div>
                        <div class="info-text">
                            <b>Age:</b> 12
                        </div>
                        <div class="info-text">
                            <b>E-mail:</b> sample@example.com
                        </div>
                        <div class="info-text">
                            <b>PESEL:</b> 12345678901
                        </div>
                    </div>
                    <div class="edit">
                        <i class="fas fa-edit"></i>
                    </div>
                </div>
                <!-- Address info -->
                <div class="person-info-box">
                    <div class="content">
                        <div class="icon-label">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="info-text">
                            <b>Country:</b> Poland
                        </div>
                        <div class="info-text">
                            <b>City:</b> Rzeszow
                        </div>
                        <div class="info-text">
                            <b>Postal Code:</b> 35-123
                        </div>
                        <div class="info-text">
                            <b>Address:</b> Hetmanska 123
                        </div>
                    </div>
                    <div class="edit">
                        <i class="fas fa-edit"></i>
                    </div>
                </div>
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