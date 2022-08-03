require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', email: 'jdoe@example.com', password: 'password')
    @expense = Expense.create(name: 'Food', amount: 10, user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expect(@expense).to be_valid
  end

  it 'is not valid without a name' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'is not valid without an amount' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'is not valid if amount is not a number' do
    @expense.amount = 'abc'
    expect(@expense).to_not be_valid
  end
end
