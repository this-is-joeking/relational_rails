class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :living
      t.string :location
      t.integer :years_active

      t.timestamps
    end
  end
end
