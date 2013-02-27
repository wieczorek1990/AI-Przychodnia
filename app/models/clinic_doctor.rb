class ClinicDoctor < ActiveRecord::Base
  resourcify

  belongs_to :clinic
  belongs_to :doctor
  has_one :work_plan
  has_many :appointments
  
  attr_accessible :clinic_id, :doctor_id
  
  validates_uniqueness_of :clinic_id, :scope => [:doctor_id]
  validates :clinic_id, :presence => true
  validates :doctor_id, :presence => true
  
  def summary
    "#{self.clinic.name}: #{self.doctor.first_name} #{self.doctor.last_name}"
  end
  
  def summary_clinic
    "#{self.clinic.name}"
  end
  
  def summary_doctor
    "#{self.doctor.first_name} #{self.doctor.last_name}"
  end
end
