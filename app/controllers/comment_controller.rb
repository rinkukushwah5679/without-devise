class CommentController < ActionController::Base

	# before_action :check_user
  def like
  	current_user = User.find_by_id(session[:user_id])
   	@comment = Comment.find(params[:comment_id])
   	
   	@like = Like.create(:comment_id=>params[:comment_id], :user_id=>current_user.id, :flag=>'like')
   	@user = User.find(@comment.user_id)
   	redirect_to user_path(@user)
  end

  def unlike
  	current_user = User.find_by_id(session[:user_id])
   	@comment = Comment.find(params[:comment_id])
   	@like = Like.create(:comment_id=>params[:comment_id], :user_id=>current_user.id, :flag=>'unlike')
   	# @like = @like.destroy
   	@user = User.find(@comment.user_id)
   	redirect_to user_path(@user)
  end

  # def check_user
  #  	if current_user.present?
  #  		return true
  #  	else
  #  		return false
  #  	end
  # end
end