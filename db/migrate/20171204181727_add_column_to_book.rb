class AddColumnToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :image_name, :string
  end
end
