<template>
    <div class="search-bar">
        <input type="text"/>
        <span class="search-bar-span">Find</span>
        <span class="search-bar-span">something</span>
    </div>
</template>
<script>
import $ from 'jquery'

export default ({
  name: 'SearchBar'
})

$(function() {

    //Script for disappearing search box placeholder
    $(".search-bar-span").css({"position": "absolute"})
    $(".search-bar-span:first").css({"color": "#333333", "font-weight": "700" , "opacity" : "0.8"})
    $(".search-bar-span").eq("1").css({"color": "#d0cee0", "left": "2.2em" })

    $("input").on("focus", function(){  
    $(".search-bar-span").hide();
    })
    
    $("input").on("blur", function(){
    if ($(this).val() == "") { $(".search-bar-span").css("display", "inline-block")}
    })
        
        $(".search-bar-span").click(function(){
           
        $(".search-bar-span").hide()
    });

})


        
</script>

<style scoped>
@import url('../styles/Home.scss');
</style>