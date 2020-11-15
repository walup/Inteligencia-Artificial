classdef ThreeLayerNetwork
   %Implementation for a three layer network 
   %Training algorithm is backpropagation
   properties
       %For this one we will explicitly define the weight matrices and the
       %bias
       %Weight matrices
       W1;
       W2;
       %Biases
       b1;
       b2;
       %Activation functions
       a1;
       a2;
       %Derivative functions
       d1;
       d2;
   end
   
   methods
       function obj = ThreeLayerNetwork(flNeurons, flInputs, outputs, activation1, activation2, derivative1, derivative2)
          % Initialize the weight matrices 
          obj.W1 = rand(flNeurons,flInputs);
          obj.W2 = rand(outputs, flNeurons);
          %Initialize the biases
          obj.b1 = rand(flNeurons,1);
          obj.b2 = rand(outputs,1);
          %Initialize the two activation functions and derivatives
          obj.a1 = activation1;
          obj.a2 = activation2;
          obj.d1 = derivative1;
          obj.d2 = derivative2;
       end
       
       %We will need two outputs out of this function since 
       %we want to bakpropagate. 
       function output = compute(obj, input)
           flOutput = arrayfun(@(x) obj.a1.compute(x),obj.W1*input +obj.b1);
           slOutput = arrayfun(@(x) obj.a2.compute(x),obj.W2*flOutput + obj.b2);
           output{1} = flOutput;
           output{2}  = slOutput;
       end
       
       %Training by backpropagation
       function [obj, errors] = train(obj, data, targets, alpha, epochs)
          n = length(targets); 
          errors = [];
          for i = 1:epochs
             errorsInEpoch = [];
             for j = 1:n
                 input = data(:,j);
                 output = obj.compute(input);
                 flOutput = output{1};
                 slOutput = output{2};
                 %Calculamos el error
                 err = targets(:,j) - slOutput;
                 errorsInEpoch = [errorsInEpoch, norm(err)];
                 %Hacemos propagación de errores 
                 obj = obj.backpropagate(alpha, input,flOutput,slOutput,err);
             end
             errors = [errors, mean(errorsInEpoch)];
          end
       end
       
       function [obj,errors] = trainWithMomentum(obj,data,targets,alpha,gamma,epochs)
           n = length(targets);
           errors = [];
           lastDelta1 = 0;
           lastDelta2 = 0;
           lastbDelta1 = 0;
           lastbDelta2 = 0;
   
           for i = 1:epochs
              errorsInEpoch = [];
              for j = 1:n
                 input = data(:,j); 
                 output = obj.compute(input);
                 flOutput = output{1};
                 slOutput = output{2};
                 err = targets(:,j)-slOutput;
                 errorsInEpoch = [errorsInEpoch, norm(err)];
                 [obj,deltas] = obj.backpropagateWithMomentum(alpha,gamma, input, flOutput, slOutput, err,lastDelta1,lastDelta2,lastbDelta1, lastbDelta2);
                 lastDelta1 = deltas{1};
                 lastDelta2 = deltas{2};
                 lastbDelta1 = deltas{3};
                 lastbDelta2 = deltas{4};
              end
              errors = [errors,mean(errorsInEpoch)];
            
           end
           
       end
       
       function obj = backpropagate(obj,alpha, input,flOutput, slOutput, err)
           
          f2 = arrayfun(obj.d2, slOutput);
          F2 = zeros(length(f2),length(f2));

          for i = 1:length(f2)
              F2(i,i) = f2(i);
          end
          
          s2 = -2*F2*err;
          
          f1 = arrayfun(obj.d1,flOutput);
          F1 = zeros(length(f1),length(f1));
          for i = 1:length(f1)
              F1(i,i) = f1(i);
          end
          s1 = F1*obj.W2'*s2;
          
          %Update the second weight matrix
          obj.W2 = obj.W2 - alpha*s2*flOutput';
          obj.b2 = obj.b2 - alpha*s2;
          %Update the first weight matrix 
          obj.W1 = obj.W1 - alpha*s1*input';
          obj.b1 = obj.b1 - alpha*s1;
       end
       
       function [obj,deltas] = backpropagateWithMomentum(obj,alpha,gamma,input,flOutput,slOutput,err, lastDelta1,lastDelta2, lastbDelta1, lastbDelta2)
          f2 = arrayfun(obj.d2, slOutput);
          F2 = zeros(length(f2),length(f2));

          for i = 1:length(f2)
              F2(i,i) = f2(i);
          end
          s2 = -2*F2*err;
          
          f1 = arrayfun(obj.d1,flOutput);
          F1 = zeros(length(f1),length(f1));
          for i = 1:length(f1)
              F1(i,i) = f1(i);
          end
          s1 = F1*obj.W2'*s2;
          deltas = {};
          %Update the second weight matrix
          delta2 = gamma*lastDelta2 -(1-gamma)*alpha*s2*flOutput';
          deltab2 = gamma*lastbDelta2-(1-gamma)*alpha*s2;
          obj.W2 = obj.W2 +delta2;
          obj.b2 = obj.b2 + deltab2;
          %Update the first weight matrix 
          delta1 = gamma*lastDelta1 -(1-gamma)*alpha*s1*input';
          deltab1 = gamma*lastbDelta1 -(1-gamma)*alpha*s1;
          obj.W1 = obj.W1 + delta1;
          obj.b1 = obj.b1 + deltab1;
          
          deltas{1} = delta1;
          deltas{2} = delta2;
          deltas{3} = deltab1;
          deltas{4} = deltab2;
       end
   end
   
end