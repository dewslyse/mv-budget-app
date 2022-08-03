class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :categories, through: :category_expenses

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
