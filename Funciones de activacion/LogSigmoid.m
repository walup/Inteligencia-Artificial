classdef LogSigmoid < ActivationFunction

    methods

       function obj = LogSigmoid()
          obj.name = "Log Sigmoid"; 
       end
       
       function y = compute(obj,x)
           y = 1/(1+exp(-x));
       end
       
      
    end

end