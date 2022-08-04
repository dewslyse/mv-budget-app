require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    @user = User.new(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    @user.save!
    Category.create(name: 'Food', user_id: @user.id, icon: 'icon-food')
    Category.create(name: 'Transport', user_id: @user.id, icon: 'icon-transport')

    sign_in @user
    visit categories_path
  end

  describe 'GET /categories' do
    it 'displays the name of the category' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Transport')
    end

    it 'shows add new category link' do
      expect(page).to have_link('Add new category')
    end

    it 'displays new category form' do
      click_link 'Add new category'
      expect(page).to have_current_path(new_category_path)
    end
  end
end
