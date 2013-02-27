class AddTestWorkPlans < ActiveRecord::Migration
  def up
    t = DateTime.new(0)
  
    work_plan = WorkPlan.new
    work_plan.clinic_doctor_id = 1
    work_plan.day = 1
    work_plan.start = t + 8.hours
    work_plan.end = t + 12.hours
    work_plan.save!
    
    work_plan = WorkPlan.new
    work_plan.clinic_doctor_id = 1
    work_plan.day = 1
    work_plan.start = t + 18.hours
    work_plan.end = t + 20.hours
    work_plan.save!
        
    work_plan = WorkPlan.new
    work_plan.clinic_doctor_id = 2
    work_plan.day = 2
    work_plan.start = t + 0.hours
    work_plan.end = t + 23.hours + 59.minutes + 59.seconds
    work_plan.save!
        
    work_plan = WorkPlan.new
    work_plan.clinic_doctor_id = 2
    work_plan.day = 3
    work_plan.start = t + 0.hours
    work_plan.end = t + 23.hours + 59.minutes + 59.seconds
    work_plan.save!
        
    work_plan = WorkPlan.new
    work_plan.clinic_doctor_id = 3
    work_plan.day = 4
    work_plan.start = t + 8.hours
    work_plan.end = t + 23.hours
    work_plan.save!
  end

  def down
    for wp in 1..5 do
      work_plan = WorkPlan.find(i)
      work_plan.destroy
    end
  end
end
