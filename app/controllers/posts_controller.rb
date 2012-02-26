class PostsController < ApplicationController
  def index
       # gflash :notice, :success, :error
    @posts = Post.page(params[:page]).per(5)
    # @posts = Post.order("title")
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
        # gflash :success => "Updated!", :notice => "THis produt has been updated successfully" 
        gflash :notice, :success, :error
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
    gflash :success
    redirect_to :posts
  end
end
