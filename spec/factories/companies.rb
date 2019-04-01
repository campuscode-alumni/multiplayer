FactoryBot.define do
  factory :company do
    sequence(:name) { |i| "Company #{i}" }
    logo do
      fixture_file_upload(
        Rails.root.join('spec', 'support', 'sega.png'), 'image/png'
      )
    end
  end
end
