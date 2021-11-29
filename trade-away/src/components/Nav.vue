<template>
  <section class="navbar">
    <div class="company-name">
      <a href="/">
        <span class="logo-font" style="color: #303744">Trade</span
        ><span class="logo-font" style="color: #cf4e6c; opacity: 0.8"
          >Away</span
        >
      </a>
      <div class="menu-toggle">
        <i class="fas fa-bars toggler"></i>
      </div>
    </div>
    <div class="mobile-menu menu-display">
      <div class="mobile">
        <div class="menu-item" style="width: 70%">
          <div class="menu-row">
            <div class="cart">
              <i class="fas fa-shopping-cart"></i>
              <span style="color: #cf4e6c; font-weight: bold; width: 15px"
                >3</span
              >
              items in cart
            </div>
          </div>
          <div class="menu-row">
            <div class="tile">
              <i class="fas fa-envelope"></i>
              <h6>Contact</h6>
            </div>
            <div class="tile">
              <i class="fab fa-shopware"></i>
              <h6>About</h6>
            </div>
            <div class="tile">
              <i class="fas fa-user-alt"></i>
              <h6>Account</h6>
            </div>
          </div>
        </div>
        <div class="menu-item" style="width: 30%">
          <div class="menu-column">
            <div class="notifications">
              <i class="fas fa-bell"></i>
              <h1 style="font-size: 5vw">1</h1>
              <h5 style="font-size: 3vw">NEW Notification</h5>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="menu menu-display">
      <div class="icon-group">
        <div class="menu-item icon">
          <i class="fas fa-envelope"></i>
          <div class="count">
            1
            <!-- TODO Product count function -->
          </div>
        </div>
        <div class="menu-item icon">
          <i class="fas fa-shopping-cart"></i>
          <div class="count">
            3
            <!-- TODO Product count function -->
          </div>
        </div>
      </div>
      <div class="nav-items">
        <div class="menu-item"><a href="#/about">About</a></div>
        <div class="menu-item"><a href="#/contact">Contact</a></div>
        <div class="menu-item"><a href="#/login">Account</a></div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  name: "Nav",
};

import $ from "jquery";

$(function () {
  //Script for menu toggle
  $(".toggler").on("click", function () {
    $(".navbar").toggleClass("nav-tab");
    $(".mobile-menu").toggle();
    $(".ta-level").toggleClass("ta-level-tab");
  });
});
</script>
