class OrdersController < ApplicationController
  before_action :cart_data, only:[:show]

  def show
    @order = Order.new
    @cart.each do |product_id, quantity|
      @order.line_items.includes(:products)
        .new(product_id: product_id, quantity: quantity)
    end
  end
end
