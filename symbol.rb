class Charsymbol
  Number   = 0
  Plus     = 1
  Minus    = 2
  Multiply = 3
  Divide   = 4
  Index    = 5  
  LBracket = 6
  RBracket = 7
  End      = 8
 
  attr_accessor :type
  attr_accessor :value
 
  def initialize
    @type = nil
    @value = nil
  end
 
  def unknown?
    @type.nil?
  end
end