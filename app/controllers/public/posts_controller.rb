class Public::PostsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def index
    @posts = Post.all
    @recipes = Recipe.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @recipes = Recipe.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :title, :body)
  end

  def ensure_member
    @posts = current_member.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to post_path unless @post
  end

end
