FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    # email { "test@example.com" }
    password { "f4k3p455w0rd" }
    first_name { "firstname" }
  end
end
