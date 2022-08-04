require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    @user = User.new(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    @user.save!
    sign_in @user
    @category = Category.create(name: 'Food', user_id: @user.id, icon: 'icon-food')
    @category.expenses.create(name: 'Veggies', amount: 100, user_id: @user.id)

    visit category_expenses_path(@category)
  end

  describe 'GET /expenses' do
    it 'displays the correct page title' do
      expect(page).to have_content('Transactions')
    end

    it 'displays the name of the category' do
      expect(page).to have_content('Food')
    end

    it 'displays the name of the expense' do
      expect(page).to have_content('Veggies')
    end

    it 'displays the amount of the expense' do
      expect(page).to have_content('$100.0')
    end

    it 'displays add new expense link' do
      expect(page).to have_link('Add new transaction')
    end

    it 'displays new expense form' do
      click_link 'Add new transaction'
      expect(page).to have_current_path(new_category_expense_path(@category))
    end
  end
end
