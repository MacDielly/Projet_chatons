class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_order = @cart.orders.find_by(item_id: @item.id)
    if current_order && quantity > 0
      current_order.update(quantity:)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(item: @item, quantity:)
    end
  end
  
  def remove
    Order.find_by(id: params[:id]).destroy
  end
end
