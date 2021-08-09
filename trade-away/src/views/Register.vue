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
              Username
            </div>
            <input type="text" name="username" placeholder="Username">
            <div class="form-label">
              Password
            </div>
            <input type="password" name="password" placeholder="Password">
            <div class="form-label">
              Repeat Password
            </div>
            <input type="password" name="password" placeholder="Repeat Password">
            <div class="form-label">
              E-mail
            </div>
            <input type="text" name="username" placeholder="Email">
            <div class="form-remember">
              <input type="checkbox"> I have read and accepted terms
            </div>
            <div class="form-button">Register</div>
          </div>
        </form>
      </div>
    </section>
</template>
<style lang="scss">
  @import url('../styles/Auth.scss');
</style>
