classdef SymmetricSaturatingLinear < ActivationFunction
    methods
        function obj = SymmetricSaturatingLinear()
            obj.name = "Symmetric Saturating Linear";
        end
        
        function y = compute(obj,x)
            if(x<-1)
                y = -1;
            elseif(-1 <= x && x <=1)
                y = x;
            else
                y = 1;
            end 
        end
    end
    
    
end