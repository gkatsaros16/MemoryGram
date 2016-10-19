class NotificationsController < ApplicationController
  def link_through
    @notifications = Notification.all
    @notification = Notification.find(params[:id])
    @notification.update read: true
    @notifications.each do |notification|
      if  @notification.post_id == notification.post_id
        notification.update read: true
      end
    end
    redirect_to post_path @notification.post
  end
end
