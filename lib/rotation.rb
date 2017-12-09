class Rotation
  include Math

  PERIOD = 3.68
  RADIUS = 0.12
  SPEED =  2 * PI * 0.12 / PERIOD

  def self.rotation_time(degree)
    degree_rad = PI / 180 * degree
    second = RADIUS * degree_rad / SPEED
    second.round(4)
  end
end
