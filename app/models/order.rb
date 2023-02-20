class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_detail
    enum method_of_payment: { credit_card: 0, transfer: 1 }
end
