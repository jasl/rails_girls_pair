require 'date'

u = User.new :email => 'admin@demo.com',
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


  e = Event.new
  e.title = 'Test'
  a.summary = 'Test you know... :smile'
  e.date = Date.today
  e.save!
end
