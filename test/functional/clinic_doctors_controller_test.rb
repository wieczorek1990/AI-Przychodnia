require 'test_helper'

class ClinicDoctorsControllerTest < ActionController::TestCase
  setup do
    @clinic_doctor = clinic_doctors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinic_doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinic_doctor" do
    assert_difference('ClinicDoctor.count') do
      post :create, clinic_doctor: {  }
    end

    assert_redirected_to clinic_doctor_path(assigns(:clinic_doctor))
  end

  test "should show clinic_doctor" do
    get :show, id: @clinic_doctor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinic_doctor
    assert_response :success
  end

  test "should update clinic_doctor" do
    put :update, id: @clinic_doctor, clinic_doctor: {  }
    assert_redirected_to clinic_doctor_path(assigns(:clinic_doctor))
  end

  test "should destroy clinic_doctor" do
    assert_difference('ClinicDoctor.count', -1) do
      delete :destroy, id: @clinic_doctor
    end

    assert_redirected_to clinic_doctors_path
  end
end
