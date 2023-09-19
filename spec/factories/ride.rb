FactoryBot.define do
  factory :ride do
    name { Faker::TvShows::GameOfThrones.dragon}
    thrill_rating { Faker::Number.within(range: 1..5)}
    open { Faker::Boolean }
    amusement_park
  end
end