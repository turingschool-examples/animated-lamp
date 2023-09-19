FactoryBot.define do
  factory :ride do
    name { Faker::TvShows::GameofThrones.dragon}
    thrill_rating { Faker::Number.within(range: 1..5)}
    open { Faker::Boolean }
  end
end