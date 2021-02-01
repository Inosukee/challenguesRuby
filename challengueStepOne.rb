#Initialize challengue One
class ReadFiles
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
        if [3, 7, 11, 15, 19, 23, 27, 31, 35].include? contexcepcion
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
    result = getNumbers(array, lines.length())
    puts "-------------------Challengue One--------------------------"
    puts result
    return result
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
        if array[contFileInit][init + 1].include? " "
          finalNumber = [array[contFileInit + 1][init], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 2]] == [" ", "|", "|"] ? finalNumber + "1" :
            [array[contFileInit + 1][init], array[contFileInit + 1][init + 1], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 2]] == ["|", "_", "|", "|"] ? finalNumber + "4" : finalNumber + "?"
        else
          case
          #Found number 9 or 8
          when [array[contFileInit + 1][init], array[contFileInit + 1][init + 1], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 1], array[contFileInit + 2][init + 2]] == ["|", "_", "|", "_", "|"]
            finalNumber = array[contFileInit + 2][init] == " " ? finalNumber + "9" : finalNumber + "8"
            #Found number 0
          when [array[contFileInit + 1][init], array[contFileInit + 1][init + 1], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 1], array[contFileInit + 2][init + 2], array[contFileInit + 2][init]] == ["|", " ", "|", "_", "|", "|"]
            finalNumber = finalNumber + "0"
            #Found number 5 or 6
          when [array[contFileInit + 1][init], array[contFileInit + 1][init + 1], array[contFileInit + 2][init + 1], array[contFileInit + 2][init + 2]] == ["|", "_", "_", "|"]
            finalNumber = array[contFileInit + 2][init] == " " ? finalNumber + "5" : finalNumber + "6"
            #Found number 2 or 3
          when [array[contFileInit + 1][init + 1], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 1]] == ["_", "|", "_"]
            finalNumber = array[contFileInit + 2][init] == "|" ? finalNumber + "2" : [array[contFileInit + 2][init + 1], array[contFileInit + 2][init + 2]] == ["_", "|"] ? finalNumber + "3" : finalNumber + "?"
            #Found number 7
          when [array[contFileInit][init + 1], array[contFileInit + 1][init + 2], array[contFileInit + 2][init + 2], array[contFileInit + 2][init + 1]] == ["_", "|", "|", " "]
            finalNumber = finalNumber + "7"
          else
            finalNumber = finalNumber + "?"
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
