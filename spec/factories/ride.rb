FactoryBot.define do
  factory :amusement_park do
    name { Faker::TvShows::GameofThrones.dragon}
    thrill_rating { Faker::Number.within(range: 1..5)}
    open { Faker::Boolean }
  end
end