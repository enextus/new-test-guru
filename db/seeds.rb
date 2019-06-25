# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

users = [
  { name: 'admin', admin: true },
  { name: 'Adam' },
  { name: 'Max' }
]

User.create(users)

categories = [
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'DevOps' }
]

Category.create(categories)
