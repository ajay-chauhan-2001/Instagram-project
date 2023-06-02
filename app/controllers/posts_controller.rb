class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.order('created_at DESC')
  end
  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def like
    @post = Post.find(params[:id])
    current_user.likes.create(post: @post)
    redirect_to @post
  end
  
  def unlike
    @post = Post.find(params[:id])
    current_user.likes.find_by(post: @post).destroy
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  
end




