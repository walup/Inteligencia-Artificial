classdef Perceptron
   properties
      %The weights matrix
      W;
      %The bias 
      b;
      %Hard limit
      hl;
   end
   
   methods
       %Method to initialize a perceptron 
       %n is number of neurons, m is input size
       function obj = Perceptron(n,m)
          
          %We will initialize the matrix with random weights
          obj.W = zeros(n,m);
          for i = 1:n
              for j = 1:m
                 obj.W(i,j) = rand(); 
              end 
          end
          %We do the same with the bias 
          obj.b = zeros(n,1);
          for i = 1:n
             obj.b = rand(); 
          end
          obj.hl = HardLimit();
       end
       
       %Method to compute the answer to an input
       function output = compute(obj,input)
           output = arrayfun(@(x)obj.hl.compute(x),obj.W*input + obj.b);
       end
       
       %Method to train the perceptron with some input data (supervised learning)
       function [obj,errorData] = train(obj, data,dataAns, epochs)
           n = size(obj.W,1);
           dataSize = length(dataAns);
           errorData = [];
           i = 1;
           %We will consider two stop conditions
           while(i <= epochs)
               for j = 1:dataSize
                   err = dataAns(:,j)-obj.compute(data(:,j));
                   errorData = [errorData,norm(err)];
                   %This is the part of the code that does
                   %the iterations 
                   obj.W = obj.W + err*data(:,j)';
                   obj.b = obj.b + err;
               end
               i = i+1;
           end    
       end
   end
    
    
    
end