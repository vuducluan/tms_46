FactoryGirl.define do
  factory :course do
    sequence :name do |n|
      "The Course #{n+1}"
    end
    sequence :instruction do |n|
      "This is instruction for the course #{n+1}"
    end
  end
end
