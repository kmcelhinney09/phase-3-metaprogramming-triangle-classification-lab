class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize (side1,side2,side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if self.is_triangle?
      if self.side1 == self.side2 && self.side1 == self.side3
        :equilateral
      elsif self.side1 == self.side2 || self.side1 == self.side3 || self.side2 == self.side3
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end

  def is_triangle?
    side_compare_one = self.side2 + self.side3 > self.side1
    side_compare_two = self.side1 + self.side3 > self.side2
    side_compare_three = self.side1 + self.side2 > self.side3
    
    if self.side1 > 0 && self.side2 > 0 && self.side3 > 0
      if side_compare_one && side_compare_two && side_compare_three
        return true
      end
    else
      return false
    end
  end

  class TriangleError < StandardError
    def message
      "These three values do not equal a triangle."
    end
  end

end
