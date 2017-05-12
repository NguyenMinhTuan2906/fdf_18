class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  enum status: [:unpaid, :paid]
  after_create :update_product_quantity
  accepts_nested_attributes_for :line_items

  def update_product_quantity
    self.line_items.each do |item|
      item.product.update_attributes(quantity:
        (item.product.quantity - item.quantity))
    end
  end
end
