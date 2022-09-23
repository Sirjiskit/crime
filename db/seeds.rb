# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# `rails db:drop`
# `rails db:create`
# `rails db:migrate`

user1 = User.create!(
  email: 'admin@test.com',
  password: 'password',
  admin: true,
  firstname: 'Usman',
  lastname: 'Bello',
  gender: 'Male',
  phone: '09016262526',
  address: 'Taraba, Nigeria',
)

user2 = User.create!(
  email: 'police@test.com',
  password: 'password',
  admin: false,
  firstname: 'Aliyu',
  lastname: 'Abba',
  gender: 'Male',
  phone: '09012828272',
  address: 'Bali , Taraba',
)

1..30.times do
  user2 = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    admin: [false, true].sample,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name ,
    gender: %i[Male Female].sample,
    phone: Faker::Number.number(digits: 11),
    address: Faker::Address.full_address,
    active: [true, false].sample
  )
end

cat1 = Category.create!(user: user1, name: 'Financial')
cat2 = Category.create!(user: user1, name: 'Driving Under the Influence')

Complainant.create!(
  user: user1,
  firstname: 'Yusuf',
  surname: 'Johnson',
  email: 'complainant1@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Taraba, Nigeria',
  occupation: 'Accountant',
  phone: '08177377383',
  gender: 'Male'
  )

c1 = Complainant.create!(
  firstname: 'Usman',
  surname: 'Bello',
  email: 'complainant2@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Gashika, Taraba',
  occupation: 'Doctor',
  phone: '08477377383',
  gender: 'Male',
  user: user1
)

c2 = Complainant.create!(
  firstname: 'Manasseh',
  surname: 'Peters',
  email: 'complainant3@test.com',
  dob: Date.today,
  nationality: 'Nigerian',
  address: 'Jalingo, Taraba',
  occupation: 'Cobbler',
  phone: '08477371183',
  gender: 'Male',
  user: user2
)

1..10.times do
  FirstInformationReport.create!(
    offense: ['Rape case', 'Illegal Possession of Firearms', 'Bugle case', 'Stealing', 'Conspiracy to commit murder'].sample,
    date: [Date.today, Date.tomorrow, Date.yesterday].sample,
    location: ['Jalingo', 'Bali', 'Lau', 'Gashaka', 'Kurmi'].sample,
    suspect_details: 'One man named Usman Williams with Toyota Camry car, plate no: IKJ123LG',
    user: [user1, user2].sample,
    complainant: [c1,c2].sample,
    status: [0,1,2].sample
  )
end

1..15.times do
  Crime.create!(
    accuser: ['Mimi Aker', 'Iorfa Grace', 'Titi Johnson', 'Godswill Usman', 'Augustine Uju'].sample,
    accused: ['Junior Francis', 'Bebe Moses', 'Grace Uya', 'Usman Dauda', 'Abdullahi Adamu'].sample,
    unknown_others: %i[Driver Gateman N/A].sample,
    date: [Date.today, Date.tomorrow, Date.yesterday].sample,
    statements: ['Statement story goes here...', 'This is another supernover story', 'The intelligent'].sample,
    user_id: [1,2].sample
  )
end

CrimeCategory.create!(crime_id: 1, category: cat1)
CrimeCategory.create!(crime_id: 2, category: cat2)
CrimeCategory.create!(crime_id: 3, category: cat1)
