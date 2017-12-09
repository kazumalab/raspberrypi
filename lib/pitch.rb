class Pitch

  attr_accessor :gpio
  @@TIME = 4

  def initialize(gpio)
    @gpio = gpio
  end

  def start
    @thread = Thread.new{
      system("echo #{gpio} > /sys/class/gpio/export")
      system("echo out > /sys/class/gpio/gpio#{gpio}/direction")
      system("echo 1 > /sys/class/gpio/gpio#{gpio}/value")
      sleep(@@TIME)
      system("echo #{gpio} > /sys/class/gpio/unexport")
    }
   @thread.join
  end
end
