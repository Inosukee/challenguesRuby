#Initialize challengue Four
require "./challengueStepTwo-Three.rb"

m = ValidateNumbers.new()
numbers = m.arrayValidation()

#puts numbers
for x in (0..(numbers.length - 1))
  temp = numbers[x].chars
  #puts temp
  for val in (9..(temp.length - 1))
    #validar si es un ILL
    if temp[val] == "I"
      #validar si es un ERR
    elsif temp[val] == "E"
      count = 0
      temp.collect! do |element|
        case element
        when "1"
          "7"
          count += 1
        when "4"
          "9"
          count += 1
        when "5"
          "6"
          count += 1
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
      if count >= 2
        numbers[x].slice!("ERR")
        numbers[x] = "#{numbers[x]}AMB"
      end
    end
  end
end
puts numbers

#Añadiendo un 1 o _
#whith add a | or _
# def possibleNumbersAdd(number)
#   if number == 1
#     puts 7
#   elsif number == 4
#     puts 9
#   elsif number == 5
#     puts 6, 9
#   elsif number == 9 || number == 0
#     puts 8
#   end
# end

#Quitando un | o _
#whith remove a | or _
# def posiibleNumbersRem(number)
#   if number == 6
#     puts 5
#   elsif number == 7
#     puts 1
#   else number == 8
#     puts 9   end
# end

#si tiene multiples cambios se pone un AMB
#if have multiple changes add a AMB
