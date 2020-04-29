class CreateVsCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :vs_codes do |t|
      t.string :name
      t.integer :points

      t.timestamps
    end
  end
end
