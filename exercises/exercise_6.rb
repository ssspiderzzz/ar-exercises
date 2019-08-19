require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Spider", last_name: "Zhu", hourly_rate: 70)
@store1.employees.create(first_name: "Kimchi", last_name: "Kong", hourly_rate: 30)

@store2.employees.create(first_name: "Biscuit", last_name: "Kong", hourly_rate: 20)
@store2.employees.create(first_name: "Scott", last_name: "Appleton", hourly_rate: 70)

employees = Employee.all

pp employees.inspect