FactoryBot.define do
  factory :amusement_park do
    name { Faker::TvShows::GameOfThrones.city}
    admission_cost { Faker::Number.non_zero_digit}
  end
end