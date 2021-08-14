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
            <input type="text" name="email" placeholder="Email">
            <div class="form-label">
              Password
            </div>
            <input type="password" name="password" placeholder="Password">
            <div class="form-remember">
              <input type="checkbox"> Remember me
            </div>
            <a href="" class="pwd-recovery">Password recovery</a>
            <div class="form-button">Log In</div>
          </div>
        </form>
      </div>
    </section>
</template>
<style lang="scss">
  @import url('../styles/Auth.scss');
</style>
