class Cart < ApplicationRecord
  belongs_to :item
  
  validates :user_id, {presence: true}
  validates :item_id, {presence: true}
  validates :quantity, {presence: true}
  
end
