class AddZipcodeToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :zipcode, :string
  end
end
