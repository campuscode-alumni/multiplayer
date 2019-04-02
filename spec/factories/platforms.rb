FactoryBot.define do
  factory :platform do
    sequence(:name) { |i| "Plataforma #{i}" }
    logo do
      fixture_file_upload(
        Rails.root.join('spec', 'support', 'ps4.png'), 'image/png'
      )
    end
  end
end
