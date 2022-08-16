class OrderDetailsController < ApplicationController
  def show
    @order_id = params[:id]
    @ods = OrderDetail.where order_id: params[:id]
  end
end
