# -*- encoding : utf-8 -*-
FactoryGirl.define do

  factory :user do
    sequence(:email)    { |n| "email#{n}@example.com" }
    sequence(:first_name)     { |n| "Name#{n}" }
    sequence(:last_name)     { |n| "Surname#{n}" }
    sequence(:confirmed_at)     { |n| n }
  end

  factory :patient do
    sequence(:email)    { |n| "email#{n}@example.com" }
    sequence(:first_name)     { |n| "Name#{n}" }
    sequence(:last_name)     { |n| "Surname#{n}" }
    sequence(:confirmed_at)     { nil }
    sequence(:pesel)     { |n| "1234567890"+(n%10).to_s }
  end

  factory :clinic_doctor do
    sequence(:email)    { |n| "email#{n}@example.com" }
    sequence(:first_name)     { |n| "Name#{n}" }
    sequence(:last_name)     { |n| "Surname#{n}" }
    sequence(:confirmed_at)     { |n| n }
  end

end
