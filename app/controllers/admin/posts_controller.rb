class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @recipes = Recipe.all
  end

  def show
  end

  def destroy
  end
end
