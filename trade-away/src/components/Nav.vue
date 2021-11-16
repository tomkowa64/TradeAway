<template>
  <section class="navbar">
    <div class="company-name">
      <div class="menu-toggle">
        <i class="fas fa-bars toggler"></i>
      </div>
      <a href="/">
        <span class="logo-font" style="color: #303744">Trade</span
        ><span class="logo-font" style="color: #cf4e6c; opacity: 0.8"
          >Away</span
        >
      </a>
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
      <div class="menu-item"><a href="#/about">About</a></div>
      <div class="menu-item"><a href="#/contact">Contact</a></div>
      <div class="menu-item"><a href="#/login">Account</a></div>
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
    $(".menu").toggle();
  });
});
</script>
