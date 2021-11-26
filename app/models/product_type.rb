class ProductType < ApplicationRecord
  belongs_to :product
  has_one_attached :image
  has_many :property_values
end
