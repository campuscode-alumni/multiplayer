FactoryBot.define do
  factory :game do
    sequence(:name) { |i| "Game #{i}" }
    release_year { 2019 }
    photo do
      fixture_file_upload(
        Rails.root.join('spec', 'support', 'bomberman.jpg'), 'image/png'
      )
    end
  end
end
