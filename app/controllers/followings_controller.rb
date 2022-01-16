class FollowingsController < ApplicationController

  def index
    account = User.find(params[:account_id])
    @followings = account.followings()
    render 'followings/index'
  end
end
