class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @items = Item.where(user_id: @current_user)
  end
  
  def show
    @item = Item.find_by(id: params[:id])
    @user = @item.user
    @likes_count = Like.where(item_id: @item.id).count
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(
      name: params[:name], 
      price: params[:price], 
      image_name: "default_item.jpg",
      content: params[:content],
      user_id: @current_user.id
      )
    if @item.save
      flash[:notice] = "商品内容を作成しました"
      redirect_to("/items/index")
    else
      render("/items/new")
    end
  end
  
  def edit
    @item = Item.find_by(id: params[:id])
  end
  
  def update
    if @item = Item.find_by(id: params[:id])
       @item.name = params[:name]
       @item.price = params[:price]
       @item.content = params[:content]
       
       if params[:image]
        @item.image_name = "#{@item.id}.jpg"
        image = params[:image]
        File.binwrite("public/item_images/#{@item.image_name}", image.read)
       end
       
       if @item.save
        flash[:notice] = "商品内容を編集しました"
        redirect_to("/items/index")
       else
        redirect_to("/items/#{@item.id}/edit")
       end
    end
  end
  
  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    flash[:notice] = "商品を削除しました"
    redirect_to("/items/index")
  end
  
  def ensure_correct_user
    @item = Item.find_by(id: params[:id])
    if @item.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/items/index")
    end
  end
  
end
