class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      redirect_to admin_root_path
    end
    
    private
    def order_params
        params.require(:order).permit(:customer_id, :postage, :payment,:method_of_payment, :postal_code, :address, :name, :status)
    end
end
