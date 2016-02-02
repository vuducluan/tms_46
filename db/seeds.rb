  5.times {FactoryGirl.create :user}
  FactoryGirl.create :supervisor
  FactoryGirl.create :user_trainee
  20.times {FactoryGirl.create :course}
  20.times {FactoryGirl.create :subject}
  50.times {FactoryGirl.create :task}
