class Appointment < ActiveRecord::Base
  resourcify

  belongs_to :clinic_doctor
  belongs_to :patient
  
  attr_accessible :patient_id, :clinic_doctor_id
  attr_accessible :date, :start, :end
  attr_accessible :confirmed_at
  
  validates :patient_id, :presence => true
  validates :clinic_doctor_id, :presence => true
  validates :date, :presence => true
  validates :start, :presence => true
  # end ustawiane w kontrolerze: validates :end, :presence => true
  
  validate :available
  validate :correct_date
  validate :occupied
  validate :bilocate
  validate :confirmable, :on => :update

  before_validation :set_end
  before_create :set_end
  before_update :set_end
  
  def confirm!
    if !confirmed? && can_confirm?
      self.confirmed_at = DateTime.now
    end
  end
  
  def unconfirm!
    confirmed_at = nil
  end
  
  def confirmed?
    !confirmed_at.nil?
  end
  
  def can_confirm?
    created_at > 10.minutes.ago
  end
   
  private
    def set_end
      self.end = self.start + 30.minutes
    end
    
    # Dostępny w planie pracy doktora
    # Używać DateTime.new(0)
    def available
      errors.add(:appointment, "must be scheduled in doctor's available time") unless WorkPlan.where(:clinic_doctor_id => clinic_doctor_id, :day => date.wday).where('(? >= start) AND (? <= end)', self.start, self.end).exists?
    end
    
    # Zajęty w planie pracy doktora
    def occupied
      errors.add(:appointment, "shouldn't be occupied") if Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id, :date => date, :start => start).exists?
    end
    
    # Wprowadzona data należy do przyszłości
    def correct_date
      year = date.year
      month = date.month
      day = date.day
      hour = start.hour
      minute = start.min
      start_time = Time.new(year, month, day, hour, minute)
      errors.add(:start, "must happen in future") if start_time < Time.now
    end
    
    # Pacjent nie może mieć innej wizyty w tym samym czasie
    def bilocate
      errors.add(:patient, "can't bilocate") if Appointment.where('confirmed_at IS NOT NULL').where(:patient_id => patient_id, :date => date, :start => start).where('appointments.id != ?', self.id).exists?
    end
    
    # Czy potwierdzalny?
    def confirmable
      errors.add(:confirmed_at, "must be set within 10 minutes after appointment creation") if !can_confirm?
    end
end
