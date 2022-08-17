class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :surname
      t.string :specialization
      t.integer :experience
      t.belongs_to :user
      t.timestamps
    end
  end
end
