class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end

  def follows
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
