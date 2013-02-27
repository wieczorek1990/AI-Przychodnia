class CreateWorkPlans < ActiveRecord::Migration
  def change
    create_table :work_plans do |t|
      t.integer :day
      t.datetime :start
      t.datetime :end

      t.references :clinic_doctor
      
      t.timestamps
    end
  end
end
