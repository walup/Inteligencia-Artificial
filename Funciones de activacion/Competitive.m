classdef Competitive < ActivationFunction
    methods
        function obj = Competitive()
            obj.name = "Competitive";
        end
        
        function y = compute(obj,x)
            %First obtain the maximum element of the array
            %This is O(n)
            m = -Inf;
            index = 0;
            for i = 1:length(x)
               if(x(i) > m)
                   m = x(i);
                   index = i;
               end
            end
            
            y = zeros(length(x),1);
            y(index) = 1;
        end
    end
    
end