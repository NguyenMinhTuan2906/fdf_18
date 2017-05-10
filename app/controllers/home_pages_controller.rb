class HomePagesController < ApplicationController
  def home
    @categories = Category.includes(:products).select(:id, :name, :description)
    @products = Product.select(:id, :name, :current_score).favorite
  end

  def about
  end
end
