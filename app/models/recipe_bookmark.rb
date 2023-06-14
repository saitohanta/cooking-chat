class RecipeBookmark < ApplicationRecord
   belongs_to :member
   belongs_to :recip
end
