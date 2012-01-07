class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Message Saved!"
      redirect_to @post
    else
      flash[:notice] = "Message Not Saved!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes params[:post]
      flash[:notice] = "Message Saved!"
      redirect_to @post
    else
      flash[:notice] = "Message Not Saved!"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully destroyed!"
    redirect_to :posts
  end
end
