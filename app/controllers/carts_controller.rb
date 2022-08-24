class CartsController < ApplicationController
  
  def index
    if @carts = Cart.where(user_id: @current_user)
       @onitems = Item.joins(:carts).where(carts: {user_id: @current_user.id})
    end
    if @carts.empty?
       flash[:notice] = "カートに商品がありません"
       redirect_to("/")
    end
  end
  
  def new
    @cart = Cart.new
    @item = Item.find_by(id: params[:id])
  end

  def create
    if @item = Item.find_by(id: params[:id])
       @cart = Cart.new(
        user_id: @current_user.id,
        item_id: @item.id,
        quantity: params[:quantity]
        )
       if @cart.save
         flash[:notice] = "商品をカートに入れました"
         redirect_to("/carts/index")
       else
         redirect_to("/carts/#{@item.id}/new")
       end
    end 
  end

  def edit
    @cart = Cart.find_by(id: params[:id])
    @items = Item.where(id: @cart.item_id)
  end
  
  def update
    if @cart = Cart.find_by(id: params[:id])
       @cart.quantity = params[:quantity]
       if @cart.save
        flash[:notice] = "カート内容を編集しました"
        redirect_to("/carts/index")
       else
        redirect_to("/carts/#{@cart.id}/edit")
       end
    end
  end
  
  def destroy
    @cart_destry = Cart.find_by(id: params[:id])
    @cart_destry.destroy
    flash[:notice] = "カートから商品を削除しました"
    redirect_to("/carts/index")
  end
end