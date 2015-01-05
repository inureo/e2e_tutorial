class MyController < ApplicationController
  def posts
    return redirect_to root_path if current_user.nil?
    @posts = Card.where(user_id: current_user.id)
  end
end
