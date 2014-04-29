require 'faker'

FactoryGirl.define do
  factory :movie do
    title { Faker::Company.name }
    release_at { Faker::Business.credit_card_expiry_date }
    summary { Faker::Lorem.sentence(5) }
    rate { %w{F 10+ 12+ 14+ 16+ 18+}.sample }
    duration { rand(660..240) }
    cover { '' }
  end
end