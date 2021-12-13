<template>
  <section class="product">
    <div class="general-info">
      <div class="product-image">
        <img src="../assets/sample-product.jpg" alt="" />
      </div>
      <div class="product-general-information">
        <div class="product-name">
          T-Shirt Full Sleeve
          <div class="product-state">NEW</div>
        </div>
        <div class="product-price">49.99$</div>
        <div class="sold-stock">
          200 people bought 400 items | <b>1000 left</b>
        </div>
        <div class="icons-group">
          <!-- POSSIBLE DEBUG TO DO -->
          <div class="item">
            <div class="icon"><i class="far fa-smile"></i></div>
            <div class="description">
              <span style="color: #cf4e6c">TA</span> level of seller
            </div>
          </div>
          <div class="item">
            <div class="icon"><i class="fas fa-shipping-fast"></i></div>
            <div class="description">
              <span style="color: #cf4e6c">Shipping</span> possible
            </div>
          </div>
          <div class="item">
            <div class="icon"><i class="fas fa-hand-holding"></i></div>
            <div class="description">
              <span style="color: #cf4e6c">Personal</span> pickup possible
            </div>
          </div>
        </div>
        <div class="quantity-input">
          <div class="minus"><i class="fas fa-minus"></i></div>
          <div class="quantity" contentEditable="true">0</div>
          <div class="plus"><i class="fas fa-plus"></i></div>
        </div>
        <div class="buy-product-button">Add to Cart</div>
      </div>
    </div>
    <div class="details">
      <div class="product-detailed-description">
        <b><span style="color: #cf4e6c">Description</span></b>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum
          dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
          commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
          velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
          occaecat cupidatat non proident, sunt in culpa qui officia deserunt
          mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
          adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
          magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
          ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
          fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
          sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
      </div>
      <div class="product-details-group">
        <b class="detail-title"><span style="color: #cf4e6c">Details</span></b>
        <p><b>Condition: </b>New</p>
        <p><b>Date of Production: </b>1999</p>
        <p><b>Color: </b>Red, White, Black</p>
        <p><b>Producer:</b> H&M</p>
        <p><b>Size: </b>Large</p>
        <p><b>Accessories included: </b>Nope</p>
        <p><b>Suggested ironing temperature: </b>69 &deg; C</p>
        <div class="tags">
          <div class="title">
            <span style="color: #cf4e6c">Tags</span>
          </div>
          <div class="tags-group">
            <div class="tag">Clothes</div>
          </div>
        </div>
      </div>
    </div>
    <div class="seller">
      <div class="avatar">
        <img src="../assets/user-profile.jpeg" />
      </div>
      <div class="seller-name">Wonderhefty</div>
      <div class="seller-information">
        <div class="account-information">
          <p class="name">Anna James</p>
          <p class="gray-color">Rzeszów, Podkarpackie</p>
          <p class="account-activity">
            <b class="activity-icon">
              <i class="fas fa-hands-helping"></i>
            </b>
            <span>
              <b class="main-color">10</b>
              items bought
            </span>
          </p>
          <p class="account-activity">
            <b class="activity-icon">
              <i class="fas fa-dollar-sign"></i>
            </b>
            <span>
              <b class="main-color">2</b>
              items sold
            </span>
          </p>
        </div>
        <div class="personal-information">
          <div class="personal">
            <p class="data">
              <b class="key">Name:</b>
              <span class="value gray-color">Anna</span>
            </p>
            <p class="data">
              <b class="key">Surname:</b>
              <span class="value gray-color">James</span>
            </p>
            <p class="data">
              <b class="key">Location:</b>
              <span class="value gray-color">Rzeszów, 35-103, Poland</span>
            </p>
          </div>
          <div class="contact">
            <p class="data">
              <b class="key">Phone:</b>
              <span class="value gray-color">+48 123 456 789</span>
            </p>
            <p class="data">
              <b class="key">Email:</b>
              <span class="value gray-color">anaj@ex.com</span>
            </p>
            <div class="contact-btn">Contact</div>
          </div>
        </div>
      </div>
    </div>
    <div class="common">
      <div class="title">Common products</div>
      <div class="item-group">
        <div class="item">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <div class="item">
          <img src="../assets/blender.png" />
          <p class="name">Blender</p>
          <p class="used">Used</p>
          <p class="main-color price"><b>24.90$</b></p>
          <i class="fas fa-arrow-alt-circle-right"></i>
        </div>
        <i class="fas fa-arrow-circle-right"></i>
      </div>
    </div>
  </section>
</template>
<script>
import $ from "jquery";

export default {};

$(function () {
  var slidePosition = 0;
  SlideShow();

  function SlideShow() {
    var i;
    var slides = document.getElementsByClassName("Containers");
    for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
    }
    slidePosition++;
    if (slidePosition > slides.length) {
      slidePosition = 1;
    }
    slides[slidePosition - 1].style.display = "block";
    setTimeout(SlideShow, 5000); // Change image every 2 seconds
  }

  //MAGNIFY EFFECT
  $(".plus").on("click", () => {
    var quantityValue = parseInt($(".quantity").text());
    $(".quantity").text(quantityValue + 1);
  });
  $(".minus").on("click", () => {
    var quantityValue = parseInt($(".quantity").text());
    if (quantityValue > 0) {
      $(".quantity").text(quantityValue - 1);
    }
  });

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
    glass.style.backgroundSize =
      img.width * zoom + "px " + img.height * zoom + "px";
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
      if (x > img.width - w / zoom) {
        x = img.width - w / zoom;
      }
      if (x < w / zoom) {
        x = w / zoom;
      }
      if (y > img.height - h / zoom) {
        y = img.height - h / zoom;
      }
      if (y < h / zoom) {
        y = h / zoom;
      }
      /* Set the position of the magnifier glass: */
      glass.style.left = x - w + "px";
      glass.style.top = y - h + "px";
      /* Display what the magnifier glass "sees": */
      glass.style.backgroundPosition =
        "-" + (x * zoom - w + bw) + "px -" + (y * zoom - h + bw) + "px";
    }

    function getCursorPos(e) {
      var a,
        x = 0,
        y = 0;
      e = e || window.event;
      /* Get the x and y positions of the image: */
      a = img.getBoundingClientRect();
      /* Calculate the cursor's x and y coordinates, relative to the image: */
      x = e.pageX - a.left;
      y = e.pageY - a.top;
      /* Consider any page scrolling: */
      x = x - window.pageXOffset;
      y = y - window.pageYOffset;
      return { x: x, y: y };
    }
  }
  magnify("magnify", 3);
});
</script>

<style lang="scss">
@import url("../styles/Product.scss");
</style>
