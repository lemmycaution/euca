require 'stringio'

module ::Kernel
  
  def called_from(level=1)
    arrs = caller((level||1)+1)  or return
    arrs[0] =~ /:(\d+)(?::in `(.*)')?/ ? [$`, $1.to_i, $2] : nil
  end
  
  def sh cmd 
    output = StringIO.new

    Euca.logger.debug "[sh] #{cmd}" 

    IO.popen(cmd) do |pipe|
      pipe.each do |line|
        output.puts line
        Euca.logger.debug line
      end
    end
  
    output.string
  end
  
end