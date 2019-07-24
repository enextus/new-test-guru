users = [
  { name: 'admin', admin: true, email: 'admin@gmail.com' },
  { name: 'adam', email: 'adam@gmail.com'  },
  { name: 'max', email: 'max@gmail.com'  }
]

User.create(users)

categories = [
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'DevOps' },
]

categories = Category.create(categories)

tests = []
categories.map do |category|
  4.times { tests << Test.create(title: "Test for category: #{category.title}, test code: #{rand(100..10000)}", level: rand(1..10), category_id: category.id,  user_id: User.ids.sample) }
  tests
end

questions = tests.map do |test|
  Question.create(body: "Question for test: #{test.title}", test_id: test.id)
end

answers = questions.map do |question|
  puts "1. question = #{question.inspect}, question.id = #{question.id} "
  Answer.create(body: "Answer for question: #{question.body}", correct: [true, false].shuffle.last, question_id: question.id)
end

tests_users = tests.map do |test|
  TestsUser.create(test_id: test.id, user_id: User.ids.sample, progress: rand(1..100))
end
