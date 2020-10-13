classdef ReLU < ActivationFunction
    
    methods 
        function obj = ReLU()
           obj.name = "ReLU"; 
        end
        
        function y = compute(obj,x)
           if(x < 0)
               y = 0;
           else
               y = x;
           end
        end
    end
    
    
end