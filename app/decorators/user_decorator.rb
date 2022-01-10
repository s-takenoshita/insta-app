# frozen_string_literal: true

module UserDecorator

  def posts_count
    posts.count
  end

  def followings_count
    followings.count
  end

  def followers_count
    followers.count
  end

end
