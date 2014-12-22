class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :japanese_syllabary
end
