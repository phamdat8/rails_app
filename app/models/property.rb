class Property < ApplicationRecord
  has_one_attached :image
  has_many :property_values
end
