class CommentsController < ApplicationController
  before_action :set_post # We’re  just  settingthe @post instance variable to
  #the post from the Post model based on the post_id params.

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    #We build  the  new @comment object and then assign it the user_name field
    #based on the user currently logged in.
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
      # flash[:success] = "Your comment has been created!"
      # redirect_to :back #it lit
    else
      flash[:alert] = "Your comment failed to submit."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user.id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
    # flash[:success] = "Post successfully deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
