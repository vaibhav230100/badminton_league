class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :wins, default: 0
      t.integer :losses, default: 0

      t.timestamps
    end
  end
end
