class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    enum method_of_payment: { credit_card: 0, transfer: 1 }
    enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "配送準備中": 3, "配送済み": 4 }
    
    def total_amount
        order_details.pluck(:amount).sum
    end
end
