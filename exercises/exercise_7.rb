require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
Employee.all.each do |i|
  if i.first_name && i.last_name && i.hourly_rate > 40 && i.hourly_rate < 200 && i.store_id
    puts "Employee id: #{i.id} has passed all the validations."
  else
    puts "Employee id: #{i.id} has failed the validations! Please fix it!"
  end
end

Store.all.each do |i|
  if i.name.length >= 3 && i.annual_revenue.to_i >= 0 && (i.mens_apparel || i.womens_apparel)
    puts "Store id: #{i.id} has passed all the validations."
  else
    puts "Store id: #{i.id} has failed the validations! Please fix it!"
  end
end

puts "Creating a new store."
puts "Please enter a store name:"
print ">"
name = $stdin.gets.chomp
puts "Please enter the store annual revenue:"
print ">"
annual_revenue = $stdin.gets.chomp
puts "Does this store carry men's apparel? (true or false):"
print ">"
mens_apparel = $stdin.gets.chomp
puts "Does this store carry women's apparel? (true or false):"
print ">"
womens_apparel = $stdin.gets.chomp

# test for creating a new store
newStore = Store.create(name: name, annual_revenue: annual_revenue, mens_apparel: mens_apparel, womens_apparel: womens_apparel)
puts newStore.errors.full_messages

# test for creating a new employee with last name blank and hourly rate less than 40
employee2 = @store2.employees.create(first_name: "Biscuit", hourly_rate: 20)
puts employee2.errors.full_messages
