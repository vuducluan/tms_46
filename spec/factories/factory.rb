# FactoryGirl.define do
#   factory :course do |course|
#     name {Faker::Lorem.word}
#     instruction {Faker::Lorem.paragraph}
#     course.after :create do |course|
#       course.users << FactoryGirl.build(:user)
#     end
#   end

#   factory :user do
#     name  {Faker::Name.name}
#     email {Faker::Internet.email}
#     password "coltech4u"
#     password_confirmation "coltech4u"
#     role 0
#   end

#   factory :supervisor, class: User do
#     name  "Vu Duc Luan"
#     email "vuvanlyth@gmail.com"
#     password "coltech4u"
#     password_confirmation "coltech4u"
#     role 1
#   end

#   factory :user_courses do
#     user
#     course
#   end
# end

FactoryGirl.define do
  factory :course do
    name {Faker::Lorem.word}
    instruction {Faker::Lorem.paragraph}
    status 1
  end

  factory :user do
    name  {Faker::Name.name}
    email {Faker::Internet.email}
    password "coltech4u"
    password_confirmation "coltech4u"
    role 0
  end

  factory :user_course do
    user_id
    course_id
  end
  #################
  factory :user_course1, class: UserCourse do
    user_id 2
    course_id 1
  end

  factory :user_course2, class: UserCourse do
    user_id 2
    course_id 2
  end
  #################

  factory :subject do
    name {Faker::Name.name}
    instruction {Faker::Lorem.paragraph}
  end

  factory :course_subject do
    course_id
    subject_id
  end
  ##############
  factory :course_subject1, class: CourseSubject do
    course_id 1
    subject_id 1
  end
  factory :course_subject2, class: CourseSubject do
    course_id 1
    subject_id 2
  end
  factory :course_subject3, class: CourseSubject do
    course_id 1
    subject_id 3
  end
  factory :course_subject4, class: CourseSubject do
    course_id 1
    subject_id 4
  end
  factory :course_subject5, class: CourseSubject do
    course_id 1
    subject_id 5
  end
  ##############

  factory :user_subject do
    user_id
    subject_id
    course_id
  end
  #################
  factory :user_subject1, class: UserSubject do
    user_id 2
    course_subject_id 1
  end
  factory :user_subject2, class: UserSubject do
    user_id 2
    course_subject_id 2
  end
  factory :user_subject3, class: UserSubject do
    user_id 2
    course_subject_id 3
  end
  factory :user_subject4, class: UserSubject do
    user_id 2
    course_subject_id 4
  end
  factory :user_subject5, class: UserSubject do
    user_id 2
    course_subject_id 5
  end
  #################

  factory :task do
    name {Faker::Name.name}
  end

  # factory :course_subject_task do
  #   course_subject_id
  #   task_id
  # end
  ####################
  factory :course_subject_task1, class: CourseSubjectTask do
    course_subject_id 1
    task_id 1
  end
  factory :course_subject_task2, class: CourseSubjectTask do
    course_subject_id 1
    task_id 2
  end
  factory :course_subject_task3, class: CourseSubjectTask do
    course_subject_id 1
    task_id 3
  end
  factory :course_subject_task4, class: CourseSubjectTask do
    course_subject_id 1
    task_id 4
  end
  factory :course_subject_task5, class: CourseSubjectTask do
    course_subject_id 1
    task_id 5
  end
  ######################
  factory :supervisor, class: User do
    name  "Vu Duc Luan"
    email "vuvanlyth@gmail.com"
    password "coltech4u"
    password_confirmation "coltech4u"
    role 1
  end

  factory :trainee, class: User do
    name "Trainee"
    email "vu.duc.luan@framgia.com"
    password "coltech4u"
    password_confirmation "coltech4u"
  end
end

