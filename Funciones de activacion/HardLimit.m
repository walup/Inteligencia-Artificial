classdef HardLimit < ActivationFunction
    
  methods
      function obj = HardLimit()
         obj.name = "Hard Limit";  
      end
      
      function y = compute(obj,x)
          if(x<0)
              y = 0;
          else
              y = 1;
          end
      end
  end
  
end