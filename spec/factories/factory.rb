FactoryGirl.define do
  factory :course do |course|
    name {Faker::Lorem.word}
    instruction {Faker::Lorem.paragraph}
    course.after :create do |course|
      course.users << FactoryGirl.build(:user)
    end
  end

  factory :user do
    name  {Faker::Name.name}
    email {Faker::Internet.email}
    password "coltech4u"
    password_confirmation "coltech4u"
    role 0
  end

  factory :supervisor, class: User do
    name  "Vu Duc Luan"
    email "vuvanlyth@gmail.com"
    password "coltech4u"
    password_confirmation "coltech4u"
    role 1
  end

  factory :user_courses do
    user
    course
  end
end
