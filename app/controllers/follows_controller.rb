class FollowsController < ApplicationController
    def create
      @user = User.find(params[:followed_id])
      @follow = current_user.followed_relationships.build(followed: @user)
      if @follow.save
        redirect_to @user, notice: 'You are now following this user.'
      else
        redirect_to @user, alert: 'Failed to follow this user.'
      end
    end
  
    def destroy
      @follow = Follow.find(params[:id])
      @user = @follow.followed
      if @follow.destroy
        redirect_to @user, notice: 'You have unfollowed this user.'
      else
        redirect_to @user, alert: 'Failed to unfollow this user.'
      end
    end
  end
  