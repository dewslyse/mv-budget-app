require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    sign_in @user
    Category.create(name: 'Food', user_id: @user.id, icon: 'icon-food')
  end

  describe 'GET /categories' do
    before(:example) { get categories_path }

    it 'returns correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the categories index page' do
      expect(response).to render_template('categories/index')
    end

    it 'assigns @categories' do
      expect(assigns(:categories)).to eq(@user.categories)
    end

    it 'response contains the correct text' do
      expect(response.body).to include('Categories')
    end
  end
end
