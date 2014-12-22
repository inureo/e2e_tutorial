class CardController < ApplicationController
  def view
    @card = Card.find(params[:id])
  end

  def post
    redirect_to login_path unless user_signed_in?
    save_post(params['card']) if params['card']

    @chars = JapaneseSyllabary.all.to_a.map{ |char| [char.char, char.id] }
  end

  def save_post(params)
    card = Card.create(
      user_id: current_user.id,
      japanese_syllabary_id: params['japanese_syllabary_id'],
      text: params['text']
    )

    @card = card
    render 'card/complete'
  end

  def delete
  end

  def edit
  end
end
