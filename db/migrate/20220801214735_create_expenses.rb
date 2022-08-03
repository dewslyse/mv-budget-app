class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
