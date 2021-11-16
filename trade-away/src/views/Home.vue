<template>
  <section class="home">
    <Banner />
    <ProductGrid>
      <template #stample> TRENDING </template>
    </ProductGrid>
    <ProductGrid>
      <template #stample> SALE </template>
    </ProductGrid>
    <ProductGrid>
      <template #stample> YOUR PICKS </template>
    </ProductGrid>
    <Promotion />
    <Partners />
  </section>
</template>

<script>
// @ is an alias to /src
import Partners from "../components/Partners.vue";
import Banner from "../components/Banner.vue";
import ProductGrid from "../components/ProductGrid.vue";
import Promotion from "../components/Promotion.vue";

export default {
  name: "Home",
  components: {
    Partners,
    Banner,
    ProductGrid,
    Promotion,
  },
};
</script>
<style lang="scss">
@import "../styles/Home.scss";
</style>
