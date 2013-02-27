class DoctorWorkPlansController < ApplicationController
  load_and_authorize_resource :work_plan
  # GET /doctor_work_plans
  # GET /doctor_work_plans.json
  def index
    @doctor_work_plans = WorkPlan.joins(:clinic_doctor).where('doctor_id = ?', current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctor_work_plans }
    end
  end
end
