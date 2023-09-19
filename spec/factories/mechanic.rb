FactoryBot.define do
  factory :mechanic do
    name { Faker::Name.name}
    years_experience { Faker::Number.non_zero_digit}
  end
end