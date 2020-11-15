classdef ADALINE
   properties
      %Weight matrix
      W; 
      %Bias 
      b;
      %Activation function
      linearActivation;
   end
   
   methods
       %Constructor
       function obj = ADALINE(n,m)
           %Initialize the matrix with random weights
           obj.W = zeros(n,m);
           
           for i = 1:n
               for j = 1:m
                  obj.W(i,j) = rand(); 
               end 
           end
           
           %Do the same with the bias
           obj.b = zeros(n,1);
           for i = 1:n
              obj.b(i) = rand(); 
           end
           %The activation function 
           obj.linearActivation = Linear();
       end
       
       function output = compute(obj,input)
           output = arrayfun(@(x) obj.linearActivation.compute(x),obj.W*input +obj.b );
       end
       
       function [obj,errorData] = train(obj,data, dataAns,alpha,epochs)
           
           errorData = [];
           dataSize = length(dataAns);
           for i = 1:epochs
               errorsInEpoch = [];
               for j = 1:dataSize
                 %Se obtiene el error
                  err = dataAns(:,j) - obj.compute(data(:,j));
                  errorsInEpoch = [errorsInEpoch, norm(err)^2];
                  obj.W  = obj.W + 2*alpha*err*data(:,j)';
                  obj.b = obj.b + 2*alpha*err;
               end
               errorData = [errorData,mean(errorsInEpoch)];
           end 
       end
       
   end
    
    
    
    
    
end