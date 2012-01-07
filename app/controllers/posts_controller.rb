class PostsController < ApplicationController
  def index
    show
    render('show')
  end

  def new
    @post = Post.new(:name => "Fayimora", :title => "Title here", :body => "Body here")
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Message Saved!"
      redirect_to :action => 'show'
    else
      flash[:notice] = "Message Not Saved!"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.all
  end

  def delete
    Post.find(parms[:id]).destroy
    flash[:notice] = "Post successfully destroyed!"
    redirect_to :action => 'show'
  end
end
