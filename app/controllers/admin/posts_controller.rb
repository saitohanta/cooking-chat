class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @recipes = Recipe.all
  end

  def show
     @post = Post.find(params[:id])
     @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
