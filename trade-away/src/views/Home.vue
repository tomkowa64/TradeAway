<template>
  <section class="home">
    <Banner />
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
    <!-- -->
        <div class="product-section-tag">
      <div>
        On Sale | <span class="tag-show-all"><a href="">Show All <i class="fas fa-arrow-down"></i></a></span>
      </div>
    </div>
    <div class="product-list">
      <div class="product-list-item" style="background: #e3c281">
        <img src="../assets/backpack.png" alt="">
        <div class="product-list-item-name">Product Name</div>
        <div class="product-list-item-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore.
        </div>
        <div class="product-list-item-price">
          <s>69.99$</s> 30.99$
        </div>
      </div>

      <div class="product-list-item" style="background: #e8467e">
        <img src="../assets/blender.png" alt="">
        <div class="product-list-item-name">Product Name</div>
        <div class="product-list-item-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore.
        </div>
        <div class="product-list-item-price">
          <s>29.99$</s> 10.0$
        </div>
      </div>

      <div class="product-list-item" style="background: #98a1f5">
        <img src="../assets/shoe.png" alt="">
        <div class="product-list-item-name">Product Name</div>
        <div class="product-list-item-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore.
        </div>
        <div class="product-list-item-price">
          <s>30.99$</s> 21.37$
        </div>
      </div>

      <div class="product-list-item" style="background: #90d1b7">
        <img src="../assets/dress.png" alt="">
        <div class="product-list-item-name">Product Name</div>
        <div class="product-list-item-desc">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore.
        </div>
        <div class="product-list-item-price">
          <s>119.99$</s> 80$
        </div>
      </div>
    </div>
    <!-- -->
    <div class="product-section-tag">
      <div>
        Your picks | <span class="tag-show-all"><a href="">Show All <i class="fas fa-arrow-down"></i></a></span>
      </div>
    </div>
    <div class="product-list">
      <div class="product-list-item" style="background: #ac82bf">
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

      <div class="product-list-item" style="background: #00bec4">
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

      <div class="product-list-item" style="background: #c879d1">
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

      <div class="product-list-item" style="background: #e37d6d">
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

  <Partners />
  <PartnersJoin />
  </section>
</template>

<script>
// @ is an alias to /src
import SearchBar from '../components/SearchBar.vue'
import Partners from '../components/Partners.vue'
import PartnersJoin from '../components/PartnerJoin.vue'
import Banner from '../components/Banner.vue'

export default {
  name: 'Home',
    components: {
    SearchBar,
    Partners,
    PartnersJoin,
    Banner
  }
}
</script>
<style lang="scss">
  @import url('../styles/Home.scss');
</style>
