class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surname
      t.belongs_to :user
      t.timestamps
    end
  end
end
