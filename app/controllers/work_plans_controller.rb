class WorkPlansController < ApplicationController
  load_and_authorize_resource
  # GET /work_plans
  # GET /work_plans.json
  def index
    @work_plans = WorkPlan.includes(:clinic_doctor).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_plans }
    end
  end

  # GET /work_plans/1
  # GET /work_plans/1.json
  def show
    @work_plan = WorkPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_plan }
    end
  end

  # GET /work_plans/new
  # GET /work_plans/new.json
  def new
    @work_plan = WorkPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_plan }
    end
  end

  # GET /work_plans/1/edit
  def edit
    @work_plan = WorkPlan.find(params[:id])
  end

  # POST /work_plans
  # POST /work_plans.json
  def create
#    return render :text => "#{params}"
    @work_plan = WorkPlan.new(params[:work_plan])

    respond_to do |format|
      if @work_plan.save
        format.html { redirect_to @work_plan, notice: 'Work plan was successfully created.' }
        format.json { render json: @work_plan, status: :created, location: @work_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_plans/1
  # PUT /work_plans/1.json
  def update
    @work_plan = WorkPlan.find(params[:id])

    respond_to do |format|
      if @work_plan.update_attributes(params[:work_plan])
        format.html { redirect_to @work_plan, notice: 'Work plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_plans/1
  # DELETE /work_plans/1.json
  def destroy
    @work_plan = WorkPlan.find(params[:id])
    @work_plan.destroy
    #render :text => params
    #return
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
