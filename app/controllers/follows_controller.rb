class FollowsController < ApplicationController

  def create
    current_user.follow!(params[:account_id])
    # redirect_to account_path(params[:account_id])
    account = User.find(params[:account_id])
    count = account.followers.count
    render json: {status: 'ok', count: count}
  end

end
