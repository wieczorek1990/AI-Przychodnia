require 'spec_helper'

describe User do
  
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }  
  it { should validate_presence_of(:first_name) }  
  it { should validate_presence_of(:last_name) }  

  let(:user) {FactoryGirl.build(:user) }

  describe "::unconfirm" do

    it "should REALLY unconfirm" do
      user.unconfirm!
      user.confirmed_at.should == nil
    end
  end 

  describe "::full_name" do

    it "should return last name then first name" do
      user.full_name.should == user.last_name + " " + user.first_name
    end
  end

  describe "::active_for_authentication?" do

    it "should valid for confirmed" do
      user.active_for_authentication?.should == true
    end
  end

end
