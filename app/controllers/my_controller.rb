class MyController < ApplicationController
  def posts
    @posts = Card.find_by(user_id: current_user.id)
  end
end
