require 'faker'
puts 'Seeds: start'
ROLES = ['Captain', 'Brain tester', 'Scout', 'Medic', 'Tanker', 'Assassin'].freeze
ROLES.each { |role| Role.create!(title: role) }
DECOMPS = ['Fresh', 'Rotting', 'Stale', 'Dead (again)']
20.times do
  name = Faker::Name.name
  Zombie.create!(
  name: name,
  bio: Faker::Cat.name,
  age: Faker::Number.between(1, 60),
  email: Faker::Internet.free_email(name.split.join('.')),
  decomp: DECOMPS[rand(4)]
  )
  Zombie.last.create_brain(
  flavor: Faker::Food.ingredient,
  status: Faker::Hipster.word
  )
end

zombies = Zombie.all
Role.all.each do |role|
  role.zombies << zombies.sample(rand(1..3))
end

zombies.each do |zombie|
  rand(15).times do
    zombie.tweets.create!(
    status: Faker::Twitter.status[:text]
    )
  end
end

puts 'Seeds: finish'
