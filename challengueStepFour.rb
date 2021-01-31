class DefChars
  def changesChars
    #Initialize chall
    require "./challengueStepTwo-Three.rb"
    m = ValidateNumbers.new()
    numbers = m.arrayValidation()
    puts "--------------------Challengue Four------------------------"
    n = searchChar(numbers)
  end

  #Añadiendo un | o _ a un numero bien escaneado
  #adding a | or _ to a#{} correct scan number

  def validationStepTwo(array)
    temp = array.chars
    multiplicador = 9
    valide = 0
    for y in (0..8)
      valide += temp[y].to_i * multiplicador
      multiplicador -= 1
    end
    if (valide % 11) == 0
      return true
    else
      return false
    end
  end

  def possibleCharAdd(array)
    #while iterarions < 2
    tempArray = array.chars
    estructur = []
    validador = Array.new(12) { Array.new(9) { 0 } }
    iterations = 0
    conTrue = 0
    numeroRepetido = ""
    valorRemplazado = ""

    while iterations < 12
      union = ""
      countplis = 0
      for i in (0..(tempArray.length - 1))
        if tempArray[i] == "5" && countplis == 0 && validador[0][i] == 0
          countplis += 1
          validador[0][i] = 1
          union = "#{union}#{6}"
        elsif tempArray[i] == "6" && countplis == 0 && validador[1][i] == 0
          countplis += 1
          validador[1][i] = 1
          union = "#{union}#{8}"
        elsif tempArray[i] == "9" && countplis == 0 && validador[2][i] == 0
          countplis += 1
          validador[2][i] = 1
          union = "#{union}#{8}"
        elsif tempArray[i] == "0" && countplis == 0 && validador[3][i] == 0
          countplis += 1
          validador[3][i] = 1
          union = "#{union}#{8}"
        elsif tempArray[i] == "3" && countplis == 0 && validador[4][i] == 0
          countplis += 1
          validador[4][i] = 1
          union = "#{union}#{9}"
        elsif tempArray[i] == "5" && countplis == 0 && validador[5][i] == 0
          countplis += 1
          validador[5][i] = 1
          union = "#{union}#{9}"
        elsif tempArray[i] == "1" && countplis == 0 && validador[6][i] == 0
          countplis += 1
          validador[6][i] = 1
          union = "#{union}#{7}"
        elsif tempArray[i] == "8" && countplis == 0 && validador[7][i] == 0
          countplis += 1
          validador[7][i] = 1
          union = "#{union}#{0}"
        elsif tempArray[i] == "8" && countplis == 0 && validador[8][i] == 0
          countplis += 1
          validador[8][i] = 1
          union = "#{union}#{9}"
        elsif tempArray[i] == "7" && countplis == 0 && validador[9][i] == 0
          countplis += 1
          validador[9][i] = 1
          union = "#{union}#{1}"
        elsif tempArray[i] == "6" && countplis == 0 && validador[10][i] == 0
          countplis += 1
          validador[10][i] = 1
          union = "#{union}#{5}"
        elsif tempArray[i] == "9" && countplis == 0 && validador[11][i] == 0
          countplis += 1
          validador[11][i] = 1
          union = "#{union}#{3}"
        else
          union = "#{union}#{tempArray[i]}"
        end
      end

      if numeroRepetido == union
        break
      end
      estructur.push(union)
      prueba = validationStepTwo(estructur[iterations])
      if prueba == true
        valorRemplazado = union
        conTrue += 1
      end
      if conTrue == 2
        puts "#{array} AMB"
        break
      end
      numeroRepetido = union
      iterations += 1
    end
    if conTrue == 1
      puts valorRemplazado
    end
  end

  def searchChar(numbers)
    for x in (0..(numbers.length - 1))
      temp = numbers[x].chars
      #puts temp
      for val in (9..(temp.length - 1))
        #validar si es un ILL
        if temp[val] == "I"
          #validar si es un ERR
        elsif temp[val] == "E"
          numbers[x].slice!(" ERR")
          possibleCharAdd(numbers[x])
        end
      end
    end
  end

  n = DefChars.new()
  n.changesChars()
end
