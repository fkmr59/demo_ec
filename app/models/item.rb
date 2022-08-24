class Item < ApplicationRecord
  has_many :carts
  has_many :orders
  has_many :addresses
  
  validates :name, {presence: true}
  validates :price, {presence: true}
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end
