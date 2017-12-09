require "./lib/rotation.rb"
require "./lib/pitch.rb"

class Message

  attr_accessor :gpio, :radius, :pitch

  def initialize(gpio, radius)
    @gpio = gpio
    @radius = radius.to_f
    @pitch = Pitch.new(17)
  end

  def send
    @thread = Thread.new{
      time = Rotation.rotation_time(radius)
      system("echo #{gpio} > /sys/class/gpio/export")
      system("echo out > /sys/class/gpio/gpio#{gpio}/direction")
      system("echo 1 > /sys/class/gpio/gpio#{gpio}/value")
      sleep(time)
      system("echo #{gpio} > /sys/class/gpio/unexport")
    }
   @thread.join
   @pitch.start
  end
end
