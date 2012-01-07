class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id]) #fetch all comments for that post
        @comment = @post.comments.create(params[:comment]) #create link and save the comment
        redirect_to post_path(@post)
    end
end
