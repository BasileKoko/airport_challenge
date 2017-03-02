
class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def landed
    fail 'Sorry the plane has already landed' if !flying
    @flying = false
  end

  def taken_off
    fail 'Sorry the plane is flying' if flying
    @flying = true
  end

end
