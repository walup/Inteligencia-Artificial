classdef SaturatingLinear < ActivationFunction
    methods
        function obj = SaturatingLinear()
            obj.name = "Saturating Linear";
        end
        
        function y = compute(obj,x)
           if(x < 0)
               y = 0;
           elseif (x >= 0 && x <=1)
               y = x;
           else
               y = 1;
           end
        end
    end
end