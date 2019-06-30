users = [
  { name: 'admin', admin: true },
  { name: 'adam' },
  { name: 'max' }
]

User.create(users)

categories = [
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'DevOps' }
]

categories = Category.create(categories)

tests = categories.map do |category|
  Test.create(title: "Test for category: #{category.title}", level: [1, 2, 3].sample, category_id: category.id)
end

questions = tests.map do |test|
  Question.create(body: "Question for test: #{test.title}", test_id: test.id)
end

answers = questions.map do |question|
  Answer.create(body: "Answer for question: #{question.body}", question_id: question.id)
end

tests_users = tests.map do |test|
  TestsUsers.create(test_id: test.id, user_id: User.ids.sample, progress: rand(1..100))
end
