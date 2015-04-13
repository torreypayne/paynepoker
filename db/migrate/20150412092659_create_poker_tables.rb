class CreatePokerTables < ActiveRecord::Migration
  def change
    create_table :poker_tables do |t|
      t.text :seats
      t.integer :pot

      t.timestamps null: false
    end
  end
end
