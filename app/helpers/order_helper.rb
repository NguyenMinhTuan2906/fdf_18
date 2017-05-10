module OrderHelper

  def carts_size
    cart_data
    @cart.size
  end

  def total_cost
    @order.line_items.map{|f| f.product.price * f.quantity }.sum
  end

  def cart_data
    begin
      @cart = JSON.parse(cookies[:cart])
    rescue
      @cart = {}
    end
  end
end
