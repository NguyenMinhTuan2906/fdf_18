class OrdersController < ApplicationController
  before_action :cart_data, only:[:show]

  def create
    unless current_user
      store_location
      response_not_login
    else
      cart_data
      @order = Order.new(user_id: current_user.id, status: 1)
      @cart.each do |product_id, quantity|
        @order.line_items.includes(:products)
          .new(product_id: product_id, quantity: quantity)
      end
      @order.update_attributes total_cost: total_cost

      disparity = compare_product_quantity

      if disparity
        response_not_enough_quantity disparity
      else
        if @order.save
          cookies.delete :cart
          flash[:success] = t "thank_payed"
          render_success_order @order.id
        else
          render_text_error t("error")
        end
      end
    end
  end

  def show
    if params[:id]
      @order = Order.includes(:line_items).find_by id: params[:id]
    else
      @order = Order.new
      @cart.each do |product_id, quantity|
        @order.line_items.includes(:products)
          .new(product_id: product_id, quantity: quantity)
      end
    end
  end

  def compare_product_quantity
    @order.line_items.each do |f|
      if f.product.quantity < 0
        result = {}
        result[:product_name] = f.product.name
        result[:quantity] = (f.product.quantity + f.quantity)
        return result
      end
    end
    return nil
  end
end
