class OrdersController < ApplicationController
  
  def show
    if @address = Address.where(user_id: @current_user)
       @buyitem = Item.joins(:addresses).where(addresses: {user_id: @current_user})
       @buyorder = Order.joins(:addresses).where(addresses: {user_id: @current_user})
    end
    if @address.empty?
       flash[:notice] = "注文履歴がありません"
       redirect_to("/")
    end
  end
  
  def new
    @order = Order.new
    if @cart = Cart.find_by(id: params[:id])
       @onitems = Item.joins(:carts).find_by(carts: {id: @cart.id})
    end
  end
  
  def create
    if @cart = Cart.find_by(id: params[:id])
       @order = Order.new(
        user_id: @cart.user_id,
        item_id: @cart.item_id,
        total_price: params[:total_price],
        cart_id: @cart.id,
        )
        if @order.save
          flash[:notice] = "注文内容の確認"
          redirect_to("/addresses/#{@order.id}/new")
        else
          flash[:notice] = "内容にエラーがあります"
          redirect_to("/")
        end
    end
  end
  
end