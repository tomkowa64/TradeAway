<template>
  <section class="home">
    <SearchBar />
    <div class="product-section-tag">
      <div>
        Trending | <span class="tag-show-all"><a href="">Show All <i class="fas fa-arrow-down"></i></a></span>
      </div>
      <div class="product-list">
        <!-- Product list items here TODO -->
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
<style scoped>
@import url('../styles/Home.scss');
</style>
