class CommentsController < ApplicationController

  def create
  	if !comment_params[:user_attributes][:username].empty?
  		user = User.create(comment_params[:user_attributes])
  		comment_params[:user_id] = user.id
    	comment = Comment.create(comment_params)
    	redirect_to comment.post
    else
    	comment = Comment.create(comment_params)
    	redirect_to comment.post
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
