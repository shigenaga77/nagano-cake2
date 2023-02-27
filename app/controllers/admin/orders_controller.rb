class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
    end
    
    def update
    end
    
    private
  
    def order_params
    params.require(:order).permit(:customer_id, :postage, :payment,:method_of_payment, :postal_code, :address, :name)
    end
end
