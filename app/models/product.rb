class Product < ApplicationRecord
    has_one_attached :image
    def self.search(search)
        if search
            where('title  LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
