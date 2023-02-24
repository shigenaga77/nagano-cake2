class Admin::HomesController < ApplicationController
    def top
        @order_detail = OrderDetail.new
    end
end
