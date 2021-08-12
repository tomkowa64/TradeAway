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
        <!-- Account history -->
        <div class="account-history">
            <div class="section-label">
                <div>
                    Account History | <span class="tag-show-all"><a href="">Show All <i class="fas fa-arrow-down"></i></a></span>
                </div>
            </div>
            <div class="product-list">
            <div class="product-list-item" style="background: rgb(67, 214, 202);">
                <img src="../assets/backpack.png" alt="">
                <div class="product-list-item-name">Product Name</div>
                <div class="product-list-item-desc">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                sed do eiusmod tempor incididunt ut labore et dolore.
                </div>
                <div class="product-list-item-price">
                69.99$
                </div>
            </div>

            <div class="product-list-item" style="background: #f06f1f">
                <img src="../assets/blender.png" alt="">
                <div class="product-list-item-name">Product Name</div>
                <div class="product-list-item-desc">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                sed do eiusmod tempor incididunt ut labore et dolore.
                </div>
                <div class="product-list-item-price">
                29.99$
                </div>
            </div>

            <div class="product-list-item" style="background: #f5b48c">
                <img src="../assets/shoe.png" alt="">
                <div class="product-list-item-name">Product Name</div>
                <div class="product-list-item-desc">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                sed do eiusmod tempor incididunt ut labore et dolore.
                </div>
                <div class="product-list-item-price">
                30.99$
                </div>
            </div>

            <div class="product-list-item" style="background: #71bf93">
                <img src="../assets/dress.png" alt="">
                <div class="product-list-item-name">Product Name</div>
                <div class="product-list-item-desc">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                sed do eiusmod tempor incididunt ut labore et dolore.
                </div>
                <div class="product-list-item-price">
                119.99$
                </div>
            </div>
            </div>
        </div>

        <!-- Tags -->
        <div class="tags">
            <div class="section-label">
                <div class="add-tag">
                    Tags |
                    <input type="text" />
                    <i style="margin-left: 0.5em; color: #b33a56; cursor: pointer;" class="fas fa-plus-circle"></i>
                </div>
            </div>
            <div class="tags-list">
                <div class="item">
                    Sport
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    RTV/AGD
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Furniture
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Cloths
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Office
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Games
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Accessories
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Cosmetics
                    <i class="far fa-times-circle"></i>
                </div>
                <div class="item">
                    Vehicles
                    <i class="far fa-times-circle"></i>
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