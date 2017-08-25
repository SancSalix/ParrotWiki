 require 'random_data'
 
 50.times do
   wiki = Wiki.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     private: false,
     user: nil
   )
 end
 
 
 puts "Seed finished"
 puts "#{Wiki.count} wiki entries created"