def multi
  multiple = 0
  1000.times do |count|
    multiple += count if count % 3 == 0 || count % 5 == 0
  end
  puts multiple
end
multi