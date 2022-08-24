class HomeController < ApplicationController
  def top
    @items = Item.all
  end
end
