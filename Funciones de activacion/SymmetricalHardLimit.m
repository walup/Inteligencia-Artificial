classdef SymmetricalHardLimit < ActivationFunction 
    
    methods
        function obj = SymmetricalHardLimit()
            obj.name = "Symmetrical Hard Limit";            
        end
        
        function y = compute(obj,x)
           if(x<0)
               y = -1;
           else
               y = 1;
           end
        end
    end
    
    
end