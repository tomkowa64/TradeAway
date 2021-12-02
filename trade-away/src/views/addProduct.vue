<template>
  <section class="add-product-form">
    <div class="heading">Create Offer</div>
    <div class="basic-information">
      <h1>Basic Information</h1>
      <div class="information-property">
        <div class="property-name">Product Name</div>
        <div class="property-value">
          <input />
        </div>
      </div>
      <div class="information-property">
        <div class="property-name">Price</div>
        <div class="property-value">
          <input />
        </div>
      </div>
      <div class="information-property">
        <div class="property-name">Quantity</div>
        <div class="property-value">
          <input />
        </div>
      </div>
      <div class="state-group">
        <div class="state-item">NEW</div>
        <div class="state-item">USED</div>
        <div class="state-item">DAMAGED</div>
      </div>
    </div>
    <div class="photos">
      <i class="fas fa-images"></i>
      <div class="images-group">
        <div class="photo">
          <img src="../assets/wallet.jpg" />
        </div>
        <div class="photo">
          <img src="../assets/wallet.jpg" />
        </div>
        <div class="photo">
          <img src="../assets/wallet.jpg" />
        </div>
      </div>
    </div>
    <div class="description">
      <h1>Description</h1>
      <p>
        <textarea> </textarea>
      </p>
    </div>
    <div class="delivery">
      <h1>Select possible delivery variances</h1>
      <div class="variant">
        <i class="fas fa-shipping-fast"></i>
        <div class="info">
          <h3>Courier Delivery</h3>
          <p>
            Let know clients that you will take care of shipment via delivery
            company
          </p>
        </div>
        <i class="far fa-times-circle"></i>
      </div>
      <div class="variant">
        <i class="fas fa-shipping-fast"></i>
        <div class="info">
          <h3>Courier Delivery</h3>
          <p>
            Let know clients that you will take care of shipment via delivery
            company
          </p>
        </div>
        <i class="far fa-times-circle"></i>
      </div>
      <div class="variant">
        <i class="fas fa-shipping-fast"></i>
        <div class="info">
          <h3>Courier Delivery</h3>
          <p>
            Let know clients that you will take care of shipment via delivery
            company
          </p>
        </div>
        <i class="far fa-times-circle"></i>
      </div>
    </div>
  </section>
</template>
<script>
export default {};
</script>
<style lang="scss">
@import "../styles/ProductForm.scss";
</style>
