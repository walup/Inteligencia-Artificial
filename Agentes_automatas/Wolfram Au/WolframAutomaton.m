classdef WolframAutomaton
   
    properties
       %Regla del automata
       %Para usar reglas predefinidas como la 30, 60, 90 etc. use el generador de reglas 
       rule;
       ruleName;
    end
    
    
    methods
        function obj = WolframAutomaton(rule,ruleName)
           obj.rule = rule;
           obj.ruleName = ruleName;
        end
        
        function grid = runAutomaton(obj,steps)
            %El tamaño de la red
            gridSize = steps;
            if(mod(steps,2) == 0)
                gridSize = steps + 1;
            end
            
            
            %Vamos a crear una red
            grid = zeros(gridSize + 1,gridSize*3);
            [n,m] = size(grid);
            initialPoint = (m + 1)/2;
            %Inicializamos el primer cuadro como 1
            grid(1,initialPoint) = 1;
            %Evolucionamos el automata acorde a la regla
            for i = 2:n
                for j = 2:m-1
                    ruleIndex = grid(i-1,j-1)*2^2 +grid(i-1,j)*2^1 + grid(i-1,j+1) +1;
                    grid(i,j) = obj.rule(ruleIndex);
                end
            end
        end   
    end
    
    
    
end