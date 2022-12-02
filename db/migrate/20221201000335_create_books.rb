class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :available_as_audiobook
      t.integer :page_length
      t.string :genre

      t.timestamps
    end
  end
end
