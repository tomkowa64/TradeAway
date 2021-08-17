<template>
    <section class="product">
        <div class="general-info">
            <div class="product-image">
                <img src="../assets/dress.png" alt="">
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
                    <div class="quantity">0</div>
                    <div class="minus"><i class="fas fa-minus"></i></div>
                </div>
                <div class="buy-product-button">
                    Buy
                </div>
            </div>
        </div>
        <div class="details">
            <div class="detail">

            </div>
            <div class="detail">

            </div>
            <div class="detail">

            </div>
            <div class="detail">

            </div>
            <div class="detail">

            </div>
            <div class="detail">

            </div>
        </div>
        <div class="seller">
            <div class="seller-avatar">

            </div>
            <div class="seller-info">

            </div>
        </div>
    </section>
</template>
<script>
import $ from 'jquery';

export default {}

$(function(){
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
})
</script>

<style lang="scss">
    @import url('../styles/Product.scss');
</style>