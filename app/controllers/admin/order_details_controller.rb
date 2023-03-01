class Admin::OrderDetailsController < ApplicationController
    def top
        @order_detail = OrderDetail.new(order_detail_params)
    end
    
    def update
        @order = Order.find(params[:id])
        # @order_detail = OrderDetail.find(params[:id])
        @order_details = @order.order_details.all
        @order_details.update(order_detail_params)
        redirect_to admin_order_path
    end
    
    private
    
    def order_params
        params.require(:order).permit(:customer_id, :postage, :payment,:method_of_payment, :postal_code, :address, :name, :status)
    end
    
    def order_detail_params
         params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
    end
end
