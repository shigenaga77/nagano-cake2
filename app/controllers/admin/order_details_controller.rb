class Admin::OrderDetailsController < ApplicationController
     def top
        @order_detail = OrderDetail.new(order_detail_params)
    end
    
    private
    def order_detail_params
         params.require(:order_detail).permit(:item_id, :order_id, :amount, :price)
    end
end
