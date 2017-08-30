 require 'random_data'
 
 
 20.times do
   User.create!(
     email: Faker::Internet.email,
     password: Faker::Internet.password,
     confirmed_at: Time.now
   )
 end
 
 users = User.all
 
 50.times do
   Wiki.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     private: false,
     user: users.sample
   )
 end
 
 
  admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
   confirmed_at: Time.now,
   role:     'admin'
 )
 
 standard = User.create!(
   email:    'standard@example.com',
   password: 'helloworld',
   confirmed_at: Time.now,
 )
 
  premium = User.create!(
   email:    'premium@example.com',
   password: 'helloworld',
   confirmed_at: Time.now,
   role:     'premium'
 )
 
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wiki entries created"