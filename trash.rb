clinic_doctor_id = 3
date = Date.today
start = DateTime.new(2000)
start += 20.hours

Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id, :date => date).pluck(:start)
Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id, :date => date, :start => start.to_s(:db))
Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id, :date => date, :start => '2000-01-01 20:00:00.000000')

luke@luke-ThinkPad-T410:~/Programowanie/www/projekt$ grep -r 'DateTime.new(0)' *
app/controllers/available_appointments_controller.rb:        start = DateTime.new(0)
app/controllers/appointments_controller.rb:        start = DateTime.new(0)
db/migrate/20120526193526_add_test_work_plans.rb:    t = DateTime.new(0)
db/migrate/20120527145254_add_test_appointments.rb:    t = DateTime.new(0)

sqlite
2000-01-01 20:00:00.000000


  def appointments_from_work_plans(work_plans, date, patient_id)
    appointments = []
    work_plans.each do |wp|
      wday = wp.day
      start = wp.start
      end_ = wp.end
      clinic_doctor_id = wp.clinic_doctor_id
      if Date.today.wday == wday
        now = DateTime.now
        now.min > 30 ? now = now.change(:hour => now.hour + 1) : now = now.change(:min => 30)
        start = DateTime.new(0)
        start += now.hour.hours + now.min.minutes
      end
      while start <= end_ - 30.minutes
        occupied = Appointment.where('confirmed_at IS NOT NULL').where(:clinic_doctor_id => clinic_doctor_id, :date => date, :start => start).exists?
        unless occupied
          appointments << Appointment.new(:date => date, :start => start, :end => start + 30.minutes, :clinic_doctor_id => clinic_doctor_id, :patient_id => patient_id)
          puts "#{start} : added"
        else
          puts "#{start} : occupied"
        end
        start += 30.minutes
      end
    end
    return appointments
  end

    clinic_id = Clinic.first
    patient_id = Patient.first
    date = Date.today + 1.day
    work_plans = WorkPlan.joins(:clinic_doctor).where(:clinic_doctors => {:clinic_id => clinic_id}, :day => date.wday)
    appointments = appointments_from_work_plans(work_plans, date, patient_id)
    @appointment = appointments[0]

#################################################################################

<!-- Nie działa razem z edit -->
<div class="field">
  <%= label nil, :clinic %><br />
  <%= collection_select(:clinic_doctor, :clinic_id, Clinic.all, :id, :summary) %>
</div>

<div class="field" id="appointment_doctors">
  <%= render :partial => 'doctors'%> <!--, :locals => {:f => f} -->
</div>
#return render :text => DateTime.new(0).to_formatted_s(:rfc822) 
