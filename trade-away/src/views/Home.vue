<template>
  <section class="home">
    <SearchBar />
    <div class="product-section-tag">
      <div>
        Trending | <span class="tag-show-all"><a href="">Show All <i class="fas fa-arrow-down"></i></a></span>
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

      <div class="product-list-item" style="background: #15a123">
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
  </section>
</template>

<script>
// @ is an alias to /src
import SearchBar from '../components/SearchBar.vue'

export default {
  name: 'Home',
    components: {
    SearchBar
  }
}
</script>
<style  lang="scss">
@import url('../styles/Home.scss');
</style>
