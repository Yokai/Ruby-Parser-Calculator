require './reader.rb'

=begin
    TODO:  Exponents - Should be first call in mult_div
=end
 
class Parser
  def parse(input)


    @reader = Calc_Reader.new(input)

    value = evaluation 
    charsymbol = @reader.get_charsymbol


    if charsymbol.type == Charsymbol::End
      value
    else
      raise 'No End to Expression'
    end
  end
 
  def evaluation
    value = mult_div
 
 
    charsymbol = @reader.get_charsymbol

    while (charsymbol.type == Charsymbol::Plus ||  charsymbol.type == Charsymbol::Minus)
      value2 = mult_div
 
      case charsymbol.type

      when Charsymbol::Plus
        value += value2
      when Charsymbol::Minus
        value -= value2
      end
 
      charsymbol = @reader.get_charsymbol
    end
    
    @reader.go_back
 
    value
  end

 
  def mult_div
    value = get_digit
 
    charsymbol = @reader.get_charsymbol
    while (charsymbol.type == Charsymbol::Multiply || charsymbol.type == Charsymbol::Divide)
      denominator = get_digit
 
      case charsymbol.type
      when Charsymbol::Multiply
        value *= denominator
      else
        value /= denominator
      end
      charsymbol = @reader.get_charsymbol
    end

    @reader.go_back

    value
  end
 
  def get_digit
    charsymbol = @reader.get_charsymbol

    case charsymbol.type
    when Charsymbol::LBracket
      value = evaluation
 
      next_charsymbol = @reader.get_charsymbol
     unless next_charsymbol.type == Charsymbol::RBracket
        raise 'Missing Bracket'
      end
    when Charsymbol::Number
      value = charsymbol.value
    else
      raise 'NAN'
    end
 
    value
  end
end