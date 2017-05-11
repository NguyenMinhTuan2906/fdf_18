$(document).ready(function(){

  $('#add_to_cart').on('click',function(){
    var product_id = Number($('#product_id').val());
    var hash = {};

    if (Cookies.getJSON('cart')){
      hash = Cookies.getJSON('cart');
      if (hash.hasOwnProperty(product_id)) {
        hash[product_id] ++;
      } else {
        hash[product_id] = 1;
      }
    } else {
      hash[product_id] = 1;
    }

    Cookies.set('cart', hash);
    $('#cart_size').text(Object.keys(Cookies.getJSON('cart')).length);
    alert(I18n.t('javascript.added_to_cart'));
  })

  $('.delete_order').on('click',function(){

    var product_id = Number($(this).data('myval'));
    var hash = {};
    if (Cookies.getJSON('cart')){
      hash = Cookies.getJSON('cart');
      if (hash.hasOwnProperty(product_id)) {
        delete hash[product_id]
      }
    }

    Cookies.set('cart', hash);
    $('#cart_size').text(Object.keys(Cookies.getJSON('cart')).length);
    var parent = document.getElementById('carts_list');
    var node = document.getElementById('product_cart_' + product_id);
    parent.removeChild(node);
    $('#carts_size').text(Object.keys(Cookies.getJSON('cart')).length);
    $('#total_cost').text(recaculate_cost (hash));
    alert(I18n.t('javascript.remove_cart'));
  })

  $('.quantity_pro_cart input').on('keypress', function(e){
    if (e.which != 8 && isNaN(String.fromCharCode(e.which))) {
      e.preventDefault();
      alert(I18n.t('javascript.input_number'));
    }

    if (e.keyCode == '13'){
      e.preventDefault();
      var quantity = $(this).val();
      var product_id = Number($(this).data('product_id'));
      var hash = {};

    if (Cookies.getJSON('cart')){
      hash = Cookies.getJSON('cart');
      if (hash.hasOwnProperty(product_id)) {
        hash[product_id] = quantity;
      }
    }

    Cookies.set('cart', hash);
    $('#total_cost').text(recaculate_cost (hash));
    alert(I18n.t('javascript.updated'));
    }
  })
});

function recaculate_cost(hash){
  var total_product_cost = 0
  $.each( hash, function( product_id, quantity ) {
    var element = $('#product_cart_' + product_id);
    total_product_cost += quantity * element.data('price');
  });
  return total_product_cost
}
