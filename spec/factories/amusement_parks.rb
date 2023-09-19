FactoryBot.define do
  factory :amusement_park do
    name { Faker::TvShows::GameofThrones.city}
    price { Faker::Number.non_zero_digit}
  end
end