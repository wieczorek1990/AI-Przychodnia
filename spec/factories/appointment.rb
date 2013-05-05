# -*- encoding : utf-8 -*-
FactoryGirl.define do

  factory :appointment do
    sequence(:patient)    { FactoryGirl.build(:patient) }
    #sequence(:clinic_doctor)     { FactoryGirl.build(:clinic_doctor) }
    sequence(:confirmed_at)     { nil }
    sequence(:date)     { Time.now-5.minutes }
    sequence(:start)     { Time.now-5.minutes }
    sequence(:end)     { Time.now+5.minutes }
    sequence(:created_at)     { Time.now-5.minutes }
  end

end
