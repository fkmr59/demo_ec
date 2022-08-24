class Order < ApplicationRecord
  belongs_to :item
  
  has_many :addresses
end
