FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    term                  {'test'}
    hobby                 {'test'}
    learn_reason          {'test'}
    career_pass           {'test'}
    impressed_app         {'test'}
  end
end