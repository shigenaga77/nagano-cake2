class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      @order.order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
      redirect_to admin_order_path(@order)
    end
    
    private
    def order_params
        params.require(:order).permit(:customer_id, :postage, :payment,:method_of_payment, :postal_code, :address, :name, :status)
    end
end
