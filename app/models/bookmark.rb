class Bookmark < ApplicationRecord
  belongs_to :member
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :member_id

  validates :member_id, uniqueness: { scope: :post_id}
end
