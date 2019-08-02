class EmptyError < StandardError; end
class EmailError < StandardError; end
class RepetitionError < StandardError; end
class RepetError < StandardError; end
module Validation
  def validation_create(date)
    validation_error_string(date.first_name)
    validation_error_string(date.last_name)
    validate_error_email(date.email)
    validate_error_age(date.age)
  end
  def validation_error_string(var)
    if is_empty?(var)
      raise EmptyError, 'This field is required please fill it out'
    elsif is_num?(var)
      raise TypeError, 'That is not a string'
    end
  end
  def validate_error_email(email)
    raise EmptyError, 'This field is required please fill it out' if is_empty?(email)
    raise EmailError, 'Invalid email' unless is_correo?(email)
  end
  def validate_error_age(age)
    raise TypeError, 'That is not a number' if is_string?(age)
  end
  def is_correo?(string)
    string =~ /^[\w\d]+@[\w\d]+(\.[\w\d]+)+$/
  end
  def is_empty?(var)
    var.nil? || var == ''
  end
  def is_num?(var)
    var.to_s == var.to_i.to_s
  end
  def is_string?(var)
    var.to_s != var.to_i.to_s
  end
end