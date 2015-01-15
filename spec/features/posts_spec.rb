require 'rails_helper'

describe 'Posts' do
  let(:card_name) { 'あ' }
  let(:card_text) { 'あんまん' }
  before(:all) {
    user = create(:user)
    login user
  }
  it 'User can posts card' do
    visit post_path
    select card_name, from: 'card_japanese_syllabary_id'
    fill_in 'card_text', with: card_text
    find_button('投稿').click
    expect(page).to have_content 'かるたの投稿が完了しました'
    visit card_path(1)
    expect(page).to have_content "本文「#{card_text}」 "

    visit char_path(1)
    expect(page).to have_content "選択したかな「#{card_name}」"
    expect(page).to have_content "本文「#{card_text}」"
  end
end