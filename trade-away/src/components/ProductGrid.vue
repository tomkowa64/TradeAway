<template>
  <div class="product-grid">
    <div class="stample">
      <slot name="stample"></slot>
    </div>
    <div class="product-grid-item">
      <img src="@/assets/backpack.png" />
      <h1 class="name">Backpack Adidas</h1>
      <h3 class="new">NEW</h3>
      <h2 class="price">69.99$</h2>
      <div class="cart-btn">
        <i class="fas fa-cart-plus"></i>
      </div>
    </div>
    <div class="product-grid-item">
      <img src="@/assets/blender.png" />
      <h1 class="name">Blender</h1>
      <h3 class="used">USED</h3>
      <h2 class="price">24.50$</h2>
      <div class="cart-btn">
        <i class="fas fa-cart-plus"></i>
      </div>
    </div>
    <div class="product-grid-item">
      <img src="@/assets/shoe.png" />
      <h1 class="name">NIKE Shoes</h1>
      <h3 class="damaged">DAMAGED</h3>
      <h2 class="price">19.99$</h2>
      <div class="cart-btn">
        <i class="fas fa-cart-plus"></i>
      </div>
    </div>
    <div class="product-grid-item">
      <img src="@/assets/dress.png" />
      <h1 class="name">Dress</h1>
      <h3 class="used">USED</h3>
      <h2 class="price">29.29$</h2>
      <div class="cart-btn">
        <i class="fas fa-cart-plus"></i>
      </div>
    </div>
    <div class="product-grid-item">
      <img src="@/assets/dress.png" />
      <h1 class="name">Dress</h1>
      <h3 class="used">USED</h3>
      <h2 class="price">29.29$</h2>
      <div class="cart-btn">
        <i class="fas fa-cart-plus"></i>
      </div>
    </div>
  </div>
</template>
<style></style>
<script>
export default {
  name: "ProductGrid",
};
</script>
