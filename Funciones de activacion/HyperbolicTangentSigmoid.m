classdef HyperbolicTangentSigmoid < ActivationFunction
    
    methods
        function obj = HyperbolicTangentSigmoid()
            obj.name = "Hyperbolic Tangent Sigmoid";
        end
        %This is literally cosh(x)/sinh(x)
        function y = compute(obj,x)
           y = (exp(x)-exp(-x))/(exp(x)+exp(-x)); 
        end
    end
    
end