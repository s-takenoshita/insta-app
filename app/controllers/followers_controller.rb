class FollowersController < ApplicationController

  def index
    account = User.find(params[:account_id])
    @followers = account.followers()
    render 'followers/index'
  end
end
