require 'faker'

FactoryGirl.define do
  factory :user  do
    email   { Faker::Internet.email }
    name    { Faker::Name.last_name }
    password Digest::MD5.hexdigest(Faker::Internet.email)
  end
end
