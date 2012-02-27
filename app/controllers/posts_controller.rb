class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      gflash :success => "Post has been created!"
      redirect_to @post
    else
      gflash :notice => "Message Not Saved!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes params[:post]
        gflash :notice => "Post updated!"
        redirect_to @post
    else
      gflash :warning => "Message Not Saved!"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    gflash :success => "Deleted"
    redirect_to :posts
  end
end
