class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.datetime :start
      t.datetime :end
      
      t.references :clinic_doctor
      t.references :patient
      
      t.datetime :confirmed_at
            
      t.timestamps
    end
    add_index :appointments, [:clinic_doctor_id, :patient_id]
  end
end
