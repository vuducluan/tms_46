require "factory_girl_rails"
5.times {FactoryGirl.create :course}
FactoryGirl.create :supervisor
FactoryGirl.create :supervisor_sang
FactoryGirl.create :trainee1
FactoryGirl.create :trainee2
