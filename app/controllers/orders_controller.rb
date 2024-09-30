class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.order(created_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :equipament_id, :period_start, :period_end)
  end
end
