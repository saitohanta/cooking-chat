class RecipeBookmark < ApplicationRecord
   belongs_to :member
   belongs_to :recipe

   validates_uniqueness_of :recipe_id, scope: :member_id
   validates :member_id, uniqueness: { scope: :recipe_id}

end
