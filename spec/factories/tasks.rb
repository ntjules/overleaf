FactoryBot.define do
  factory :task do
    association :user
    title { "title test" }
    content { "content test" }
    deadline { "2019-09-19 08:16:32" }
  end
end
