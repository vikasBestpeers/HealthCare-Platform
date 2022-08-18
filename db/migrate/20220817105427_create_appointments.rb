class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user
      t.integer :doctor_id
      t.datetime :appointment_datetime
      t.timestamps
    end
  end
end
