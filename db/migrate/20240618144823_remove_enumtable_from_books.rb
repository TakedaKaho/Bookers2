class RemoveEnumtableFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :enumtable, :integer
  end
end
