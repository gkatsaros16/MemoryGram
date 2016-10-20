class PostsController < ApplicationController
  before_action :authenticate_user! #devis
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :likers]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(12)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params) # find out what build does
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def show
    # id = params[:id]
    # @posts = Post.all
    # @post = @posts.find(id)
  end

  def edit
    @prevent = false
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Updated successfully!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Post has not been updated."
      render :edit
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post successfully deleted!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Post has not been deleted."
      render :edit
    end
  end

  def like
    if @post.liked_by current_user
      create_notification @post
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def likers
    @likers = @post.votes_for.up.by_type(User).voters
  end

  private

  def create_notification(post)
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id,
                        notified_by_id: current_user.id,
                        post_id: post.id,
                        identifier: post.id,
                        notif_type: 'like')
  end

  def post_params
    params.require(:post).permit(:image, :caption, :link, :post_type)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
end
