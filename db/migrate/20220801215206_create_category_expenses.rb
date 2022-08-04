class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses, id: false do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :expense, index: true, foreign_key: true

      t.timestamps
    end
  end
end
