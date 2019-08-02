  require_relative 'validation_crud_user.rb'
class User
  include Validation
  attr_accessor :first_name, :last_name, :email, :age , :user
  $user = []
  def initialize(**dates)
    @id = dates[:id]
    @first_name = dates[:first_name]
    @last_name = dates[:last_name]
    @email = dates[:email]
    @age = dates[:age]
    @address = dates[:address]
  end
  def is_not_unique?
    $user.each{ |value| raise RepetitionError, 'The Email must be unique' if value[:email] == @email }
  end

  def create
    is_not_unique?
    @id = $user.length + 1
    date = Hash.new
    date = {id: '', first_name: '', last_name: '', email: '', age: '', address: ''}
    validation_create(self)
    date[:id] = @id
    date[:first_name] = @first_name
    date[:last_name] = @last_name
    date[:email] = @email
    date[:age] = @age
    date[:address] = @address
    $user << date
    'The user was successfully created'
  end

  def count

  end

  def all

  end

  def find

  end

  def where

  end

  def update


  end

  def delete

  end
end