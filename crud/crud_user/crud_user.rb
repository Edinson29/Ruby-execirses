# frozen_string_literal:true

require_relative 'validation_crud_user.rb'
# This class has all the methods of a user's crud.
class User
  include Validation
  extend Validation
  attr_accessor :dates, :id
  $user = []
  def initialize(**dates)
    @id = 0
    @dates = dates
  end

  def not_unique?(mail)
    $user.each do |var|
      raise RepeatError, 'Email already registered' if var.dates[:email] == mail
    end
  end

  def create
    not_unique?(dates[:email])
    @id = $user.length + 1
    validation_arguments(self)
    @dates[:first_name] = @dates[:first_name].capitalize
    @dates[:last_name] = @dates[:last_name].capitalize
    $user << self
    self
  end

  class << self
    attr_accessor :dates
    def create(**dates)
      dates_user = new(@dates = dates)
      dates_user.id_increment
      dates_user.not_unique?(dates[:email])
      validation_arguments(self)
      dates_user.dates[:first_name] = dates_user.dates[:first_name].capitalize
      dates_user.dates[:last_name] = dates_user.dates[:last_name].capitalize
      $user << dates_user
      dates_user
    end

    def find(id)
      validation_find(id)
      raise ArgumentError, 'The id does not exist' unless id.to_i <= count

      $user.select { |value| value.id == id.to_i }.first
    end

    def count
      $user.length
    end

    def all
      $user
    end

    def where(**condition)
      column = condition.keys.first.downcase
      value = condition.values.first.capitalize
      information = $user.select do |date|
        date.dates.key?(column) && date.dates.value?(value)
      end
      information
    end
  end

  def id_increment
    @id = $user.length + 1
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
    self
  end

  def delete
    choice_id = self
    $user.delete(choice_id)
    counter = 1
    $user.each do |element|
      element.id = counter
      counter += 1
    end
  end
end
