<template>
  <div class="account-bg"></div>
  <div class="ta-level">
    <div class="sign">7</div>
    <div class="experience">400/<span style="color: #cf4e6c">600</span></div>
    <div class="level">
      Trade Away <span style="color: #cf4e6c">Level</span>
    </div>
  </div>
  <section class="account">
    <div class="profile">
      <div class="avatar">
        <img src="../assets/user-profile.jpeg" />
      </div>
      <div class="profile-name">Wonderhefty</div>
      <div class="profile-information">
        <div class="account-information">
          <p class="name">Order Status</p>
          <p class="account-activity">
            <span>
              <b class="main-color">11</b>
              Completed
            </span>
          </p>
          <p class="account-activity">
            <span>
              <b class="main-color">1</b>
              Pending
            </span>
          </p>
          <div class="account-btn">Check Status</div>
        </div>
      </div>
      <div class="profile-information">
        <div class="account-information">
          <p class="name">Anna James</p>
          <p class="gray-color">Rzeszów, Podkarpackie</p>
          <p class="account-activity">
            <b class="activity-icon">
              <i class="fas fa-hands-helping"></i>
            </b>
            <span>
              <b class="main-color">10</b>
              items bought
            </span>
          </p>
          <p class="account-activity">
            <b class="activity-icon">
              <i class="fas fa-dollar-sign"></i>
            </b>
            <span>
              <b class="main-color">2</b>
              items sold
            </span>
          </p>
          <div class="account-btn">Create Offer</div>
        </div>
        <div class="personal-information">
          <div class="personal">
            <p class="data">
              <b class="key">Name:</b>
              <span class="value gray-color">Anna</span>
            </p>
            <p class="data">
              <b class="key">Surname:</b>
              <span class="value gray-color">James</span>
            </p>
            <p class="data">
              <b class="key">Location:</b>
              <span class="value gray-color">Rzeszów, 35-103, Poland</span>
            </p>
          </div>
          <div class="contact">
            <p class="data">
              <b class="key">Phone:</b>
              <span class="value gray-color">+48 123 456 789</span>
            </p>
            <p class="data">
              <b class="key">Email:</b>
              <span class="value gray-color">anaj@ex.com</span>
            </p>
            <div class="contact-btn">Edit</div>
          </div>
        </div>
      </div>
    </div>
    <div class="history">
      <div class="title">Transaction History</div>
      <div class="item-group">
        <div class="item pending">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item finished">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item finished">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item finished">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item finished">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <i class="fas fa-arrow-circle-right"></i>
      </div>
    </div>
  </section>
</template>
<script>
import $ from "jquery";

export default {
  name: "Account",
};

$(function () {
  //Script for password visibility
  $("#pwd-visibility-toggler").on("click", function () {
    var inputType = $("#password").attr("type");
    if (inputType == "password") {
      $("#password").attr("type", "text");
      $(this).attr("class", "fas fa-eye-slash");
    } else if (inputType == "text") {
      $("#password").attr("type", "password");
      $(this).attr("class", "fas fa-eye");
    }
  });
});
</script>

<style lang="scss">
@import url("../styles/Home.scss");
@import url("../styles/Settings.scss");
</style>
