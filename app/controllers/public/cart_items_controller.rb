class Public::CartItemsController < ApplicationController
    def index
        @cart_items = Cart_item.all
    end
    
    def update
    end
    
    def destroy
    end
    
    def destroy_all
    end
    
    def create
    end
end
