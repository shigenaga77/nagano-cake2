class Public::CustomersController < ApplicationController
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to customer_path(@customer)
    end
    
    def comfirm
         @customer = Customer.find(params[:id])
    end
    
    def withdraw
        @customer = Customer.find(params[:id])
        # is_deletedカラムをtrueに変更することにより削除フラグを立てる
        @customer.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to about_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end
end
