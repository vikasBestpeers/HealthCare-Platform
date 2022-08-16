class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :specialization, :string
    add_column :users, :experience, :integer
    add_column :users, :role, :string
  end
end
