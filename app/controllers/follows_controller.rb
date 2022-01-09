class FollowsController < ApplicationController

  def create {
    current_user.follow!()
  }
end
