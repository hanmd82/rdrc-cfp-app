# frozen_string_literal: true

FactoryGirl.define do
  sequence(:email) { |n| "anakin#{n}@thedarkside.com" }

  factory :user do
    email

    name "Anakin Skywalker"

    factory :with_papers do
      transient do
        paper_count 1
      end

      after(:create) do |user, evaluator|
        create_list :paper, paper_count, user: user
      end
    end

    trait :invalid do
      name ""
    end

    trait :cleaner do
      role :cleaner
    end
  end
end
