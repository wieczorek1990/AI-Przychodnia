class Clinic < ActiveRecord::Base
  resourcify

  has_many :clinic_doctors
  has_many :doctors, :through => :clinic_doctors
  
  attr_accessible :name
  
  validates :name, :presence => true
  
  def summary
    "#{name}"
  end
end
