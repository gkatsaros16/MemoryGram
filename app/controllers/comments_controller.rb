class CommentsController < ApplicationController
  before_action :set_post # We’re  just  settingthe @post instance variable to
  #the post from the Post model based on the post_id params.

  def index
    @comments = @post.comments.order("created_at ASC")

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    #We build  the  new @comment object and then assign it the user_name field
    #based on the user currently logged in.
    if @comment.save
      create_notification @post, @comment
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
    notification = Notification.where(notified_by_id: current_user.id, post_id: @post.id, notif_type: 'comment')
    if @comment.user.id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
      Notification.destroy(notification.ids[0])
    end
  end

  private

  def create_notification(post, comment)
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: comment.id,
                        notif_type: 'comment')
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
