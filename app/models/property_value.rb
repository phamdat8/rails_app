class PropertyValue < ApplicationRecord
  belongs_to :product_type
  belongs_to :property
end
