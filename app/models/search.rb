class Search < ApplicationRecord
  def products
    @products ||= find_products
  end

  private

  def find_products
    products = Product.order(name: :asc)
    products = products.where("name LIKE ?", "%#{keywords}%")
    products = products.where(category_id: category_id) if category_id.present?
    products = products.where("price >= ?", min_price) if min_price.present?
    products = products.where("price <= ?", max_price) if max_price.present?
    products = products.where("current_score >= ?", min_rating) if min_rating.present?
    products
  end
end
