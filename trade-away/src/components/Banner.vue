<template>
    <section class="banner">
    </section>
</template>
<script>
import $ from 'jquery';

export default ({
  name: 'Banner'
})


//Static URL have to be replaced
$(function(){
    $(".banner").on("click",function(){
        window.location.replace("http://localhost:8080/#/Auth")
    })
})
        
</script>

<style scoped>
@import url('../styles/Home.scss');
</style>