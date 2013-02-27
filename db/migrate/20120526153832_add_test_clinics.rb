class AddTestClinics < ActiveRecord::Migration
  def up
    clinic = Clinic.new
    clinic.name = "Pierwsza"
    clinic.save!
    clinic = Clinic.new
    clinic.name = "Druga"
    clinic.save!
  end

  def down
    clinic = Clinic.find(1)
    clinic.destroy
    clinic = Clinic.find(2)
    clinic.destroy
  end
end
