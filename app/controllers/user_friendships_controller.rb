class UserFriendshipsController < ApplicationController
  def new
    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_coach.user_friendships.new(friend: @friend)
    else
      flash[:error] = "Friend needed"
    end
  rescue ActiveRecord::RecordNotFound
      render file: 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_coach.user_friendships.new(friend: @friend)
      @user_friendship.save
      flash[:notice] = "#{@friend.first_name} is now on your favorites list"
      redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "friend required"
      redirect_to root_path
    end
  end
end
