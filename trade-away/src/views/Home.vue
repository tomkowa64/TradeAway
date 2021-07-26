<template>
  <section class="home">
    <SearchBar />
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
