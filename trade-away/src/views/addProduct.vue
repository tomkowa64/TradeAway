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
        <i class="fas fa-hand-holding"></i>
        <div class="info">
          <h3>Pickup in person</h3>
          <p>
            You allow client to come to you
            in person and get purchased product
          </p>
        </div>
        <i class="far fa-times-circle"></i>
      </div>
      <div class="variant variant-unselected">
        <i class="fas fa-boxes"></i>
        <div class="info">
          <h3>Parcel lockers</h3>
          <p>
            Purchased good will be sent to
            parcel locker requested by client
          </p>
        </div>
        <i style="color: #cf4e6c;" class="fas fa-check-circle"></i>
      </div>
      <div class="shipping-cost">
        <h3>I will take care of shipping costs</h3>
        <i class="fas fa-check-square"></i>
      </div>
    </div>
    <div class="parameters">
      <h1>Parameters</h1>
      <div class="parameter-box-group">
        <div class="parameter-box">
          <h2><b>Parameter</b></h2>
          <input />
        </div>
        <div class="parameter-box">
          <h2><b>Value</b></h2>
          <input />
        </div>
        <i class="fas fa-plus-square"></i>
      </div>
      <h1>Added</h1>
      <p><b>Condition:</b><span>New</span></p>
      <p><b>Producer:</b><span>ZARA</span></p>
      <p><b>Date of Production:</b><span>2019</span></p>
      <p><b>Color:</b><span>Brown</span></p>
      <p><b>Material:</b><span>Leather</span></p>
      <h1>Tags (up to 5)</h1>
      <div class="parameter-box-group">
        <div class="parameter-box">
          <h2><b>Tag</b></h2>
          <input />
        </div>
        <i class="fas fa-plus-square"></i>
      </div>
      <h1>Added</h1>
      <div class="tag-group">
        <div class="tag">RTV/AGD</div>
        <div class="tag">RTV/AGD</div>
        <div class="tag">RTV/AGD</div>
      </div>
    </div>
    <div class="overview">
      <h1>Overview</h1>
      <div class="points">
        TA POINTS<br>
        310<br>
        For Transaction
      </div>
      <div class="priority">
        Based on your TA Level offer will have priority<br>
        <span style="color: #cf4e6c;">HIGH</span><br>
        in offer display queue
      </div>
      <div class="sell-btn">SELL</div>
    </div>
  </section>
</template>
<script>
export default {};
</script>
<style lang="scss">
@import "../styles/ProductForm.scss";
</style>
