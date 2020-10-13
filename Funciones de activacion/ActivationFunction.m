classdef ActivationFunction
   
    properties
       %Nombre de la función de activacion  
       name; 
    end
   methods(Abstract)
      compute(obj,x) 
   end
   methods
           
       function y = plotActivationFunction(obj,xMin,xMax,points)
           x = linspace(xMin,xMax,points);
           y = arrayfun(@(s)obj.compute(s),x);
           maxY = max(y);
           minY = min(y);
           %Create a figure
           h = figure();
           title(obj.name)
           hold on
           plot(x,y);
           xlabel('x');
           ylabel('Activation function')
           ylim([minY-0.2,maxY+0.2])
           hold off
       end
       
   end
    
    
    
end