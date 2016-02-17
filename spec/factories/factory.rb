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

  factory :supervisor_sang, class: User do
    name  "Ly Xuan Sang"
    email "ly.xuan.sang@framgia.com"
    password "12345678"
    password_confirmation "12345678"
    role 1
  end

  factory :supervisor_dieunb, class: User do
    name  "Nguyen Binh Dieu"
    email "nguyen.binh.dieu@framgia.com"
    password "12345678"
    password_confirmation "12345678"
    role 1
  end

  factory :trainee1, class: User do
    name  "Kenny Sang"
    email "ly.xuan.sang@gmail.com"
    password "12345678"
    password_confirmation "12345678"
    role 0
  end

  factory :trainee2, class: User do
    name  "Trainee Luan"
    email "vu.duc.luan@framgia.com"
    password "coltech4u"
    password_confirmation "coltech4u"
    role 0
  end

  factory :user_courses do
    user
    course
  end
end
