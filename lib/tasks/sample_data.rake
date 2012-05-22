namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_spots
    make_reviews
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_spots
  99.times do |n|
    name  = Faker::Name.name
    address1 = Faker::Address.street_address
    address2 = Faker::Address.secondary_address
    city = Faker::Address.city
    postcode = Faker::Address.uk_postcode
    description = Faker::Lorem.paragrah
    spotType = "Outdoor Park"
    user = User.find(1)
    Spot.create!(name:        name,
                 address1:    address1,
                 address2:    address2,
                 city:        city,
                 postcode:    postcode,
                 description: description,
                 spotType:    spotType,
                 user_id:     user.id)
  end
end

def make_reviews
  users = User.all(limit: 10)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each{ |user| user.review.create!(content: content, spot_id: spot_id)}
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end