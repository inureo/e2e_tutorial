require 'rails_helper'

feature "Tops", :type => :feature do
  describe 'japanese syllabaries list' do
    before {
      visit '/'
    }
    it 'have 47 items' do
      expect(page).to have_css '.char__list li', count: 47
    end
  end
end
