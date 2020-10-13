classdef Linear < ActivationFunction
    
    methods
        function obj = Linear()
            obj.name = "Linear";
            
        end
        
        function y =compute(obj,x)
            y = x;
        end
    end
end