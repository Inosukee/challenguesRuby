#Initialize challengue Four
require "./challengueStepTwo-Three.rb"

m = ValidateNumbers.new()
numbers = m.arrayValidation()

#Añadiendo un | o _ a un numero bien escaneado
#adding a | or _ to a correct scan number
def possibleCharAdd(array)
  count = 0
  array.collect! do |element|
    case element
    when "1"
      "7"
      count += 1
    when "4"
      "9"
      count += 1
    when "5"
      "6" #9
    when "8"
      "0"
    when "9"
      "8"
      count += 1
    when "0"
      "8"
      count += 1
    else
      element
    end
  end
  return count
end

#Quitando un | o _ a un numero bien escaneado
#Removing a | or _ to a correct scan number
def possibleCharRem(array)
  count = 0
  array.collect! do |element|
    case element
    when "6"
      "5"
    when "7"
      "1"
    when "8"
      "9" #0
    else
      element
    end
  end
end

for x in (0..(numbers.length - 1))
  temp = numbers[x].chars
  #puts temp
  for val in (9..(temp.length - 1))
    #validar si es un ILL
    if temp[val] == "I"
      #validar si es un ERR
    elsif temp[val] == "E"
      v = possibleCharAdd(temp)
      #si tiene multiples cambios se pone un AMB
      #Having multiple changes add a AMB
      if v >= 2
        v = numbers[x].slice!("ERR")
        numbers[x] = "#{numbers[x]}AMB"
      end
    end
  end
end
puts numbers
