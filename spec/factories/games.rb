FactoryBot.define do
  factory :game do
    sequence(:name) { |i| "Game #{i}" }
    release_year { 2019 }
  end
end
