<template>
    <section class="product">
        <div class="general-info">
            <div class="product-image">
                <img src="../assets/dress.png" alt="" id="magnify">
            </div>
            <div class="product-general-information">
                <div class="product-name">Dress Flowers Edition 2137</div>
                <div class="product-price">49.99$</div>
                <div class="sold-stock">200 people bought 400 items | <b>1000 left</b></div>
                <div class="icons-group">
                    <div class="item">
                        <div class="icon"><i class="far fa-smile"></i></div>
                        <div class="description">
                            A lot of happy customers who bought this product
                        </div>
                    </div>
                    <div class="item">
                        <div class="icon"><i class="fas fa-shipping-fast"></i></div>
                         <div class="description">
                            Fast shipment, order now and get your product in 1 day
                        </div>
                        <div class="more-about">
                            Shippings
                            <i class="fas fa-arrow-circle-right"></i>
                        </div>
                    </div>
                    <div class="item">
                        <div class="icon"><i class="fas fa-undo-alt"></i></div>
                         <div class="description">
                            You can get your money back if you are unsatisfied within 1 week
                        </div>
                        <div class="more-about">
                            Returns
                            <i class="fas fa-arrow-circle-right"></i>
                        </div>
                    </div>
                    <div class="item">
                        <div class="icon"><i class="fas fa-wallet"></i></div>
                         <div class="description">
                            Convenient payments
                        </div>
                        <div class="more-about">
                            Payments
                            <i class="fas fa-arrow-circle-right"></i>
                        </div>
                    </div>
                </div>
                <div class="quantity-input">
                    <div class="plus"><i class="fas fa-plus"></i></div>
                    <div class="quantity" contentEditable="true">0</div>
                    <div class="minus"><i class="fas fa-minus"></i></div>
                </div>
                <div class="buy-product-button">
                    Add to Cart
                </div>
            </div>
        </div>
        <div class="details">
            <div class="product-detailed-description">
                <b><span style="color: #cf4e6c;">Product</span> Description</b>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                    sed do eiusmod tempor incididunt ut labore et dolore magna 
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                    Duis aute irure dolor in reprehenderit in voluptate velit
                    esse cillum dolore eu fugiat nulla pariatur. Excepteur
                    sint occaecat cupidatat non proident, sunt in culpa qui 
                    officia deserunt mollit anim id est laborum.
                </p>
                <div class="image-group">
                    <!-- Slideshow container -->
                    <div class="slideshow-container fade">

                    <!-- Full images with numbers and message Info -->
                    <div class="Containers">
                        <div class="MessageInfo">1 / 3</div>
                        <img src="../assets/dress1.jpg" style="width:100%">
                        <div class="Info">First caption</div>
                    </div>

                    <div class="Containers">
                        <div class="MessageInfo">2 / 3</div>
                        <img src="../assets/dress2.jpg" style="width:100%">
                        <div class="Info">Second Caption</div>
                    </div>

                    <div class="Containers">
                        <div class="MessageInfo">3 / 3</div>
                        <img src="../assets/dress3.jpg" style="width:100%">
                        <div class="Info">Third Caption</div>
                    </div>

                    <!-- Back and forward buttons -->
                    <a class="Back" @click="plusSlides(-1)">&#10094;</a>
                    <a class="forward" @click="plusSlides(1)">&#10095;</a>
                    </div>
                    <br>

                    <!-- The circles/dots -->
                    <div style="text-align:center">
                    <span class="dots" @click="currentSlide(1)"></span>
                    <span class="dots" @click="currentSlide(2)"></span>
                    <span class="dots" @click="currentSlide(3)"></span>
                    </div> 
                </div>
            </div>
            <div class="product-details-group">
                <b class="detail-title"><span style="color: #cf4e6c;">Product</span> Parameters</b>
                <p><b>Condition: </b>New</p>
                <p><b>Date of Production: </b>1999</p>
                <p><b>Color: </b>Red, White, Black</p>
                <p><b>Producer:</b> H&M</p>
                <p><b>Size: </b>Large</p>
                <p><b>Accessories included: </b>Nope</p>
                <p><b>Suggested ironing temperature: </b>69 &deg; C</p>
                <div class="localization">
                    <div class="title">
                    <span style="color: #cf4e6c;">Seller</span>    
                    Localization</div>
                    <div class="information">
                        <div class="location-name">
                            <i class="fas fa-map-marker-alt"></i>
                            <span style="padding-left: 20px;">Ul. Hetmańska 130 Rzeszów <b>Podkarpackie</b>
                            </span>
                        </div>
                        <div class="graphic">
                            <img src="../assets/map-graphic.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="seller">
            <div class="seller-info">
                <div class="seller-avatar">
                    <img src="../assets/user-icon.png" alt="">
                </div>
                <div class="seller-icons-group">
                   <p>Sample Username</p>
                    <div class="item">
                        <span>
                            <i class="fas fa-phone-alt"></i>
                        </span>
                        +48 123 456 789
                    </div>
                    <div class="item">
                        <span>
                            <i class="fas fa-envelope"></i>
                        </span>
                        sample@sample.com
                    </div>
                    <div class="item">
                        <span>
                            <i class="fas fa-map-marker-alt"></i>
                        </span>
                        Podkarpackie
                    </div>
                </div>
                <div class="msg-input">
                    <textarea name="" id="" cols="30" rows="10" placeholder="Write a message..."></textarea>
                </div>
                <div class="msg-button">
                    <i class="fas fa-location-arrow"></i>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
