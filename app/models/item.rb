class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    has_many :cart_items
    has_many :order_detail
    validates :is_active, inclusion: {in: [true, false]}

    enum is_active: { "販売中": 0, "販売停止中": 1, }
    
    def with_tax_price
        (price * 1.1).floor
    end
    
end
