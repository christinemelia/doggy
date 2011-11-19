class SayController < ApplicationController
  def hello
    @time = Time.now
  end

  def goodbye
  end
  
  def files
    @files = Dir.glob('*')
    return @files
  end

end
