require 'rails_helper'

feature "Users", :type => :feature do
  describe 'registration of flow' do
    before {
      visit '/'
    }

    it 'can be correctly registered' do
      page.find('.js-menuToggle').click
      find_link('サインアップ').click
      fill_in 'user_name', with: 'testdayo'
      fill_in 'user_email', with: 'test@inureo.com'
      fill_in 'user_password', with: 'testtest'
      fill_in 'user_password_confirmation', with: 'testtest'
      find_button('Sign up').click
      visit my_posts_path
      expect(current_path).to eq my_posts_path
    end
  end

  describe 'my page' do
    before(:all) {
      @user = create(:user)
    }

    it 'can access if logged in' do
      login @user
      visit my_posts_path
      expect(current_path).to eq my_posts_path
    end

    it "can't access if not login" do
      visit my_posts_path
      expect(current_path).to eq root_path
    end

    describe 'logout' do
      let(:user) {create(:user)}
      before {
        login @user
        visit root_path
      }

      it 'can logout' do
        page.find('.js-menuToggle').click
        find_link('ログアウト').click
        visit my_posts_path
        expect(current_path).to eq root_path
      end
    end
  end
end
