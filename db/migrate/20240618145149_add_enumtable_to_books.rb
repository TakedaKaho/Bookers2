class AddEnumtableToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :enumtable, :integer, default: 0, null: false
  end
end
