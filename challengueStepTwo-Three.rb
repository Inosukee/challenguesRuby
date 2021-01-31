#Initialize challengue Two and Three
class ValidateNumbers
  def arrayValidation
    require "./challengueStepOne.rb"

    m = ReadFiles.new()
    numbers = m.readFile()
    n = validacion(numbers)
    puts "--------------------Challengue Two-Three-------------------"
    puts n
    return n
  end

  def validacion(array)
    for x in (0..(array.length - 1))
      temp = array[x].chars
      multiplicador = 9
      valide = 0
      interrogation = false
      for y in (0..8)
        #have an ?
        if temp[y] == "?"
          interrogation = true
        else
          valide += temp[y].to_i * multiplicador
          multiplicador -= 1
        end
      end
      #validate If some characters are illegible
      if interrogation
        array[x] = "#{array[x]} ILL"
        #validate if it is a valid policy number.
      elsif (valide % 11) == 0
        array[x] = "#{array[x]}"
        #validate if it's not a valid policy number.
      else
        array[x] = "#{array[x]} ERR"
      end
    end
    return array
  end

  #n = ValidateNumbers.new()
  #n.arrayValidation()
end
