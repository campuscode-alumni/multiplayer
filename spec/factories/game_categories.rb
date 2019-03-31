FactoryBot.define do
  factory :game_category do
    sequence(:name) { |i| "Tiro#{i}" }
  end
end
