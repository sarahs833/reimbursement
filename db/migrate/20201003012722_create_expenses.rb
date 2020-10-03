class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :usage, null: false
      t.decimal :amount, null:false
      t.integer :people, null:false
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
