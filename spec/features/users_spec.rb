require 'rails_helper'

feature "Users", :type => :feature do
  describe 'registration of flow' do
    before {
      visit '/'
    }

    it 'can be correctly registered' do
      page.find('.js-menuToggle').click
      find_link('サインアップ').click
      fill_in 'user_name',                  with: 'testdayo'
      fill_in 'user_email',                 with: 'test@inureo.com'
      fill_in 'user_password',              with: 'testtest'
      fill_in 'user_password_confirmation', with: 'testtest'
      find_button('Sign up').click
      visit my_posts_path
      expect(current_path).to eq my_posts_path
    end
  end
end