def q13
  arr = [5, 22, 29, 39, 19, 51, 78, 96, 84]
  i = 0
  while (i < arr.size - 1 and arr[i] < arr[i + 1])
    i = i + 1 end
  puts i
      arri = arr[i + 1]
      arr[i + 1] = arr[i]
      arr[i] = arri

  p arr
end

def q14
  def prime? (number)
    3.upto(number-1) do |i|
      return number % i == 0 ? false : next
    end
  end

  primes = (1..100).step(2).to_a

  primes.select! do |i|
    prime?(i)
  end

  p primes
end


def q15(temperature)
  if temperature < 15
    if raining
      puts "It's wet and cold"
    else
      puts "It's not raining but cold"
    end
  else
    if raining
      puts "It's warm and raining"
    else
      puts "It's warm but not raining"
    end
  end
end

def list_allergies()
  page = <<-ALLERGIES
 - eggs
 - peanuts
 - shellfish
 - strawberries
 - tomatoes
 - chocolate
 - pollen
 - cats
  ALLERGIES
  puts page
end

def return_allergies(mask)
  allergies = ["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"]
  arr = ("%08b" % mask).chars.reverse
  list = arr.each_index.select {|i| arr[i] == "1" }
  list.each {|i| puts allergies[i]}
end

return_allergies(34)