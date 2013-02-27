# Nie działa z edit
#  def update_doctor_select
#    doctors = ClinicDoctor.where(:clinic_id => params[:id]) unless params[:id].blank?
#    render :partial => "doctors", :locals => { :doctors => doctors }
#  end

clinic_id = 1
patient_id = 2
date = Date.new(2012, 6, 14)

# Znajduje wszystkie wolne terminy dla danej daty i kliniki
appointments = []
WorkPlan.joins(:clinic_doctor).where(:clinic_doctors => {:clinic_id => clinic_id}).where(:day => date.wday).each do |wp|
  start = wp.start
  end_ = wp.end
  clinic_doctor_id = wp.clinic_doctor_id
  
  begin
    unless Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id).where(:date => date).where(:start => start).exists?
      puts "Znalazłem termin: #{start}"
      appointments << Appointment.new(:date => date, :start => start, :end => start + 30.minutes, :clinic_doctor_id => clinic_doctor_id, :patient_id => patient_id)
    end
    start += 30.minutes
  end while start < end_
end

unless appointments.nil?
  @appointment = appointments[0]
else
  puts "nil"
end
