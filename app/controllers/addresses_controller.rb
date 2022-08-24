class AddressesController < ApplicationController

  def new
    if @order = Order.find_by(id: params[:id]) 
       @onitems = Item.joins(:orders).find_by(orders: {id: @order.id})
    end
  end

  def create
    if @order = Order.find_by(id: params[:id])
       @address = Address.new(
        family_name: params[:family_name],
        given_name: params[:given_name],
        tel: params[:text],
        email: params[:email],
        postal_code: params[:postal_code],
        address_level1: params[:address_level1],
        address_level2: params[:address_level2],
        address_line1: params[:address_line1],
        address_line2: params[:address_line2],
        organization: params[:organization],
        order_id: @order.id,
        user_id: @order.user_id,
        item_id: @order.item_id,
        cart_id: @order.cart_id,
        )
        if @address.save
          flash[:notice] = "注文を確定しました"
          @cart_destry = Cart.find_by(id: @order.cart_id)
          @cart_destry.destroy
          redirect_to("/")
        else
          flash[:notice] = "お届け先にエラーがあります"
          redirect_to("/addresses/#{@order.id}/new")
        end
    end
  end
end