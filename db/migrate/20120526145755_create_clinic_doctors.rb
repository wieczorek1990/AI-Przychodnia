class CreateClinicDoctors < ActiveRecord::Migration
  def change
    create_table :clinic_doctors do |t|
      
      ## Asocjacje
      t.references :clinic
      t.references :doctor
      
      t.timestamps
    end
    add_index :clinic_doctors, [:clinic_id, :doctor_id], :unique => true
  end
end
