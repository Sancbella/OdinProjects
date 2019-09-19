class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
    @hours = nil
  end
  # def padded
  #   @minutes = (@seconds%3600)%60 / 60 ## gets minutes from the seconds
  #   @timer_seconds = (@seconds%3600)%60 ## gets the remainder seconds when divided in hours
  #   @hours = @seconds / 3600
  #   if @minutes.to_s.length != 2 then
  #     @minutes = (0.to_s + @minutes.to_s)
  #   end
  #   if @timer_seconds.to_s.length != 2 then
  #     @timer_seconds = (0.to_s + @timer_seconds.to_s)
  #   end
  #   if @hours.to_s.length != 2 then
  #     @hours = (0.to_s + @hours.to_s)
  #   end
  # end
  def time_string
    minutes = @seconds / 60 ## gets minutes from the seconds
    remainSeconds = @seconds%3600 ## gets the remainder seconds when divided in hours
    hours = @seconds / 3600 ## divides seconds into hours
    puts minutes 
    puts remainSeconds 
    puts hours
    puts remainSeconds/60
    puts remainSeconds%60
    sprintf("%02d:%02d:%02d", hours, remainSeconds/60, remainSeconds%60)
    ## formats a string with given arguement
    ## % represents each argument from left to right
    ## 02 specifies absolute arguement number 
    #...meaning it will provide 0's or trim based on argument
    ## d converts argument to a decimal (to interval)
  end
  # def time_string
  #   self.padded
  #    x = (@hours + ":" + @minutes + ":" + @timer_seconds).to_s
  #    x
  # end
end
