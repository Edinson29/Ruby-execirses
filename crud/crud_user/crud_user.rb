# Here we call the file that validates the code methods
require_relative 'validation_crud_user.rb'
# This class has all the methods of a user's crud.
class User
  include Validation
  extend Validation
  attr_accessor :dates, :email, :id
  @@user = []
  def initialize(**dates)
    @id = 0
    @dates = dates
  end

  def not_unique?(email)
    @@user.each do |value|
      raise RepetitionError, 'Email must be unique' if value.dates[:email] == email
    end
  end

  def create
    not_unique?(email)
    @id = @@user.length + 1
    validation_arguments(self)
    @dates[:first_name] = @dates[:first_name].capitalize
    @dates[:last_name] = @dates[:last_name].capitalize
    @@user << self
    'The user was successfully created'
  end

  class << self
    attr_accessor :dates, :email
    def create(**dates)
      dates_user = new(@dates = dates)
      dates_user.id_increment
      dates_user.not_unique?(email)
      validation_arguments(self)
      dates_user.dates[:first_name] = dates_user.dates[:first_name].capitalize
      dates_user.dates[:last_name] = dates_user.dates[:last_name].capitalize
      @@user << dates_user
      'The user was successfully created'
    end

    def find(id)
      validation_find(id)
      raise ArgumentError, 'The id does not exist' unless id.to_i <= count

      @@user.select { |value| value.id == id.to_i }.first
    end

    def count
      @@user.length
    end

    def all
      @@user
    end

    def where(**condition)
      validation_where(condition)
      column = condition.keys.first.downcase
      value = condition.values.first.capitalize
      @@user.select do |date|
        date.dates.key?(column) && date.dates.value?(value)
      end
    end
  end

  def id_increment
    @id = @@user.length + 1
  end

  def update(**condition)
    validation_update(condition)
    not_unique?(condition[:email])
    self
    dates.each_key do |k|
      condition.each do |key, value|
        if k == key
          k == :first_name || k == :last_name ? dates[k] = value.capitalize : dates[k] = value
        end
      end
    end
    dates
  end

  def delete
    choice_id = self
    @@user.delete(choice_id)
    counter = 1
    @@user.each do |element|
      element.id = counter
      counter += 1
    end
  end
end
user = User.new(
  first_name: 'edinson',
  last_name: 'gutierrez',
  email: 'thebest@gmail.com',
  age: 20,
  address: '7de abril'
)

user.create.inspect
User.new(
  first_name: 'Edinson',
  last_name: 'Gutierrez',
  email: 'thebest1@gmail.com',
  age: 18,
  address: '7de abril'
).create
User.new(
  first_name: 'rodo',
  last_name: 'galofre',
  email: 'rodo9@gmail.com',
  age: 30,
  address: '7de abril'
).create
User.create(
  first_name: 'samira',
  last_name: 'muñoz',
  email: 'ch32@gmail.com',
  age: 19,
  address: '7de abril'
).inspect
User.count
User.all.inspect
User.find(3).inspect
User.where(first_name: 'isaac').inspect
userrr = User.find(2)
userrr.update(age: '48').inspect
user2 = User.find(1)
puts user2.delete.inspect
