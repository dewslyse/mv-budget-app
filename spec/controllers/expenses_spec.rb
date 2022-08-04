require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    sign_in @user
    @category = Category.create(name: 'Food', user_id: @user.id, icon: 'icon-food')
    @expense = Expense.create(name: 'Food', amount: 100)
  end

  describe 'GET /expenses' do
    before(:example) { get category_expenses_path(@category) }

    it 'returns correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the expenses index page' do
      expect(response).to render_template('expenses/index')
    end

    it 'assigns @expenses' do
      expect(assigns(:expenses)).to eq(@category.expenses)
    end

    it 'response contains the correct text' do
      expect(response.body).to include('Transactions')
    end
  end
end
