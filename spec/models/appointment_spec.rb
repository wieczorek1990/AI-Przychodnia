require 'spec_helper'

describe Appointment do

  it { should belong_to :patient }
  it { should belong_to :clinic_doctor }

  let(:appointment) { FactoryGirl.build(:appointment) }

  describe "::confirm!" do

    it "should confirm if not confirmed" do
      appointment.confirm!
      appointment.confirmed_at.should_not == nil
    end

    it "should not confirm when it is too late" do
      appointment.created_at = 20.minutes.ago
      appointment.confirm!
      appointment.confirmed_at.should == nil
    end

    it "should not confirm when it has been already confirmed" do
      confirm_time = 5.minutes.ago
      appointment.created_at = 10.minutes.ago
      appointment.confirmed_at = confirm_time
      appointment.confirm!
      appointment.confirmed_at.should == confirm_time
    end
  end

  describe "::unconfirm!" do

    it "should make unconfirmed" do
      appointment.created_at = 5.minutes.ago
      appointment.confirm!
      appointment.unconfirm!
      appointment.confirmed_at.should == nil
    end

  end

  describe "::can_confirm?" do

    it "should confirm if it is new" do
      appointment.created_at = 5.minutes.ago
      appointment.can_confirm?.should == true
    end

    it "should confirm if it is old" do
      appointment.created_at = 15.minutes.ago
      appointment.can_confirm?.should_not == true
    end

  end

end