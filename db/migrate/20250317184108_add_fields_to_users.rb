class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :mobile, :string
    add_column :users, :address, :text
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
