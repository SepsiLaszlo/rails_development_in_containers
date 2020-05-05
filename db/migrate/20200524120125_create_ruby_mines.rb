class CreateRubyMines < ActiveRecord::Migration[6.0]
  def change
    create_table :ruby_mines do |t|
      t.string :name
      t.integer :points

      t.timestamps
    end
  end
end
