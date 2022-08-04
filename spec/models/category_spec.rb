require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    @category = Category.create(name: 'Food', user_id: @user.id, icon: 'icon-food')
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @category.user_id = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without an icon' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'total_sum returns the sum of all expenses in the category' do
    @expense1 = Expense.create(name: 'Food', amount: 10, user_id: @user.id)
    @expense2 = Expense.create(name: 'Food', amount: 20, user_id: @user.id)
    @category.expenses << @expense1
    @category.expenses << @expense2
    expect(@category.total_sum).to eq(30)
  end
end
