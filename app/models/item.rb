class Item < ApplicationRecord
    has_many :genre_items
    has_many :genres, through: :genre_items

end
