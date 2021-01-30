#Initialize challengue Two and Three
class ValidateNumbers
  def arrayValidation
    require "./challengueStepOne.rb"

    m = ReadFiles.new()
    numbers = m.readFile()

    for x in (0..(numbers.length - 1))
      temp = numbers[x].chars
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
        numbers[x] = "#{numbers[x]} ILL"
        #validate if it is a valid policy number.
      elsif (valide % 11) == 0
        numbers[x] = "#{numbers[x]}"
        #validate if it's not a valid policy number.
      else
        numbers[x] = "#{numbers[x]} ERR"
      end
    end
    return numbers
  end
end
