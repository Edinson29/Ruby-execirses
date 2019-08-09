require 'minitest/autorun'
require_relative 'crud_user.rb'

describe User do

  # Test funcionality
  it 'create user' do
    user = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'edinson@gmail.com', age: 20, address: '7de abril')
    user.create.must_match('The user was successfully created')
  end

  # Test for first_name
  it 'Return error when first_name is empty' do
    err = lambda {user = User.new(id: '', first_name: '', last_name: 'Gutierrez', email: 'edinsongutierrez29@gmail.com', age: 20, address: '7de abril')
    user.create}.must_raise(EmptyError)
    err.message.must_match('This field is required please fill it out')
  end

  it 'Return error when first_name is number' do
    err = lambda {user = User.new(id: '', first_name: 1546, last_name: 'Gutierrez', email: 'edinsong@gmail.com', age: 20, address: '7de abril')
    user.create}.must_raise(TypeError)
    err.message.must_match('That is not a string')
  end

  it 'Return error When first_name is a number into string' do
    erro = lambda {user1 = User.new({id: '', first_name: '1234', last_name: 'Gutierrez', email: 'edinsongu@gmail.com', age: 20, address: '7de abril'})
    user1.create}.must_raise(TypeError)
    erro.message.must_match('That is not a string')
  end

  # Test for last_name
  it 'Return error when last_name is number' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: 55794, email: 'edinsongut@gmail.com', age: 20, address: '7de abril')
    user.create}.must_raise(TypeError)
    err.message.must_match('That is not a string')
  end

  it 'Return error When last_name is a number into string' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: '61548', email: 'edinsonguti@gmail.com', age: 20, address: '7de abril')
    user.create}.must_raise(TypeError)
    err.message.must_match('That is not a string')
  end

  it 'Return error when last_name is empty' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: '', email: 'edinsongutie@gmail.com', age: 20, address: '7de abril')
    user.create}.must_raise(EmptyError)
    err.message.must_match('This field is required please fill it out')
  end

  # Test for Email
  it 'Return error when email is empty' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: '', age: 20, address: '7 de abril')
    user.create}.must_raise(EmptyError)
    err.message.must_match('This field is required please fill it out')
  end

  it 'Return error when is not email' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'thebest', age: 20, address: '7de abril')
    user.create}.must_raise(EmailError)
    err.message.must_match('Invalid email')
  end

  it 'Return error if the email does not end in a domain' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'thebest@gmail', age: 20, address: '7de abril')
    user.create}.must_raise(EmailError)
    err.message.must_match('Invalid email')
  end

  it 'Return error when id email is repeated' do
    err = lambda do
      user3 = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'edinsongutier@gmail.com', age: 20, address: '7de abril')
      user3.create
      user2 = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'edinsongutier@gmail.com', age: 20, address: '7de abril')
      user2.create
    end.must_raise(RepetitionError)
    err.message.must_match('The Email must be unique')
  end

  # Test for age
  it 'Return error when age is a word' do
    err = lambda {user = User.new(id: '', first_name: 'Edinson', last_name: 'Gutierrez', email: 'edinsongutierrez29@gmail.com', age: 'viruela', address: '7de abril')
    user.create}.must_raise(TypeError)
    err.message.must_match('That is not a number')
  end
end
