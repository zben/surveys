#create users
%w(Adam Ben Cody Daniel Edward Freddy Gary Henry Ian Jake Keith).each { |name| User.create!(name: name) }

Question.create!([
  {user: User.order('random()').first, content: 'Have you watched a movie in the last week?'},
  {user: User.order('random()').first, content: 'Do you used your smartphone more than 5 hours yesterday?'},
  {user: User.order('random()').first, content: 'Are you satisfied with the Internet speed you have at home?'},
  {user: User.order('random()').first, content: 'Did you get a tax refund last year?'},
  {user: User.order('random()').first, content: 'Do you plan to travel overseas in 2020?'},
  {user: User.order('random()').first, content: 'Are you a registered democrat?'},
  {user: User.order('random()').first, content: 'Do you work more than 8 hours a day?'},
  {user: User.order('random()').first, content: 'Do you shop online at least once a month?'}
])


(Question.count * User.count).times do
  Response.where(user: User.order('random()').first, question: Question.order('random()').first).first_or_create do |response|
    response.answer = [true,false].shuffle.first
  end
end
