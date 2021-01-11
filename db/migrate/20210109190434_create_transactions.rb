class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |table|
      table.integer :type
      table.date :date
      table.integer :value
      table.string :cpf
      table.string :credit_card
      table.time :hour
      table.string :store_owner
      table.string :store

      table.timestamps null: false
    end
  end
end
