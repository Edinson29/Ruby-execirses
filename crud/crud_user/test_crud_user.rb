# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'crud_user.rb'

describe User do
  describe '#create instance method' do
    # Test funcionality
    it 'create user' do
      user = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'edinson@gmail.com', age: 20, address: '7de abril'
      )
      User.all.must_include(user.create)
    end
    # Test for first_name
    it 'Return error when first_name is empty' do
      user = User.new(
        first_name: '', last_name: 'Gutierrez',
        email: 'edinsongutierrez29@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(EmptyError)
      err.message.must_match('First name is required please fill it out')
    end

    it 'Return error when first_name is number' do
      user = User.new(
        first_name: 1546, last_name: 'Gutierrez',
        email: 'edinsong@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(TypeError)
      err.message.must_match('First name must be a name')
    end

    it 'Return error When first_name is a number into string' do
      user = User.new(
        first_name: '1234', last_name: 'Gutierrez',
        email: 'edinsongu@gmail.com', age: 20, address: '7de abril'
      )
      erro = -> { user.create }.must_raise(TypeError)
      erro.message.must_match('First name must be a name')
    end

    # Test for last_name
    it 'Return error when last_name is number' do
      user = User.new(
        first_name: 'Edinson', last_name: 55_794,
        email: 'edinsongut@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(TypeError)
      err.message.must_match('Must be a last name')
    end

    it 'Return error When last_name is a number into string' do
      user = User.new(
        first_name: 'Edinson', last_name: '61548',
        email: 'edinsonguti@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(TypeError)
      err.message.must_match('Must be a last name')
    end

    it 'Return error when last_name is empty' do
      user = User.new(
        first_name: 'Edinson', last_name: '',
        email: 'edinsongutie@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(EmptyError)
      err.message.must_match('Last name is required please fill it out')
    end

    # Test for Email
    it 'Return error when email is empty' do
      user = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: '', age: 20, address: '7 de abril'
      )
      err = -> { user.create }.must_raise(EmptyError)
      err.message.must_match('Email is required please fill it out')
    end

    it 'Return error when is not email' do
      user = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'thebest', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(EmailError)
      err.message.must_match('Invalid email')
    end

    it 'Return error if the email does not end in a domain' do
      user = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'thebest@gmail', age: 20, address: '7de abril'
      )
      err = -> { user.create }.must_raise(EmailError)
      err.message.must_match('Invalid email')
    end

    it 'Return error when id email is repeated' do
      User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'edinsongutier@gmail.com', age: 20, address: '7de abril'
      ).create
      user2 = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'edinsongutier@gmail.com', age: 20, address: '7de abril'
      )
      err = -> { user2.create }.must_raise(RepeatError)
      err.message.must_match('Email already registered')
    end

    # Test for age
    it 'Return error when age is a word' do
      user = User.new(
        first_name: 'Edinson', last_name: 'Gutierrez',
        email: 'edinsongutierrez29@gmail.com', age: 'casa', address: '7de abril'
      )
      err = -> { user.create }.must_raise(TypeError)
      err.message.must_match('Age must be a number')
    end
  end

  describe '#create class method' do
    it 'create user' do
      created_user = User.create(
        first_name: 'fidel', last_name: 'gutierrez',
        email: 'facosta@gmail.com', age: 50, address: 'Las nieves'
      )
      User.all.must_include(created_user)
    end

    # Test for first_name
    it 'Return error when first_name is empty' do
      err = lambda do
        User.create(
          first_name: '', last_name: 'Gutierrez',
          email: 'edinsongutierrez29@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(EmptyError)

      err.message.must_match('First name is required please fill it out')
    end

    it 'Return error when first_name is number' do
      err = lambda do
        User.create(
          first_name: 1546, last_name: 'Gutierrez',
          email: 'edinsong@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(TypeError)
      err.message.must_match('First name must be a name')
    end

    it 'Return error When first_name is a number into string' do
      erro = lambda do
        User.create(
          first_name: '1234', last_name: 'Gutierrez',
          email: 'edinsongu@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(TypeError)
      erro.message.must_match('First name must be a name')
    end

    # Test for last_name
    it 'Return error when last_name is number' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: 95_794,
          email: 'edinsongut@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(TypeError)
      err.message.must_match('Must be a last name')
    end

    it 'Return error When last_name is a number into string' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: '61548',
          email: 'edinsonguti@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(TypeError)
      err.message.must_match('Must be a last name')
    end

    it 'Return error when last_name is empty' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: '',
          email: 'edinsongutie@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(EmptyError)
      err.message.must_match('Last name is required please fill it out')
    end

    # Test for Email
    it 'Return error when email is empty' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: 'Gutierrez',
          email: '', age: 20, address: '7 de abril'
        )
      end.must_raise(EmptyError)
      err.message.must_match('Email is required please fill it out')
    end

    it 'Return error when is not email' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: 'Gutierrez',
          email: 'thebest', age: 20, address: '7de abril'
        )
      end.must_raise(EmailError)
      err.message.must_match('Invalid email')
    end

    it 'Return error if the email does not end in a domain' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: 'Gutierrez',
          email: 'thebest@gmail', age: 20, address: '7de abril'
        )
      end.must_raise(EmailError)
      err.message.must_match('Invalid email')
    end

    it 'Return error when id email is repeated' do
      User.create(
        first_name: 'robert', last_name: 'Gutierrez',
        email: 'usernew@gmail.com', age: 20, address: '7de abril'
      )
      err = lambda do
        User.create(
          first_name: 'steve', last_name: 'Gutierrez',
          email: 'usernew@gmail.com', age: 20, address: '7de abril'
        )
      end.must_raise(RepeatError)
      err.message.must_match('Email already registered')
    end

    # Test for age
    it 'Return error when age is a word' do
      err = lambda do
        User.create(
          first_name: 'Edinson', last_name: 'Gutierrez',
          email: 'edinsongutierrez29@gmail.com', age: 'casa',
          address: '7de abril'
        )
      end.must_raise(TypeError)
      err.message.must_match('Age must be a number')
    end
  end
  describe '#find' do
    it 'Find hash' do
      user = User.create(
        first_name: 'edinson', last_name: 'gutierrez',
        email: 'edinsongc1@gmail.com', age: 20, address: '7 de Abril'
      )
      User.find(user.id).must_be_same_as(user)
    end

    it 'Return error when is a string' do
      err = -> { User.find('jose') }.must_raise(TypeError)
      err.message.must_match('Id must be a number')
    end

    it 'Return error when is empty' do
      err = -> { User.find('') }.must_raise(EmptyError)
      err.message.must_match('Id required please fill it out')
    end
  end

  describe '#count' do
    it 'User account' do User.count.must_be(:<, 20) end
  end

  describe '#where' do
    it 'Must meet the condition' do
      user = User.create(
        first_name: 'Walter', last_name: 'Cervantes',
        email: 'waltercervamtes@gmail.com', age: 20, address: '7 de Abril'
      )
      User.where(last_name: 'Cervantes').must_equal([user])
    end

    it 'Return empty in first_name' do
      User.create(
        first_name: 'Ricardo', last_name: 'Franco',
        email: 'ricardofr@gmail.com', age: 48, address: 'Ciudadela'
      )
      User.where(first_name: '45').must_be_empty
    end

    it 'Return empty in last_name' do
      User.create(
        first_name: 'Jucer', last_name: 'Orozco',
        email: 'jucerorozco@gmail.com', age: 20, address: 'villa country'
      )
      User.where(last_name: '').must_be_empty
    end

    it 'Return empty in email' do
      User.create(
        first_name: 'Frito', last_name: 'Gonzales',
        email: 'fritogo@gmail.com', age: 20, address: 'villa country'
      )
      User.where(email: 'edinson@@@hotmai').must_be_empty
    end

    it 'Return empty in age' do
      User.create(
        first_name: 'Liñan', last_name: 'Carreño',
        email: 'carreli@gmail.com', age: 20, address: 'villa country'
      )
      User.where(age: 'koombea').must_be_empty
    end

    it 'returns empty when user does not exist' do
      User.create(
        first_name: 'Samira', last_name: 'Muñoz',
        email: 'smmunoz@gmail.com', age: 20, address: 'villa country'
      )
      User.where(first_name: 'jonatan').must_be_empty
    end
  end

  describe '#update' do
    it 'Updates the user' do
      user = User.create(
        first_name: 'Andres', last_name: 'Gutierrez', age: 18,
        email: 'edinosn87h@gmail.com', address: 'Carrizal'
      )
      update = user.update(first_name: 'edinson')
      ser = User.all
      ser.must_include(update)
    end

    it 'Return error in first_name' do
      user = User.create(
        first_name: 'Edinson', last_name: 'Gutierrez', age: 18,
        email: 'edinoh@gmail.com', address: 'Carrizal'
      )
      err = -> { user.update(first_name: '45678') }.must_raise(TypeError)
      err.message.must_match('First name must be a name')
    end

    it 'Return error in last_name' do
      user = User.create(
        first_name: 'Edinson', last_name: 'Gutierrez', age: 18,
        email: 'edinoh@gmil.com', address: 'Carrizal'
      )
      err = -> { user.update(last_name: 45_678) }.must_raise(TypeError)
      err.message.must_match('Must be a last name')
    end

    it 'Return error in email' do
      user = User.create(
        first_name: 'Edinson', last_name: 'Gutierrez', age: 18,
        email: 'edinoh@gml.com', address: 'Carrizal'
      )
      err = -> { user.update(email: 'edinsondf') }.must_raise(EmailError)
      err.message.must_match('Invalid email')
    end

    it 'Return error in age' do
      user = User.create(
        first_name: 'Edinson', last_name: 'Gutierrez', age: 18,
        email: 'edinoh@gmlo.com', address: 'Carrizal'
      )
      err = -> { user.update(age: 'camisa') }.must_raise(TypeError)
      err.message.must_match('Age must be a number')
    end
  end

  describe '#delete' do
    it 'successfully deletes the user' do
      user_to_delete = User.create(
        first_name: 'Edilberto', last_name: 'Suarez', age: 35,
        email: 'emgutierrez45@gmlo.com', address: 'El bosque'
      )
      user_to_delete = user_to_delete.delete
      User.all.wont_include(user_to_delete)
    end
  end
end
