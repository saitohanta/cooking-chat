class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :member
  belongs_to :recipe
end
