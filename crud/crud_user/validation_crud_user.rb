class EmptyError < StandardError; end
class EmailError < StandardError; end
class RepetitionError < StandardError; end
class RepetError < StandardError; end
# This module has all user crud validations
module Validation
  def validation_arguments(user)
    validation_error_string(user.dates[:first_name])
    validation_error_string(user.dates[:last_name])
    validate_error_email(user.dates[:email])
    validate_error_age(user.dates[:age])
  end

  def validation_find(num)
    if empty?(num)
      raise EmptyError, 'This field is required please fill it out'
    elsif string?(num)
      raise TypeError, 'That is not a number'
    end
  end

  def validation_where(var)
    raise ArgumentError, 'The hash must have a single key and a single value' if var.length > 1
  end

  def validation_update(user)
    user.each_key do |k|
      case k
      when :first_name then validation_error_string(user[:first_name])
      when :last_name then validation_error_string(user[:last_name])
      when :email then validate_error_email(user[:email])
      when :age then validate_error_age(user[:age])
      end
    end
  end

  def validation_error_string(var)
    if empty?(var)
      raise EmptyError, 'This field is required please fill it out'
    elsif num?(var)
      raise TypeError, 'That is not a string'
    end
  end

  def validate_error_email(email)
    raise EmptyError, 'This field is required please fill it out' if empty?(email)
    raise EmailError, 'Invalid email' unless correo?(email)
  end

  def validate_error_age(age)
    raise TypeError, 'That is not a number' if string?(age)
  end

  def correo?(string)
    string =~ /^[\w\d]+@[\w\d]+(\.[\w\d]+)+$/
  end

  def empty?(var)
    var.nil? || var == ''
  end

  def num?(var)
    var.to_s == var.to_i.to_s
  end

  def string?(var)
    var.to_s != var.to_i.to_s
  end
end
