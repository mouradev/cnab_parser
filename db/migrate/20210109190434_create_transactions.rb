class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |table|
      table.integer :t_type
      table.date :date
      table.integer :value
      table.string :cpf
      table.string :credit_card
      table.string :hour
      table.string :store_owner
      table.string :store

      table.timestamps null: false
    end
  end
end
