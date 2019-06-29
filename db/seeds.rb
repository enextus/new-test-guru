# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#  1 | users      | table |
#  2 | categories | table |
#  3 | tests      | table |
#  4 | questions  | table |
#  5 | answers    | table |
#
# #################################################################

users = [
  { name: 'admin', admin: true },
  { name: 'adam' },
  { name: 'max' }
]

User.create(users)

# #################################################################

categories = [
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'DevOps' }
]

categories = Category.create(categories)

# #################################################################

tests = categories.map do |category|
  Test.create(title: "Test for category: #{category.title}", level: [1,2,3].sample, category_id: category.id)
end

# #################################################################

questions = tests.map do |test|
  Question.create(body: "Question for test: #{test.title}", test_id: test.id)
end

# #################################################################

answers = questions.map do |question|
  Answer.create(body: "Answer for question: #{question.body}", question_id: question.id)
end

# #################################################################

initiated_tests = tests.map do |test|
  InitiatedTest.create(test_id: test.id, user_id: User.ids.sample)
end
