class Polynomial
  attr_accessor :poly_string
  def initialize(coeff_array)
    #Handles case where only a constant is given
    if coeff_array.length < 2
      raise ArgumentError, 'Need at least 2 coefficients'
    end
    
    @poly_string = ""
    
    #We will get the length, length - 1 = first coefficient to start
    #Continuously pop off last element until the count is 1, then append that one
    #need to handle negative as well. 
    cur_degree = coeff_array.length 
    
    factors = coeff_array.map do |elem|
      cur_degree = cur_degree - 1
      factor = ""
      unless elem == 0

        factor << ((cur_degree == 0 || elem.abs != 1) ? elem.to_s : (elem > 0) ? '' : '-')

        factor << ((cur_degree ==  0) ? '' : (cur_degree == 1) ? 'x' : "x^#{cur_degree}")
        
      end
    end.compact

    @poly_string = factors.join("+").gsub("+-", "-")
    @poly_string = @poly_string.empty? ? "0" : @poly_string
  end


  def to_s
    @poly_string
  end




end
