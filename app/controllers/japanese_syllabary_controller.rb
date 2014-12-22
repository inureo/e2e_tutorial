class JapaneseSyllabaryController < ApplicationController
  def view
    japanese_syllabary = JapaneseSyllabary.find(params['id'])
    @char              = japanese_syllabary.char
    @cards             = Card.where(japanese_syllabary_id: japanese_syllabary.id)
  end
end
