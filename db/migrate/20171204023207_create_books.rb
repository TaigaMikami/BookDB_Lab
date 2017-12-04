class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :isbn, :limit => 8
      t.date :publishdate

      t.timestamps
    end
  end
end
