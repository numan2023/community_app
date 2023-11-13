FactoryBot.define do
  factory :learning_form do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    tag_name {Faker::Lorem.sentence}
    association :user

    after(:build) do |learning_form|
      # fixture_file_uploadを使用してテスト画像のファイルをアップロードするように設定
      learning_form.image = Rack::Test::UploadedFile.new('public/images/test_image.png', 'image/png')
    end
  end
end