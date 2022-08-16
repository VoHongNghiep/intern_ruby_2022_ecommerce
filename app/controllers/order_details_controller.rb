class OrderDetailsController < ApplicationController
  def show
    @order_id = params[:id]
    @order_total = Order.find(params[:id])
    @ods = OrderDetail.includes(:product).where order_id: params[:id]
  end
end
