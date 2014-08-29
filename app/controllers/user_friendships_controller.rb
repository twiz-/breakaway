class UserFriendshipsController < ApplicationController
  before_filter :check_signed_in_coach
  def new
    if params[:friend_id]
      @friend = ClubPlayer.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_college_coach.user_friendships.new(friend: @friend)
    else
      flash[:error] = "Friend needed"
    end
  rescue ActiveRecord::RecordNotFound
      render file: 'public/404', status: :not_found
  end

  def create
    @success = false
    
    if params[:friend_id]
      @friend = ClubPlayer.find(params[:friend_id])
      @success = true if current_college_coach.user_friendships.create(friend: @friend)
    end
  end
  
=begin
  def create
    # can create a before filter here to move logic out of the view to make sure current_user_coach_and_signed_in
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = ClubPlayer.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_college_coach.user_friendships.new(friend: @friend)
      @user_friendship.save
      flash[:notice] = "#{@friend.first_name} is now on your favorites list"
      redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "friend required"
      redirect_to root_path
    end
  end
=end
  
  private
  def check_signed_in_coach
    authenticate_college_coach! && college_coach_signed_in?
  end
end
