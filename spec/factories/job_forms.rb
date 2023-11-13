FactoryBot.define do
  factory :job_form do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    tag_name {Faker::Lorem.sentence}
    association :user

    after(:build) do |job_form|
      # fixture_file_uploadを使用してテスト画像のファイルをアップロードするように設定
      job_form.image = Rack::Test::UploadedFile.new('public/images/test_image.png', 'image/png')
    end
  end
end
