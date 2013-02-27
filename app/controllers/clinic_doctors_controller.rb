class ClinicDoctorsController < ApplicationController
  load_and_authorize_resource
  # GET /clinic_doctors
  # GET /clinic_doctors.json
  def index
    @clinic_doctors = ClinicDoctor.includes(:clinic, :doctor).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinic_doctors }
    end
  end

  # GET /clinic_doctors/1
  # GET /clinic_doctors/1.json
  def show
    @clinic_doctor = ClinicDoctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinic_doctor }
    end
  end

  # GET /clinic_doctors/new
  # GET /clinic_doctors/new.json
  def new
    @clinic_doctor = ClinicDoctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic_doctor }
    end
  end

  # GET /clinic_doctors/1/edit
  def edit
    @clinic_doctor = ClinicDoctor.find(params[:id])
  end

  # POST /clinic_doctors
  # POST /clinic_doctors.json
  def create
    @clinic_doctor = ClinicDoctor.new(params[:clinic_doctor])

    respond_to do |format|
      if @clinic_doctor.save
        format.html { redirect_to @clinic_doctor, notice: 'Clinic doctor was successfully created.' }
        format.json { render json: @clinic_doctor, status: :created, location: @clinic_doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @clinic_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinic_doctors/1
  # PUT /clinic_doctors/1.json
  def update
    @clinic_doctor = ClinicDoctor.find(params[:id])

    respond_to do |format|
      if @clinic_doctor.update_attributes(params[:clinic_doctor])
        format.html { redirect_to @clinic_doctor, notice: 'Clinic doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinic_doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_doctors/1
  # DELETE /clinic_doctors/1.json
  def destroy
    @clinic_doctor = ClinicDoctor.find(params[:id])
    @clinic_doctor.destroy

    respond_to do |format|
      format.html { redirect_to clinic_doctors_url }
      format.json { head :no_content }
    end
  end
end
