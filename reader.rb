require './symbol.rb'
require './parser.rb'

class Calc_Reader
  def initialize(input)
    @input = input
    @get_last = false
  end
 
  def get_charsymbol
    if @get_last then
      @get_last = false
      return @last_charsymbol
    end
 
    charsymbol = Charsymbol.new

    @input.lstrip!
 
    case @input
      when /\A\(/ then
        charsymbol.type = Charsymbol::LBracket
      when /\A\)/ then
        charsymbol.type = Charsymbol::RBracket
      when /\A\^/ then
        charsymbol.type = Charsymbol::Index
      when /\A\*/ then
        charsymbol.type = Charsymbol::Multiply
      when /\A\// then
        charsymbol.type = Charsymbol::Divide
      when /\A\+/ then
        charsymbol.type = Charsymbol::Plus
      when /\A-/ then
        charsymbol.type = Charsymbol::Minus

      #when /d+?/ #Integers only
      when /\A\d+(\.\d+)?/ #Floats
        charsymbol.type = Charsymbol::Number
        charsymbol.value = $&.to_f # Thanks google
      
      when ''
        charsymbol.type = Charsymbol::End
      end
  
    if charsymbol.unknown? then
      raise ('Unknown Operand') 
    end
    @input = $'  # <== google - I was having a hard time with this
 
    @last_charsymbol = charsymbol
    charsymbol
  end
 
  def go_back
    @get_last = true
  end
end