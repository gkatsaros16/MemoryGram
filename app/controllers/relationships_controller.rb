class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by(user_name: params[:user_name])
    if current_user.follow(@user.id)
      create_notification @user
      respond_to do |format|
        format.html { redirect_to root_path  }
        format.js
      end
    end
  end

  def unfollow_user
    @user = User.find_by(user_name: params[:user_name])
    if current_user.unfollow(@user.id)
      notification = Notification.where(notified_by_id: current_user.id,
                                        identifier: @user.id,
                                        notif_type: 'follow')
      respond_to do |format|
        format.html { redirect_to root_path  }
        format.js
      end
      if !current_user
        Notification.destroy(notification.ids[0])
      end
    end
  end

  private
  def create_notification(user)
    return if user.id == current_user.id
    Notification.create(user_id: user.id,
                        notified_by_id: current_user.id,
                        identifier: user.id,
                        notif_type: 'follow')
  end
end
