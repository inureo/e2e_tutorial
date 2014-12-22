class CardController < ApplicationController
  def view
    @card = Card.find(params[:id])
  end

  def post
    redirect_to login_path unless user_signed_in?
  end

  def delete
  end

  def edit
  end
end
