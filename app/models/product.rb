class Product < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end
