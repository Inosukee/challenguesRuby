#Initialize challengue One
class ReadFiles
  def initialize()
  end

  def readFile()
    #The file contenido.txt it's on the root folder proyect
    content = File.read("contenido.txt")
    lines = content.split("\n")
    array = Array.new(lines.length()) { Array.new(27) { 0 } }
    contline = 0
    contcaracter = 0
    contexcepcion = 0
    lines.each do |line|
      temp = line.chars
      temp.each do |c|
        if contexcepcion == 3 || contexcepcion == 7 || contexcepcion == 11 || contexcepcion == 15 || contexcepcion == 19 || contexcepcion == 23 || contexcepcion == 27 || contexcepcion == 31 || contexcepcion == 35
          contexcepcion += 1
        else
          array[contline][contcaracter] = c
          contcaracter += 1
          contexcepcion += 1
        end
      end
      contline += 1
      contcaracter = 0
      contexcepcion = 0
    end
    getNumbers(array, lines.length())
  end

  def getNumbers(array, length)
    finalNumber = ""
    numbers = Array.new
    init = 0
    contFileInit = 0
    contwhile = 0
    while contwhile < (length / 3)
      init = 0
      for x in (1..9)
        #Found number 1 or 4
        if array[contFileInit][init + 1] == " "
          if array[contFileInit + 1][init] == " " && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 2] == "|"
            finalNumber = finalNumber + "1"
          else
            if array[contFileInit + 1][init] == "|" && array[contFileInit + 1][init + 1] == "_" && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 2] == "|"
              finalNumber = finalNumber + "4"
            else
              finalNumber = finalNumber + "?"
            end
          end
        else
          #Found number 9 or 8
          if array[contFileInit + 1][init] == "|" && array[contFileInit + 1][init + 1] == "_" && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 1] == "_" && array[contFileInit + 2][init + 2] == "|"
            if array[contFileInit + 2][init] == " "
              finalNumber = finalNumber + "9"
            else
              finalNumber = finalNumber + "8"
            end
            #Found number 0
          elsif array[contFileInit + 1][init] == "|" && array[contFileInit + 1][init + 1] == " " && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 1] == "_" && array[contFileInit + 2][init + 2] == "|" && array[contFileInit + 2][init] == "|"
            finalNumber = finalNumber + "0"
            #Found number 5 or 6
          elsif array[contFileInit + 1][init] == "|" && array[contFileInit + 1][init + 1] == "_" && array[contFileInit + 2][init + 1] == "_" && array[contFileInit + 2][init + 2] == "|"
            if array[contFileInit + 2][init] == " "
              finalNumber = finalNumber + "5"
            else
              finalNumber = finalNumber + "6"
            end
            #Found number 2 or 3
          elsif array[contFileInit + 1][init + 1] == "_" && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 1] == "_"
            if array[contFileInit + 2][init] == "|"
              finalNumber = finalNumber + "2"
            else
              if array[contFileInit + 2][init + 1] == "_" && array[contFileInit + 2][init + 2] == "|"
                finalNumber = finalNumber + "3"
              else
                finalNumber = finalNumber + "?"
              end
            end
          else
            #Found number 7
            if array[contFileInit][init + 1] == "_" && array[contFileInit + 1][init + 2] == "|" && array[contFileInit + 2][init + 2] == "|" && array[contFileInit + 2][init + 1] == " "
              finalNumber = finalNumber + "7"
            else
              finalNumber = finalNumber + "?"
            end
          end
        end
        if x == 9
          numbers.push(finalNumber)
          finalNumber = ""
        end
        init += 3
      end
      contFileInit += 3
      contwhile += 1
    end
    return numbers
  end
end
