class MyController < ApplicationController
  def posts
    @posts = Card.where(user_id: current_user.id)
  end
end
