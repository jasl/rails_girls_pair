# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new :email => 'jasl9187@hotmail.com',
             :password => 'aaaaaa',
             :role => 'tutor'
u.managable = true

u.save!

if Rails.env.development?
  1.upto(20) do |i|
    User.create! :email => "tutor_#{i}@demo.com",
                 :password => "aaaaaa",
                 :role => "tutor"
  end

  1.upto(80) do |i|
    User.create! :email => "girl_#{i}@demo.com",
                 :password => "aaaaaa",
                 :role => "girl"
  end
end