import $ from 'jquery';

export default {}

    $(function(){
    //CAROUSEL
    var slidePosition = 1;
    SlideShow(slidePosition);

    // forward/Back controls
    function plusSlides(n) {
    SlideShow(slidePosition += n);
    }

    //  images controls
    function currentSlide(n) {
    SlideShow(slidePosition = n);
    }

    function SlideShow(n) {
    var i;
    var slides = document.getElementsByClassName("Containers");
    var circles = document.getElementsByClassName("dots");
    if (n > slides.length) {slidePosition = 1}
    if (n < 1) {slidePosition = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < circles.length; i++) {
        circles[i].className = circles[i].className.replace(" enable", "");
    }
    slides[slidePosition-1].style.display = "block";
    circles[slidePosition-1].className += " enable";
    } 



    //MAGNIFY EFFECT
    $('.plus').on('click', () => {
        var quantityValue = parseInt($('.quantity').text());
        $('.quantity').text(quantityValue + 1);
    })
    $('.minus').on('click', () => {
        var quantityValue = parseInt($('.quantity').text());
        if(quantityValue > 0){
            $('.quantity').text(quantityValue - 1);
        }
    })

    function magnify(imgID, zoom) {
    var img, glass, w, h, bw;
    img = document.getElementById(imgID);

    /* Create magnifier glass: */
    glass = document.createElement("DIV");
    glass.setAttribute("class", "img-magnifier-glass");

    /* Insert magnifier glass: */
    img.parentElement.insertBefore(glass, img);

    /* Set background properties for the magnifier glass: */
    glass.style.backgroundImage = "url('" + img.src + "')";
    glass.style.backgroundRepeat = "no-repeat";
    glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
    bw = 3;
    w = glass.offsetWidth / 2;
    h = glass.offsetHeight / 2;

    /* Execute a function when someone moves the magnifier glass over the image: */
    glass.addEventListener("mousemove", moveMagnifier);
    img.addEventListener("mousemove", moveMagnifier);

    /*and also for touch screens:*/
    glass.addEventListener("touchmove", moveMagnifier);
    img.addEventListener("touchmove", moveMagnifier);
    function moveMagnifier(e) {
        var pos, x, y;
        /* Prevent any other actions that may occur when moving over the image */
        e.preventDefault();
        /* Get the cursor's x and y positions: */
        pos = getCursorPos(e);
        x = pos.x;
        y = pos.y;
        /* Prevent the magnifier glass from being positioned outside the image: */
        if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
        if (x < w / zoom) {x = w / zoom;}
        if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
        if (y < h / zoom) {y = h / zoom;}
        /* Set the position of the magnifier glass: */
        glass.style.left = (x - w) + "px";
        glass.style.top = (y - h) + "px";
        /* Display what the magnifier glass "sees": */
        glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
    }

    function getCursorPos(e) {
        var a, x = 0, y = 0;
        e = e || window.event;
        /* Get the x and y positions of the image: */
        a = img.getBoundingClientRect();
        /* Calculate the cursor's x and y coordinates, relative to the image: */
        x = e.pageX - a.left;
        y = e.pageY - a.top;
        /* Consider any page scrolling: */
        x = x - window.pageXOffset;
        y = y - window.pageYOffset;
        return {x : x, y : y};
    }
    }
    magnify("magnify", 3);
})
</script>

<style lang="scss">
    @import url('../styles/Product.scss');
</style>