# 20.times {FactoryGirl.create :course}
# FactoryGirl.create :supervisor

10.times {FactoryGirl.create :course}
FactoryGirl.create :supervisor
FactoryGirl.create :trainee
FactoryGirl.create :user_course1
FactoryGirl.create :user_course2
5.times {FactoryGirl.create :subject}
FactoryGirl.create :course_subject1
FactoryGirl.create :course_subject2
FactoryGirl.create :course_subject3
FactoryGirl.create :course_subject4
FactoryGirl.create :course_subject5
FactoryGirl.create :user_subject1
FactoryGirl.create :user_subject2
FactoryGirl.create :user_subject3
FactoryGirl.create :user_subject4
FactoryGirl.create :user_subject5
5.times {FactoryGirl.create :task}
FactoryGirl.create :course_subject_task1
FactoryGirl.create :course_subject_task2
FactoryGirl.create :course_subject_task3
FactoryGirl.create :course_subject_task4
FactoryGirl.create :course_subject_task5
