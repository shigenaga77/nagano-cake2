class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    # 自分の住所
  if params[:order][:sel_add] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所
  elsif params[:order][:sel_add] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    # 新規住所
  elsif params[:order][:sel_add] == "2"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
  else
    render 'new'
  end
    
    @cart_items = CartItem.all
    @order.customer_id = current_customer.id
    @total_price = @cart_items.inject(0) { |sum, order| sum + order.subtotal }
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end
  
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
  end
  
  private
  
  def order_params
     params.require(:order).permit(:customer_id, :postage, :payment,:method_of_payment, :postal_code, :address, :name)
  end
   
end
