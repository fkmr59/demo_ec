class HomeController < ApplicationController
  def top
    @items = Item.where.not(user_id: @current_user)
  end
end
