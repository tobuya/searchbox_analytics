FactoryBot.define do
  factory :user_search do
    association :search_term
    ip_address { '127.0.0.1' }
  end
end
