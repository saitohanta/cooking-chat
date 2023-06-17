class Public::BookmarksController < ApplicationController
  def index
    @posts = current_member.bookmarks_posts
    @recipes = current_member.recipe_bookmarks_recipes
  end

  def create
    @post = Post.find(params[:post_id])
    current_member.bookmark(@post)
    @member = current_member
  end

  def destroy
    @post = current_member.bookmarks.find_by(post_id: params[:post_id]).post
    current_member.unbookmark(@post)
    @member = current_member
  end
end
