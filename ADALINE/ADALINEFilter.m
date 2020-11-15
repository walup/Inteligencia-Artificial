classdef ADALINEFilter
   properties 
       %ADALIND Network
       network;
       %Number of delays to consider
       k;
       
   end
   
   
   methods
       %We will take k delays for our filter
       function obj = ADALINEFilter(k)
           obj.k = k;
           obj.network = ADALINE(1,k);  
       end
       
       function [obj, signalPredictions] = predictSignal(obj,initialDelay,signal,alpha)
           if(length(initialDelay)~= obj.k)
               error("Initial delay has the wrong size")
           end
           
           n = length(signal);
           %The signal prediction array 
           signalPredictions = zeros(n,1);
           extendedSignal = [initialDelay,signal];
           
           for i = obj.k+1:length(extendedSignal)
              %The delay array to give as input to the adalind filter 
              delay =  extendedSignal(i-obj.k:i-1)';
              resp = obj.network.compute(delay);
              signalPredictions(i-obj.k) = resp;
              [obj.network,~] = obj.network.train(delay,signal(i-obj.k),alpha,1);
           end
       end

   end
    
    
    
    
end