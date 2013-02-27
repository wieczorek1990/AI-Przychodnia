class AddTestClinicDoctors < ActiveRecord::Migration
  def up
    doctor = Doctor.find(4)
    clinic = Clinic.find(1)
    clinic_doctor = ClinicDoctor.new
    clinic_doctor.doctor = doctor
    clinic_doctor.clinic = clinic
    clinic_doctor.save!
    clinic = Clinic.find(2)
    clinic_doctor = ClinicDoctor.new
    clinic_doctor.doctor = doctor
    clinic_doctor.clinic = clinic
    clinic_doctor.save!

    doctor = Doctor.find(5)
    clinic = Clinic.find(1)
    clinic_doctor = ClinicDoctor.new
    clinic_doctor.doctor = doctor
    clinic_doctor.clinic = clinic
    clinic_doctor.save!
  end

  def down
    for cd in 1..3
      clinic_doctor = ClinicDoctor.find(cd)
      clinic_doctor.destroy
    end
  end
end
