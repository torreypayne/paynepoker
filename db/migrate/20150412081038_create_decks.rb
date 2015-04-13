class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :ranks
      t.string :suits

      t.timestamps null: false
    end
  end
end
