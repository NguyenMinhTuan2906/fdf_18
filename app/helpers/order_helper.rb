module OrderHelper

  def carts_size
    cart_data
    @cart.size
  end

  def order_size
    @order.line_items.size
  end

  def total_cost
    begin
      @order.line_items.map{|f| f.product.price * f.quantity }.sum
    rescue
      return 0
    end
  end

  def cart_data
    begin
      @cart = JSON.parse(cookies[:cart])
    rescue
      @cart = {}
    end
  end
end
