class Order < ApplicationRecord
    enum method_of_payment: { credit_card: 0, transfer: 1 }
end
