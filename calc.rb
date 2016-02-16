require './parser'
 
parser = Parser.new
 
loop do
  begin
    print 'Enter String: '
    puts parser.parse(gets)
  rescue RuntimeError
    puts "Error occured: #{$!}"
  end
end