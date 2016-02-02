FactoryGirl.define do
  factory :course do |course|
    name {Faker::Lorem.word}
    instruction {Faker::Lorem.paragraph}
    status 0
  end

  factory :user do
    name  {Faker::Name.name}
    email {Faker::Internet.email}
    password "coltech4u"
    password_confirmation "coltech4u"
    role 0
  end

  factory :task do
    name {Faker::Lorem.word}
  end

  factory :subject do |subject|
    name {Faker::Name.name}
    instruction {Faker::Lorem.paragraph}
  end

  factory :supervisor, class: User do
    name  "Vu Duc Luan"
    email "vuvanlyth@gmail.com"
    password "coltech4u"
    password_confirmation "coltech4u"
    role 1
  end

  factory :user_trainee, class: User do
    name "Trainee Luan"
    email "vu.duc.luan@framgia.com"
    password "coltech4u"
    password_confirmation "coltech4u"
  end
end
