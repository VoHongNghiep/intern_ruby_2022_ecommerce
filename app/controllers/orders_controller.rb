class OrdersController < ApplicationController
  def index
    @pagy, @orders = pagy Order.where(user_id: current_user.id)
  end
  def destroy
    @order = Order.find params[:id]
    if @order.destroy
      flash[:success] = "delete_success"
      redirect_to request.referer
    else
      flash[:danger] = "delete_fail"
    end
  end
  def change
    @order = Order.where(id: params[:id])
    @order.update status: 3
    redirect_to request.referer
  end
end
