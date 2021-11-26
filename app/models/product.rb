class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :category
    has_many :properties, through: :product_property
    has_many :product_types
    has_many :product_property, dependent: :destroy
    def self.search(search)
        if search
            where('title  LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
