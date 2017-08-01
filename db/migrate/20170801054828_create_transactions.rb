class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.column :ttype, 'integer unsigned'

      t.timestamps null: false
    end
  end
end
