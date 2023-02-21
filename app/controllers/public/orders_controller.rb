class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    
    @total_price = @order.inject(0) { |sum, order| sum + order.subtotal }
  end

  def complete
  end
  
  def create
    @order = Order.new
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
     params.require(:order).permit(:method_of_payment, :postal_code, :address, :name)
  end
   
end
