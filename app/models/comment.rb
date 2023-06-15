class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :member

  validates :content, presence: true
end
